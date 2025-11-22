// Живой поиск
const searchInput = document.getElementById('searchInput');
const searchSuggestions = document.getElementById('searchSuggestions');

searchInput.addEventListener('input', function() {
    const query = this.value.toLowerCase();
    if (query.length > 0) {
        const filtered = products.filter(p =>
            p.name.toLowerCase().includes(query)
        );

        if (filtered.length > 0) {
            searchSuggestions.innerHTML = filtered.map(p =>
                `<div class="suggestion-item" onclick="window.location.hash='product-${p.id}'">
                    <span>Search</span>
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

// Закрыть подсказки при клике вне поиска
document.addEventListener('click', function(e) {
    if (!e.target.closest('.search-container')) {
        searchSuggestions.classList.remove('show');
    }
});