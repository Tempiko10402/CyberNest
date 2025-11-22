/* ============================================
   MAIN.JS - Основная логика магазина
   ============================================ */

// Данные товаров
const products = [
    { 
        id: 1, 
        name: 'MacBook Pro M3', 
        price: 159990, 
        image: 'images/macbookpro.jpeg',
        desc: '16" • 36GB RAM • 1TB SSD',
        category: 'laptops'
    },
    { 
        id: 2, 
        name: 'Sony WH-1000XM5', 
        price: 29990, 
        image: 'https://via.placeholder.com/300x200.png?text=Sony',
        desc: 'Шумоподавление • 30ч работы',
        category: 'accessories'
    },
    { 
        id: 3, 
        name: 'Samsung Galaxy S24 Ultra', 
        price: 79990, 
        image: 'https://via.placeholder.com/300x200.png?text=Galaxy+S24',
        desc: '512GB • AI Camera',
        category: 'phones'
    },
    { 
        id: 4, 
        name: 'Apple Watch Series 9', 
        price: 44990, 
        image: 'https://via.placeholder.com/300x200.png?text=Apple+Watch',
        desc: 'GPS + Cellular',
        category: 'watches'
    },
    { 
        id: 5, 
        name: 'iPad Air M2', 
        price: 64990, 
        image: 'https://via.placeholder.com/300x200.png?text=iPad+Air',
        desc: '11" • 256GB',
        category: 'tablets'
    },
    { 
        id: 6, 
        name: 'JBL Charge 5', 
        price: 14990, 
        image: 'https://via.placeholder.com/300x200.png?text=JBL',
        desc: 'Waterproof • 20ч',
        category: 'accessories'
    }
];

// Корзина
let cart = JSON.parse(localStorage.getItem('cart')) || [];

// Форматирование цены
function formatPrice(price) {
    return price.toLocaleString('ru-RU') + ' ₽';
}

// Показать уведомление
function showNotification(message) {
    const notification = document.getElementById('notification');
    if (!notification) return;
    
    notification.querySelector('.notification-text').textContent = message;
    notification.classList.add('show');
    
    setTimeout(() => {
        notification.classList.remove('show');
    }, 3000);
}

// Добавить в корзину
function addToCart(productId) {
    const product = products.find(p => p.id === productId);
    if (!product) return;

    const cartItem = cart.find(item => item.id === productId);
    
    if (cartItem) {
        cartItem.quantity++;
    } else {
        cart.push({ ...product, quantity: 1 });
    }
    
    localStorage.setItem('cart', JSON.stringify(cart));
    updateCartBadge();
    showNotification(`${product.name} добавлен в корзину`);
}

// Обновить счётчик корзины
function updateCartBadge() {
    const count = cart.reduce((sum, item) => sum + item.quantity, 0);
    const badges = document.querySelectorAll('.action-btn[href="#cart"] .action-badge');
    badges.forEach(badge => {
        badge.textContent = count;
        badge.style.display = count > 0 ? 'block' : 'none';
    });
}

// Переключение темы
function switchTheme() {
    const themes = ['theme-dark', 'theme-cyber', 'theme-purple'];
    const body = document.body;
    const currentTheme = body.className || 'theme-dark';
    const currentIndex = themes.indexOf(currentTheme);
    const nextIndex = (currentIndex + 1) % themes.length;
    body.className = themes[nextIndex];
    
    const themeNames = {
        'theme-dark': 'Тёмная тема',
        'theme-cyber': 'Киберпанк',
        'theme-purple': 'Фиолетовая тема'
    };
    
    showNotification(themeNames[themes[nextIndex]]);
}

// Создать карточку товара
function createProductCard(product, delay = 0) {
    return `
        <div class="product-card card-animate" style="animation-delay: ${delay}s" data-product="${product.id}">
            <div class="card-glow"></div>
            <div class="product-image-wrapper">
                <img src="${product.image}" alt="${product.name}">
                <div class="product-badge">NEW</div>
                <button class="favorite-btn" data-product-id="${product.id}">❤️</button>
            </div>
            <div class="product-info">
                <h3>${product.name}</h3>
                <p class="product-desc">${product.desc}</p>
                <div class="rating">
                    <span class="stars">⭐⭐⭐⭐⭐</span>
                    <span class="reviews">(${Math.floor(Math.random() * 100 + 50)} отзывов)</span>
                </div>
                <p class="price gradient-text">${formatPrice(product.price)}</p>
                <div class="product-actions">
                    <a href="#product-${product.id}" class="btn btn-secondary ripple">
                        <span>Подробнее</span>
                    </a>
                    <button class="btn btn-primary ripple add-to-cart" onclick="addToCart(${product.id})">
                        <span class="btn-icon">🛒</span>
                    </button>
                </div>
            </div>
        </div>
    `;
}

// Отобразить товары
function displayProducts(productsToShow = products, containerId = 'productsGrid') {
    const grid = document.getElementById(containerId);
    if (!grid) return;
    
    grid.innerHTML = productsToShow.map((product, index) => 
        createProductCard(product, index * 0.1)
    ).join('');
    
    // Инициализация кнопок после создания
    initializeFavoriteButtons();
    initializeRippleEffect();
}

// Инициализация при загрузке
document.addEventListener('DOMContentLoaded', function() {
    displayProducts();
    updateCartBadge();
    
    // Фильтр цены
    const priceRange = document.querySelector('.price-range');
    if (priceRange) {
        priceRange.addEventListener('input', function() {
            const value = parseInt(this.value).toLocaleString('ru-RU');
            const priceValue = document.querySelector('.price-value');
            if (priceValue) {
                priceValue.textContent = `до ${value} ₽`;
            }
        });
    }
});

// Ripple эффект для кнопок
function initializeRippleEffect() {
    document.querySelectorAll('.ripple').forEach(button => {
        button.addEventListener('click', function(e) {
            const ripple = document.createElement('span');
            ripple.classList.add('ripple-effect');
            this.appendChild(ripple);
            
            const rect = this.getBoundingClientRect();
            const size = Math.max(rect.width, rect.height);
            ripple.style.width = ripple.style.height = size + 'px';
            ripple.style.left = e.clientX - rect.left - size/2 + 'px';
            ripple.style.top = e.clientY - rect.top - size/2 + 'px';
            
            setTimeout(() => ripple.remove(), 600);
        });
    });
}

// Экспорт для использования в других модулях
window.TechLuxury = {
    products,
    cart,
    formatPrice,
    showNotification,
    addToCart,
    updateCartBadge,
    displayProducts,
    createProductCard
};