from django.urls import path, include
from rest_framework.routers import DefaultRouter
from . import views

router = DefaultRouter()
router.register('products', views.ProductViewSet, basename='products')
router.register('profile', views.UserProfileViewSet, basename='profile')
router.register('favorites', views.FavoriteViewSet, basename='favorites')
router.register('cart', views.CartViewSet, basename='cart')
router.register('orders', views.OrderViewSet, basename='orders')

urlpatterns = [
    path('', include(router.urls)),
    path('auth/register/', views.register),
    path('auth/login/', views.login_view),
    path('auth/logout/', views.logout_view),
]
