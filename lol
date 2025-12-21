<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cyber Nest - Премиум электроника</title>
    <link rel="stylesheet" href="style.css">
</head>
<body class="theme-dark">
    <!-- Анимированный фон -->
    <div class="particles-bg">
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
    </div>

    <!-- Всплывающее уведомление -->
    <div class="notification" id="notification">
        <span class="notification-icon">✓</span>
        <span class="notification-text">Товар добавлен в корзину</span>
    </div>

    <!-- Шапка -->
    <header class="glass-effect">
        <div class="container">
            <div class="header-top">
                <h1 class="logo-animated">
                    <a href="#home">
                        <span class="logo-icon">⚡</span>
                        CYBER NEST
                    </a>
                </h1>

                <!-- Поиск -->
                <div class="search-container">
                    <input type="text" class="search-input" placeholder="Поиск товаров..." id="searchInput">
                    <button class="search-btn">🔍</button>
                    <div class="search-suggestions" id="searchSuggestions"></div>
                </div>

                <!-- Действия пользователя -->
                <div class="user-actions">
                    <a href="#profile" class="action-btn">
                        <span class="action-icon">👤</span>
                        <span class="action-label">Профиль</span>
                    </a>
                    <a href="#favorites" class="action-btn">
                        <span class="action-icon">❤️</span>
                        <span class="action-label">Избранное</span>
                        <span class="action-badge" style="display:none;">0</span>
                    </a>
                    <a href="#cart" class="action-btn">
                        <span class="action-icon">🛒</span>
                        <span class="action-label">Корзина</span>
                        <span class="action-badge">0</span>
                    </a>
                    <button class="theme-switcher" onclick="switchTheme()">
                        <span class="theme-icon">🌓</span>
                    </button>
                </div>
            </div>

            <!-- Навигация по категориям -->
            <nav class="categories-nav">
                <a href="#home" class="category-link" style="background: linear-gradient(135deg, rgba(0, 217, 255, 0.2), rgba(255, 0, 255, 0.2)); border-color: var(--accent-primary);">🏠 Главная</a>
                <a href="#category-laptops" class="category-link">💻 Ноутбуки</a>
                <a href="#category-phones" class="category-link">📱 Смартфоны</a>
                <a href="#category-accessories" class="category-link">🎧 Аксессуары</a>
                <a href="#category-watches" class="category-link">⌚ Умные часы</a>
                <a href="#category-tablets" class="category-link">📲 Планшеты</a>
                <a href="#category-audio" class="category-link">🔊 Аудио</a>
                <a href="#sales" class="category-link special">🔥 Акции</a>
            </nav>
        </div>
    </header>

    <!-- ГЛАВНАЯ СТРАНИЦА -->
    <main class="page-content" id="home">
        <!-- Слайдер баннеров -->
        <section class="hero-slider">
            <div class="slider-track">
                <div class="slide active">
                    <div class="slide-content glass-effect">
                        <h2 class="gradient-text">Новинка: MacBook Pro M3</h2>
                        <p>Невероятная производительность для профессионалов</p>
                        <a href="#product-1" class="btn btn-primary ripple">
                            <span>Узнать больше</span>
                            <span class="btn-icon">→</span>
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <div class="container">
            <!-- Breadcrumbs -->
            <div class="breadcrumbs">
                <a href="#home">Главная</a>
                <span class="separator">→</span>
                <span>Каталог</span>
            </div>

            <!-- Хиты продаж -->
            <section class="section-title fade-in">
                <h2 class="gradient-text">🔥 Хиты продаж</h2>
                <div class="divider-glow"></div>
            </section>

            <!-- СЕТКА ТОВАРОВ -->
            <section class="products-grid" id="productsGrid">
                <!-- Товары генерируются через JavaScript -->
            </section>

            <!-- Отзывы клиентов -->
            <section class="reviews-section fade-in">
                <h2 class="gradient-text">💬 Отзывы наших клиентов</h2>
                <div class="divider-glow"></div>
                <div class="reviews-grid">
                    <div class="review-card glass-effect">
                        <div class="review-header">
                            <span class="review-avatar">👨‍💼</span>
                            <div>
                                <h4>Жузумамбетова Динара</h4>
                                <span class="stars">⭐⭐⭐⭐⭐</span>
                            </div>
                        </div>
                        <p>"Купила MacBook Pro - в восторге! Доставка быстрая, упаковка премиум. Рекомендую!"</p>
                    </div>
                    <div class="review-card glass-effect">
                        <div class="review-header">
                            <span class="review-avatar">👩‍💻</span>
                            <div>
                                <h4>Айтазиев Кубаныч</h4>
                                <span class="stars">⭐⭐⭐⭐⭐</span>
                            </div>
                        </div>
                        <p>"Наушники Sony просто бомба! Шумоподавление работает идеально. Спасибо!"</p>
                    </div>
                    <div class="review-card glass-effect">
                        <div class="review-header">
                            <span class="review-avatar">👨‍🎓</span>
                            <div>
                                <h4>Суйунбеков Билал</h4>
                                <span class="stars">⭐⭐⭐⭐⭐</span>
                            </div>
                        </div>
                        <p>"Лучший магазин электроники! Цены честные, поддержка отличная."</p>
                    </div>
                </div>
            </section>
        </div>
    </main>

    <!-- СТРАНИЦА ИЗБРАННОЕ -->
    <section class="page-content" id="favorites" style="display:none;">
        <div class="container">
            <div class="breadcrumbs">
                <a href="#home">Главная</a>
                <span class="separator">→</span>
                <span>Избранное</span>
            </div>
            
            <h2 class="gradient-text" style="text-align:center; margin:3rem 0;">❤️ Избранные товары</h2>

            <div class="cart-container glass-effect" id="favoritesContainer" style="padding:2rem; min-height:500px;">
                <div style="text-align:center; padding:100px 20px;">
                    <div style="font-size:5rem; margin-bottom:1rem;">💔</div>
                    <p style="color:#b8c1ec; font-size:1.3rem;">
                        Вы ещё ничего не добавили в избранное
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- СТРАНИЦА ТОВАРА -->
    <section class="page-content" id="product-1" style="display:none;">
        <div class="container">
            <div class="breadcrumbs">
                <a href="#home">Главная</a>
                <span class="separator">→</span>
                <a href="#category-laptops">Ноутбуки</a>
                <span class="separator">→</span>
                <span>MacBook Pro M3</span>
            </div>

            <div class="product-detail glass-effect">
                <div class="product-gallery">
                    <img src="macbookpro.jpeg" alt="MacBook Pro" class="main-image">
                </div>
                <div class="product-detail-info">
                    <h1 class="gradient-text">MacBook Pro M3</h1>
                    <div class="rating-large">
                        <span class="stars">⭐⭐⭐⭐⭐</span>
                        <span class="reviews">(124 отзыва)</span>
                    </div>
                    <p class="price-large gradient-text">159 990 ₽</p>
                    <p class="product-description">
                        Профессиональный ноутбук с революционным чипом M3. Невероятная производительность для работы с видео, 3D и разработки. Дисплей Liquid Retina XDR 16 дюймов с яркостью до 1600 нит.
                    </p>
                    
                    <div class="specifications">
                        <h3>Характеристики:</h3>
                        <ul>
                            <li><strong>Процессор:</strong> Apple M3 Pro (12-ядерный)</li>
                            <li><strong>Оперативная память:</strong> 36 GB unified memory</li>
                            <li><strong>Накопитель:</strong> 1 TB SSD</li>
                            <li><strong>Дисплей:</strong> 16" Liquid Retina XDR</li>
                            <li><strong>Графика:</strong> 18-ядерный GPU</li>
                            <li><strong>Батарея:</strong> До 22 часов работы</li>
                        </ul>
                    </div>

                    <div class="product-actions-detail">
                        <button class="btn btn-primary btn-large ripple" onclick="addToCart(1)">
                            <span class="btn-icon">🛒</span>
                            <span>Добавить в корзину</span>
                        </button>
                        <button class="btn btn-secondary ripple" onclick="toggleFavorite(1)">
                            <span>❤️ В избранное</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- КОРЗИНА -->
    <section class="page-content" id="cart" style="display:none;">
        <div class="container">
            <div class="breadcrumbs">
                <a href="#home">Главная</a>
                <span class="separator">→</span>
                <span>Корзина</span>
            </div>
            
            <h2 class="gradient-text">🛒 Ваша корзина</h2>
            
            <div class="cart-container glass-effect" id="cartContainer">
                <p style="text-align:center; padding:100px 20px; color:#b8c1ec; font-size:1.3rem;">
                    Корзина пуста
                </p>
            </div>
        </div>
    </section>

    <!-- ПРОФИЛЬ -->
    <section class="page-content" id="profile" style="display:none;">
        <div class="container">
            <div class="breadcrumbs">
                <a href="#home">Главная</a>
                <span class="separator">→</span>
                <span>Профиль</span>
            </div>

            <div class="profile-layout">
                <aside class="profile-sidebar glass-effect">
                    <div class="profile-avatar">
                        <div class="avatar-circle">👤</div>
                        <h3>Пользователь</h3>
                        <p>user@example.com</p>
                    </div>
                    <nav class="profile-menu">
                        <a href="#profile" class="profile-menu-item active">
                            <span>📝</span> Личные данные
                        </a>
                        <a href="#favorites" class="profile-menu-item">
                            <span>❤️</span> Избранное
                        </a>
                    </nav>
                </aside>

                <div class="profile-content">
                    <div class="profile-section glass-effect">
                        <h2>📝 Личные данные</h2>
                        <p style="padding:2rem; color:#b8c1ec;">Здесь будет форма профиля</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Подвал -->
    <footer class="glass-effect">
        <div class="container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3 class="gradient-text">Cyber Nest</h3>
                    <p>Премиум электроника для избранных</p>
                </div>
                <div class="footer-section">
                    <h4>Каталог</h4>
                    <a href="#category-laptops">Ноутбуки</a>
                    <a href="#category-phones">Смартфоны</a>
                    <a href="#category-accessories">Аксессуары</a>
                </div>
                <div class="footer-section">
                    <h4>Покупателям</h4>
                    <a href="#cart">Корзина</a>
                    <a href="#profile">Профиль</a>
                    <a href="#favorites">Избранное</a>
                </div>
                <div class="footer-section">
                    <h4>Контакты</h4>
                    <p>📧 info@cybernest.com</p>
                    <p>📱 +996 (500) 145-88-8</p>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2025 CYBER NEST. Все права защищены.</p>
            </div>
        </div>
    </footer>

    <script>
        // === БАЗА ТОВАРОВ ===
        const products = [
            { id: 1, name: 'MacBook Pro M3', price: 159990, category: 'laptops', image: 'macbookpro.jpeg', badge: 'NEW', desc: '16" • 36GB RAM • 1TB SSD' },
            { id: 2, name: 'Sony WH-1000XM5', price: 29990, category: 'audio', image: 'sony.png', badge: 'HOT', desc: 'Шумоподавление • 30ч работы' },
            { id: 3, name: 'Samsung Galaxy S24 Ultra', price: 79990, category: 'phones', image: 'galaxy24.png', badge: '5G', desc: '512GB • AI Camera' },
            { id: 4, name: 'Apple Watch Series 9', price: 44990, category: 'watches', image: 'applewath.png', badge: 'NEW', desc: 'GPS + Cellular' },
            { id: 5, name: 'iPad Air M2', price: 64990, category: 'tablets', image: 'ipad.png', badge: 'SALE', desc: '11" • 256GB' },
            { id: 6, name: 'JBL Charge 5', price: 14990, category: 'audio', image: 'jbl.png', badge: 'IP67', desc: 'Waterproof • 20ч' }
        ];

        // === ХРАНИЛИЩЕ ===
        let cart = JSON.parse(localStorage.getItem('cart') || '[]');
        let favorites = JSON.parse(localStorage.getItem('favorites') || '[]');

        // === НАВИГАЦИЯ ===
        function showPage(pageId) {
            console.log('🔄 Переход на страницу:', pageId);
            
            const cleanId = pageId.replace('#', '');
            
            // Скрыть все страницы
            document.querySelectorAll('.page-content').forEach(page => {
                page.style.display = 'none';
            });
            
            // Показать нужную
            const targetPage = document.getElementById(cleanId);
            if (targetPage) {
                targetPage.style.display = 'block';
                console.log('✅ Страница показана:', cleanId);
                
                // Специальные действия для страниц
                if (cleanId === 'favorites') {
                    renderFavorites();
                } else if (cleanId === 'cart') {
                    renderCart();
                }
            } else {
                console.log('❌ Страница не найдена:', cleanId);
                document.getElementById('home').style.display = 'block';
            }
        }

        // === ОТРИСОВКА ТОВАРОВ ===
        function renderProducts(filterCategory = 'all') {
            const grid = document.getElementById('productsGrid');
            if (!grid) return;

            const filtered = filterCategory === 'all' ? products : products.filter(p => p.category === filterCategory);
            
            grid.innerHTML = filtered.map((p, i) => `
                <div class="product-card card-animate" data-product="${p.id}" data-category="${p.category}" style="animation-delay: ${0.1 + i * 0.1}s">
                    <div class="card-glow"></div>
                    <div class="product-image-wrapper">
                        <img src="${p.image}" alt="${p.name}">
                        ${p.badge ? `<div class="product-badge ${p.badge === 'HOT' ? 'badge-hot' : p.badge === 'SALE' ? 'badge-sale' : ''}">${p.badge}</div>` : ''}
                        <button class="favorite-btn ${favorites.includes(p.id) ? 'active' : ''}" data-id="${p.id}">❤️</button>
                    </div>
                    <div class="product-info">
                        <h3>${p.name}</h3>
                        <p class="product-desc">${p.desc}</p>
                        <div class="rating"><span class="stars">⭐⭐⭐⭐⭐</span><span class="reviews">(100+)</span></div>
                        <p class="price gradient-text">${p.price.toLocaleString('ru-RU')} ₽</p>
                        <div class="product-actions">
                            <a href="#product-${p.id}" class="btn btn-secondary ripple">Подробнее</a>
                            <button class="btn btn-primary ripple add-to-cart" data-id="${p.id}">
                                <span class="btn-icon">🛒</span>
                            </button>
                        </div>
                    </div>
                </div>
            `).join('');

            attachEvents();
        }

        // === СОБЫТИЯ ===
        function attachEvents() {
            // Корзина
            document.querySelectorAll('.add-to-cart').forEach(btn => {
                btn.onclick = (e) => {
                    e.preventDefault();
                    const id = parseInt(btn.dataset.id);
                    addToCart(id);
                };
            });

            // Избранное
            document.querySelectorAll('.favorite-btn').forEach(btn => {
                btn.onclick = (e) => {
                    e.preventDefault();
                    const id = parseInt(btn.dataset.id);
                    toggleFavorite(id);
                };
            });
        }

        // === КОРЗИНА ===
        function addToCart(productId) {
            const existing = cart.find(item => item.id === productId);
            if (existing) {
                existing.qty++;
            } else {
                cart.push({ id: productId, qty: 1 });
            }
            localStorage.setItem('cart', JSON.stringify(cart));
            updateCartBadge();
            showNotification('✅ Товар добавлен в корзину!');
        }

        function updateCartBadge() {
            const total = cart.reduce((sum, item) => sum + item.qty, 0);
            const badge = document.querySelector('.action-btn[href="#cart"] .action-badge');
            if (badge) {
                badge.textContent = total;
                badge.style.display = total > 0 ? 'block' : 'none';
            }
        }

        function renderCart() {
            const container = document.getElementById('cartContainer');
            if (!container) return;

            if (cart.length === 0) {
                container.innerHTML = '<p style="text-align:center; padding:100px 20px; color:#b8c1ec; font-size:1.3rem;">Корзина пуста</p>';
                return;
            }

            const items = cart.map(item => {
                const product = products.find(p => p.id === item.id);
                if (!product) return '';
                
                return `
                    <div class="cart-item">
                        <img src="${product.image}" alt="${product.name}" style="width:120px; height:100px; object-fit:cover; border-radius:15px;">
                        <div class="cart-item-info">
                            <h3>${product.name}</h3>
                            <p class="product-desc">${product.desc}</p>
                        </div>
                        <div class="cart-item-quantity">
                            <button class="qty-btn" onclick="changeQty(${item.id}, -1)">−</button>
                            <span class="quantity-badge">${item.qty}</span>
                            <button class="qty-btn" onclick="changeQty(${item.id}, 1)">+</button>
                        </div>
                        <div class="cart-item-total">
                            <p class="price gradient-text">${(product.price * item.qty).toLocaleString('ru-RU')} ₽</p>
                            <button class="btn-remove" onclick="removeFromCart(${item.id})">
                                <span class="remove-icon">✕</span> Удалить
                            </button>
                        </div>
                    </div>
                `;
            }).join('');

            const total = cart.reduce((sum, item) => {
                const product = products.find(p => p.id === item.id);
                return sum + (product ? product.price * item.qty : 0);
            }, 0);

            container.innerHTML = items + `
                <div class="cart-summary">
                    <div class="divider-glow"></div>
                    <div class="total">
                        <h3>Итого к оплате:</h3>
                        <p class="total-price gradient-text pulse">${total.toLocaleString('ru-RU')} ₽</p>
                    </div>
                    <button class="btn btn-primary btn-large ripple" onclick="alert('Оформление заказа в разработке')">
                        <span>Оформить заказ</span>
                        <span class="btn-icon">→</span>
                    </button>
                </div>
            `;
        }

        function changeQty(productId, delta) {
            const item = cart.find(i => i.id === productId);
            if (item) {
                item.qty += delta;
                if (item.qty <= 0) {
                    cart = cart.filter(i => i.id !== productId);
                }
                localStorage.setItem('cart', JSON.stringify(cart));
                updateCartBadge();
                renderCart();
            }
        }

        function removeFromCart(productId) {
            cart = cart.filter(i => i.id !== productId);
            localStorage.setItem('cart', JSON.stringify(cart));
            updateCartBadge();
            renderCart();
            showNotification('❌ Удалено из корзины');
        }

        // === ИЗБРАННОЕ ===
        function toggleFavorite(productId) {
            if (favorites.includes(productId)) {
                favorites = favorites.filter(f => f !== productId);
                showNotification('💔 Удалено из избранного');
            } else {
                favorites.push(productId);
                showNotification('❤️ Добавлено в избранное');
            }
            localStorage.setItem('favorites', JSON.stringify(favorites));
            updateFavoritesBadge();
            renderProducts();
            renderFavorites();
        }

        function updateFavoritesBadge() {
            const badge = document.querySelector('.action-btn[href="#favorites"] .action-badge');
            if (badge) {
                badge.textContent = favorites.length;
                badge.style.display = favorites.length > 0 ? 'block' : 'none';
            }
        }

        function renderFavorites() {
            console.log('📦 Отрисовка избранного, товаров:', favorites.length);
            
            const container = document.getElementById('favoritesContainer');
            if (!container) {
                console.error('❌ Контейнер не найден!');
                return;
            }

            if (favorites.length === 0) {
                container.innerHTML = `
                    <div style="text-align:center; padding:100px 20px;">
                        <div style="font-size:5rem; margin-bottom:1rem;">💔</div>
                        <p style="color:#b8c1ec; font-size:1.3rem; margin-bottom:2rem;">
                            Вы ещё ничего не добавили в избранное
                        </p>
                        <a href="#home" class="btn btn-primary ripple" style="display:inline-flex;">
                            <span>Перейти в каталог</span>
                            <span class="btn-icon">→</span>
                        </a>
                    </div>
                `;
                return;
            }

            const items = favorites.map(id => {
                const product = products.find(p => p.id === id);
                if (!product) return '';
                
                return `
                    <div class="cart-item slide-in" style="margin-bottom:1.5rem; border-bottom:1px solid var(--glass-border); padding-bottom:1.5rem;">
                        <img src="${product.image}" alt="${product.name}" style="width:120px; height:100px; object-fit:cover; border-radius:15px;">
                        <div class="cart-item-info">
                            <h3>${product.name}</h3>
                            <p class="product-desc">${product.desc}</p>
                            <div class="rating">
                                <span class="stars">⭐⭐⭐⭐⭐</span>
                            </div>
                        </div>
                        <div style="margin-left:auto; display:flex; flex-direction:column; gap:10px; align-items:flex-end;">
                            <p class="price gradient-text" style="font-size:1.8rem; margin:0;">${product.price.toLocaleString('ru-RU')} ₽</p>
                            <div style="display:flex; gap:10px;">
                                <button class="btn btn-primary ripple" onclick="addToCart(${product.id})">
                                    <span class="btn-icon">🛒</span>
                                    <span>В корзину</span>
                                </button>
                                <button class="btn-remove" onclick="toggleFavorite(${product.id})">
                                    <span class="remove-icon">✕</span>
                                    Удалить
                                </button>
                            </div>
                        </div>
                    </div>
                `;
            }).join('');

            container.innerHTML = items;
            console.log('✅ Избранное отрисовано');
        }

        // === УВЕДОМЛЕНИЯ ===
        function showNotification(message) {
            const notification = document.getElementById('notification');
            notification.querySelector('.notification-text').textContent = message;
            notification.classList.add('show');
            setTimeout(() => notification.classList.remove('show'), 3000);
        }

        // === ТЕМА ===
        function switchTheme() {
            const themes = ['theme-dark', 'theme-cyber', 'theme-purple'];
            const body = document.body;
            const currentTheme = body.className || 'theme-dark';
            const currentIndex = themes.indexOf(currentTheme);
            const nextIndex = (currentIndex + 1) % themes.length;
            body.className = themes[nextIndex];
            showNotification('🎨 Тема изменена');
        }

        // === ИНИЦИАЛИЗАЦИЯ ===
        window.addEventListener('load', () => {
            console.log('🚀 Инициализация...');
            
            renderProducts();
            updateCartBadge();
            updateFavoritesBadge();
            
            const hash = window.location.hash || '#home';
            showPage(hash);
            
            console.log('✅ Готово!');
        });

        // Слежение за изменением URL
        window.addEventListener('hashchange', () => {
            const hash = window.location.hash || '#home';
            showPage(hash);
        });

        // Поиск
        const searchInput = document.getElementById('searchInput');
        const searchSuggestions = document.getElementById('searchSuggestions');
        
        if (searchInput) {
            searchInput.addEventListener('input', function() {
                const query = this.value.toLowerCase();
                if (query.length > 0) {
                    const filtered = products.filter(p => 
                        p.name.toLowerCase().includes(query)
                    );
                    
                    if (filtered.length > 0) {
                        searchSuggestions.innerHTML = filtered.map(p => 
                            `<div class="suggestion-item" onclick="window.location.hash='product-${p.id}'">
                                <span>🔍</span>
                                <div>
                                    <strong>${p.name}</strong>
                                    <span class="suggestion-price">${p.price.toLocaleString('ru-RU')} ₽</span>
                                </div>
                            </div>`
                        ).join('');
                        searchSuggestions.classList.add('show');
                    } else {
                        searchSuggestions.classList.remove('show');
                    }
                } else {
                    searchSuggestions.classList.remove('show');
                }
            });
        }
        
        // Закрыть подсказки при клике вне поиска
        document.addEventListener('click', function(e) {
            if (!e.target.closest('.search-container')) {
                searchSuggestions?.classList.remove('show');
            }
        });

        // === ФИЛЬТРАЦИЯ ПО КАТЕГОРИЯМ ===
        document.querySelectorAll('.category-link').forEach(link => {
            link.addEventListener('click', (e) => {
                e.preventDefault();
                const hash = link.getAttribute('href');
                
                // Если это категория, фильтруем товары
                if (hash.startsWith('#category-')) {
                    const category = hash.split('-')[1];
                    const map = { 
                        laptops: 'laptops', 
                        phones: 'phones', 
                        audio: 'audio', 
                        watches: 'watches', 
                        tablets: 'tablets', 
                        accessories: 'accessories'
                    };
                    renderProducts(map[category] || 'all');
                    window.location.hash = '#home';
                } else {
                    window.location.hash = hash;
                }
            });
        });

        // === RIPPLE ЭФФЕКТ ===
        document.addEventListener('click', function(e) {
            const button = e.target.closest('.ripple');
            if (button) {
                const ripple = document.createElement('span');
                ripple.classList.add('ripple-effect');
                button.appendChild(ripple);
                
                const rect = button.getBoundingClientRect();
                const size = Math.max(rect.width, rect.height);
                ripple.style.width = ripple.style.height = size + 'px';
                ripple.style.left = e.clientX - rect.left - size/2 + 'px';
                ripple.style.top = e.clientY - rect.top - size/2 + 'px';
                
                setTimeout(() => ripple.remove(), 600);
            }
        });

        
    </script>
</body>
</html>