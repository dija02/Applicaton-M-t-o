document.getElementById('villeForm').addEventListener('submit', function (event) {
    event.preventDefault();  // Empêche le rechargement de la page

    const ville = document.getElementById('ville').value;

    // Création de la requête vers le serveur PHP
    fetch('meteo.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: `ville=${encodeURIComponent(ville)}`
    })
    .then(response => response.json())  // Traite la réponse JSON
    .then(data => {
        const resultDiv = document.getElementById('result');
        
        // Si des données sont retournées, les afficher
        if (data.error) {
            resultDiv.innerHTML = `<p>Erreur : ${data.error}</p>`;
        } else {
            resultDiv.innerHTML = `
                <h2>Météo à ${data.ville}</h2>
                <p>Température : ${data.temperature}°C</p>
                <p>Description : ${data.description}</p>
                <p>Humidité : ${data.humidite}%</p>
                <p>Pression : ${data.pression} hPa</p>
            `;
        }
    })
    .catch(error => {
        // En cas d'erreur, afficher un message
        const resultDiv = document.getElementById('result');
        resultDiv.innerHTML = `<p>Erreur lors de la récupération des données.</p>`;
        console.error('Erreur :', error);
    });
});
