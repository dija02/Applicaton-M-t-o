<?php
// Connexion à la base de données
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "applic_meteo";
$conn = new mysqli($servername, $username, $password, $dbname);

// Vérifier la connexion
if ($conn->connect_error) {
    die("Connexion échouée : " . $conn->connect_error);
}

// Verifier si la ville a ete soumise via le formulaire
if (isset($_POST['ville'])) {
    $ville = $_POST['ville'];  // Récupérer la ville saisie par l'utilisateur

    // Cle API pour WeatherAPI
    $apiKey = "91ead8d9abec493db84205332242708";

    // URL pour récupérer les données météo pour la ville saisie
    $url = "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$ville&lang=fr";

    // Récupérer les données de l'API
    $response = file_get_contents($url);

    // Vérifier si la réponse a été reçue correctement
    if ($response === FALSE) {
        die('Erreur lors de la récupération des données.');
    }

    // Décoder la réponse JSON
    $data = json_decode($response, true);

    // Vérifier si les données météo sont présentes dans la réponse
    if (isset($data['current'])) {
        // Extraire les informations météo
        $temperature = $data['current']['temp_c']; // Température en °C
        $description = $data['current']['condition']['text']; // Description de la météo
        $humidite = $data['current']['humidity']; // Humidité
        $pression = $data['current']['pressure_mb']; // Pression atmosphérique en hPa
        //$vitesse_vent = $data['curent']['wind_kph']
        // Insérer les données météo dans la base de données
        $ville=mysqli_real_escape_string($conn,$ville);
        $description=mysqli_real_escape_string($conn,$description);
        $sql = "INSERT INTO meteo (ville, temperature, description, humidite, pression) 
                VALUES ('$ville', $temperature, '$description', $humidite, $pression)";

        if ($conn->query($sql) === TRUE) {
            // Afficher les données météo après l'insertion
            echo "<h2>Données météo pour $ville</h2>";
    echo "<p>Température : " . htmlspecialchars($temperature) . "°C</p>"; // Utilisation de htmlspecialchars pour sécuriser l'affichage
    echo "<p>Description : " . htmlspecialchars($description) . "</p>";
    echo "<p>Humidité : " . htmlspecialchars($humidite) . "%</p>";
    echo "<p>Pression : " . htmlspecialchars($pression) . " hPa</p>";
        } 
        else {
            echo "Erreur lors de l'insertion des données : " . $conn->error;
        }
    } else {
        echo "Erreur : Ville non trouvée ou problème avec la clé API.";
    }
} else {
    echo "Veuillez entrer une ville.";
}

// Fermer la connexion à la base de données
$conn->close();
?>
