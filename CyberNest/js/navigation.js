/* ============================================
   NAVIGATION.JS - Навигация между страницами
   ============================================ */

   (function() {
    'use strict';

    // Скрыть все страницы кроме активной
    function showPage(pageId) {
        // Убрать # из начала
        pageId = pageId.replace('#', '');
        
        // Скрыть все страницы
        document.querySelectorAll('.page-content').forEach(page => {
            page.style.display = 'none';
        });
        
        // Показать нужную страницу
        const targetPage = document.getElementById(pageId);
        if (targetPage) {
            targetPage.style.display = 'block';
            
            // Прокрутить наверх
            window.scrollTo({ top: 0, behavior: 'smooth' });
            
            // Обновить данные на странице
            updatePageContent(pageId);
        } else {
            // Если страница не найдена, показать главную
            const homePage = document.getElementById('home');
            if (homePage) {
                homePage.style.display = 'block';
            }
        }
    }

    // Обновить контент страницы
    function updatePageContent(pageId) {
        switch(pageId) {
            case 'favorites':
                if (typeof updateFavoritesPage === 'function') {
                    updateFavoritesPage();
                }
                break;
            case 'cart':
                if (typeof updateCartPage === 'function') {
                    updateCartPage();
                }
                break;
            case 'profile':
                if (typeof updateProfilePage === 'function') {
                    updateProfilePage();
                }
                break;
            default:
                // Для категорий товаров
                if (pageId.startsWith('category-')) {
                    displayCategoryProducts(pageId);
                }
                break;
        }
    }

    // Отобразить товары категории
    function displayCategoryProducts(categoryId) {
        const category = categoryId.replace('category-', '');
        const filteredProducts = window.TechLuxury.products.filter(
            p => p.category === category
        );
        
        const grid = document.querySelector(`#${categoryId} .products-grid`);
        if (grid && filteredProducts.length > 0) {
            grid.innerHTML = filteredProducts.map((product, index) => 
                window.TechLuxury.createProductCard(product, index * 0.1)
            ).join('');
            
            // Переинициализировать кнопки
            if (typeof initializeFavoriteButtons === 'function') {
                initializeFavoriteButtons();
            }
        }
    }

    // Обработка изменения URL
    function handleHashChange() {
        const hash = window.location.hash || '#home';
        showPage(hash);
    }

    // Инициализация навигации
    function initNavigation() {
        // Обработка клика по ссылкам
        document.addEventListener('click', function(e) {
            const link = e.target.closest('a[href^="#"]');
            if (link) {
                const href = link.getAttribute('href');
                if (href && href !== '#') {
                    // Обновить URL
                    window.location.hash = href;
                }
            }
        });

        // Обработка кнопки "Назад"
        window.addEventListener('hashchange', handleHashChange);
        
        // Обработка кнопки "Вперёд"
        window.addEventListener('popstate', handleHashChange);
        
        // Показать нужную страницу при загрузке
        handleHashChange();
        
        console.log('✅ Навигация инициализирована');
    }

    // История просмотренных страниц
    const pageHistory = [];
    const MAX_HISTORY = 10;

    function addToHistory(pageId) {
        pageHistory.unshift(pageId);
        if (pageHistory.length > MAX_HISTORY) {
            pageHistory.pop();
        }
        localStorage.setItem('pageHistory', JSON.stringify(pageHistory));
    }

    function getHistory() {
        const history = localStorage.getItem('pageHistory');
        return history ? JSON.parse(history) : [];
    }

    // Навигация назад
    function goBack() {
        if (pageHistory.length > 1) {
            pageHistory.shift(); // Удалить текущую
            const previousPage = pageHistory[0];
            window.location.hash = '#' + previousPage;
        } else {
            window.location.hash = '#home';
        }
    }

    // Breadcrumbs
    function updateBreadcrumbs(pageId) {
        const breadcrumbs = document.querySelector('.breadcrumbs');
        if (!breadcrumbs) return;

        const paths = {
            'home': ['Главная'],
            'cart': ['Главная', 'Корзина'],
            'checkout': ['Главная', 'Корзина', 'Оформление'],
            'favorites': ['Главная', 'Избранное'],
            'profile': ['Главная', 'Профиль'],
            'category-laptops': ['Главная', 'Ноутбуки'],
            'category-phones': ['Главная', 'Смартфоны'],
            'category-accessories': ['Главная', 'Аксессуары'],
        };

        const path = paths[pageId] || ['Главная'];
        
        breadcrumbs.innerHTML = path.map((item, index) => {
            if (index === path.length - 1) {
                return `<span>${item}</span>`;
            } else {
                return `<a href="#${Object.keys(paths)[index]}">${item}</a>
                        <span class="separator">→</span>`;
            }
        }).join('');
    }

    // Предзагрузка страниц
    function preloadPages() {
        const pagesToPreload = ['cart', 'favorites', 'profile'];
        
        pagesToPreload.forEach(pageId => {
            const page = document.getElementById(pageId);
            if (page) {
                // Страница уже загружена в HTML
                console.log(`✅ Страница ${pageId} готова`);
            }
        });
    }

    // Экспорт функций
    window.Navigation = {
        showPage,
        goBack,
        getHistory,
        updateBreadcrumbs,
        preloadPages
    };

    // Автоматическая инициализация при загрузке DOM
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initNavigation);
    } else {
        initNavigation();
    }

})();