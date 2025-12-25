from rest_framework import viewsets, status
from rest_framework.decorators import action, api_view, permission_classes
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated, AllowAny
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from .models import *
from .serializers import *

class ProductViewSet(viewsets.ReadOnlyModelViewSet):
    """API для товаров"""
    queryset = Product.objects.filter(is_active=True)
    serializer_class = ProductSerializer
    permission_classes = [AllowAny]
    
    @action(detail=False, methods=['get'])
    def by_category(self, request):
        category = request.query_params.get('category')
        if category:
            products = self.queryset.filter(category=category)
        else:
            products = self.queryset
        serializer = self.get_serializer(products, many=True)
        return Response(serializer.data)


class UserProfileViewSet(viewsets.ViewSet):
    """API для профиля пользователя"""
    permission_classes = [IsAuthenticated]
    
    @action(detail=False, methods=['get'])
    def me(self, request):
        """Получить данные текущего пользователя"""
        profile, created = UserProfile.objects.get_or_create(user=request.user)
        serializer = UserProfileSerializer(profile)
        return Response(serializer.data)
    
    @action(detail=False, methods=['put'])
    def update_profile(self, request):
        """Обновить профиль"""
        serializer = UpdateProfileSerializer(data=request.data)
        if serializer.is_valid():
            user = request.user
            
            if 'first_name' in serializer.validated_data:
                user.first_name = serializer.validated_data['first_name']
            if 'last_name' in serializer.validated_data:
                user.last_name = serializer.validated_data['last_name']
            if 'email' in serializer.validated_data:
                user.email = serializer.validated_data['email']
            
            user.save()
            
            profile, created = UserProfile.objects.get_or_create(user=user)
            if 'phone' in serializer.validated_data:
                profile.phone = serializer.validated_data['phone']
                profile.save()
            
            return Response({'message': 'Профиль обновлён'})
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class FavoriteViewSet(viewsets.ViewSet):
    """API для избранного"""
    permission_classes = [IsAuthenticated]
    
    def list(self, request):
        """Получить список избранного"""
        favorites = Favorite.objects.filter(user=request.user)
        serializer = FavoriteSerializer(favorites, many=True)
        return Response(serializer.data)
    
    @action(detail=False, methods=['post'])
    def add(self, request):
        """Добавить в избранное"""
        product_id = request.data.get('product_id')
        try:
            product = Product.objects.get(id=product_id)
            favorite, created = Favorite.objects.get_or_create(user=request.user, product=product)
            if created:
                return Response({'message': 'Добавлено в избранное'}, status=status.HTTP_201_CREATED)
            return Response({'message': 'Уже в избранном'})
        except Product.DoesNotExist:
            return Response({'error': 'Товар не найден'}, status=status.HTTP_404_NOT_FOUND)
    
    @action(detail=False, methods=['post'])
    def remove(self, request):
        """Удалить из избранного"""
        product_id = request.data.get('product_id')
        deleted = Favorite.objects.filter(user=request.user, product_id=product_id).delete()
        if deleted[0]:
            return Response({'message': 'Удалено из избранного'})
        return Response({'error': 'Не найдено в избранном'}, status=status.HTTP_404_NOT_FOUND)


class CartViewSet(viewsets.ViewSet):
    """API для корзины"""
    permission_classes = [IsAuthenticated]
    
    def list(self, request):
        """Получить корзину"""
        cart_items = Cart.objects.filter(user=request.user)
        serializer = CartItemSerializer(cart_items, many=True)
        return Response(serializer.data)
    
    @action(detail=False, methods=['post'])
    def add(self, request):
        """Добавить в корзину"""
        product_id = request.data.get('product_id')
        quantity = request.data.get('quantity', 1)
        
        try:
            product = Product.objects.get(id=product_id)
            cart_item, created = Cart.objects.get_or_create(
                user=request.user, 
                product=product,
                defaults={'quantity': quantity}
            )
            if not created:
                cart_item.quantity += quantity
                cart_item.save()
            
            return Response({'message': 'Добавлено в корзину'}, status=status.HTTP_201_CREATED)
        except Product.DoesNotExist:
            return Response({'error': 'Товар не найден'}, status=status.HTTP_404_NOT_FOUND)
    
    @action(detail=False, methods=['post'])
    def update_quantity(self, request):
        """Изменить количество"""
        product_id = request.data.get('product_id')
        quantity = request.data.get('quantity')
        
        try:
            cart_item = Cart.objects.get(user=request.user, product_id=product_id)
            if quantity <= 0:
                cart_item.delete()
                return Response({'message': 'Удалено из корзины'})
            else:
                cart_item.quantity = quantity
                cart_item.save()
                return Response({'message': 'Количество обновлено'})
        except Cart.DoesNotExist:
            return Response({'error': 'Товар не найден в корзине'}, status=status.HTTP_404_NOT_FOUND)
    
    @action(detail=False, methods=['post'])
    def clear(self, request):
        """Очистить корзину"""
        Cart.objects.filter(user=request.user).delete()
        return Response({'message': 'Корзина очищена'})


class OrderViewSet(viewsets.ViewSet):
    """API для заказов"""
    permission_classes = [IsAuthenticated]
    
    def list(self, request):
        """История заказов"""
        orders = Order.objects.filter(user=request.user)
        serializer = OrderSerializer(orders, many=True)
        return Response(serializer.data)
    
    @action(detail=False, methods=['post'])
    def create_order(self, request):
        """Создать заказ из корзины"""
        serializer = CreateOrderSerializer(data=request.data)
        if not serializer.is_valid():
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        
        cart_items = Cart.objects.filter(user=request.user)
        if not cart_items.exists():
            return Response({'error': 'Корзина пуста'}, status=status.HTTP_400_BAD_REQUEST)
        
        # Рассчитать общую стоимость
        total_price = sum(item.product.price * item.quantity for item in cart_items)
        
        # Создать заказ
        address = Address.objects.get(id=serializer.validated_data['address_id'], user=request.user)
        order = Order.objects.create(
            user=request.user,
            address=address,
            total_price=total_price,
            notes=serializer.validated_data.get('notes', '')
        )
        
        # Создать товары заказа
        for cart_item in cart_items:
            OrderItem.objects.create(
                order=order,
                product=cart_item.product,
                quantity=cart_item.quantity,
                price=cart_item.product.price
            )
        
        # Очистить корзину
        cart_items.delete()
        
        return Response({
            'message': 'Заказ создан',
            'order_id': order.id
        }, status=status.HTTP_201_CREATED)


@api_view(['POST'])
@permission_classes([AllowAny])
def register(request):
    """Регистрация"""
    username = request.data.get('username')
    email = request.data.get('email')
    password = request.data.get('password')
    
    if User.objects.filter(username=username).exists():
        return Response({'error': 'Пользователь уже существует'}, status=status.HTTP_400_BAD_REQUEST)
    
    user = User.objects.create_user(username=username, email=email, password=password)
    UserProfile.objects.create(user=user)
    
    return Response({'message': 'Регистрация успешна'}, status=status.HTTP_201_CREATED)


@api_view(['POST'])
@permission_classes([AllowAny])
def login_view(request):
    """Вход"""
    username = request.data.get('username')
    password = request.data.get('password')
    
    user = authenticate(username=username, password=password)
    if user:
        login(request, user)
        return Response({'message': 'Вход выполнен'})
    return Response({'error': 'Неверные данные'}, status=status.HTTP_401_UNAUTHORIZED)


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def logout_view(request):
    """Выход"""
    logout(request)
    return Response({'message': 'Выход выполнен'})