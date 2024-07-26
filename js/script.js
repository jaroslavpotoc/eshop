document.addEventListener('DOMContentLoaded', function() {
    fetch('../config/getCsrfToken.php')
        .then(response => response.text())
        .then(token => {
            const csrfToken = token.trim();
            document.getElementById('fetchButton').addEventListener('click', function() {
                fetch('getWarehouseValue.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        'csrf_token': csrfToken
                    })
                })
                .then(response => response.text())
                .then(data => {
                    document.getElementById('result').innerText = data;
                })
                .catch(error => console.error('Error:', error));
            });
        });
});
