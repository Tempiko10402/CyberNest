// Избранное
document.querySelectorAll('.favorite-btn').forEach(btn => {
    btn.addEventListener('click', function() {
        this.classList.toggle('active');
        const message = this.classList.contains('active')
            ? 'Добавлено в избранное ❤️'
            : 'Удалено из избранного';
        showNotification(message);
    });
});