<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erreur</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h1>Erreur 404 - Page non trouvée</h1>
        <p>Oups ! La page que vous cherchez n'existe pas.</p>
        <p>Il se peut que l'URL soit incorrecte ou que la page ait ete supprimee.</p>
        <a href="page_de_connexion.php">Retour à la page d'accueil</a>
    </div>
    <?php 
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "applic_meteo";
    
    $conn = new mysqli($servername, $username, $password, $dbname);
    
    if ($conn->connect_error) {
        die("Connexion échouée : " . $conn->connect_error);
    }
    
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $email = $_POST['email'];
    
        $sql = "SELECT * FROM utilisateurs WHERE email='$email'";
        $result = $conn->query($sql);
    
        if ($result->num_rows > 0) {
            $nouveau_mot_de_passe = substr(md5(rand()), 0, 8);
            $mot_de_passe_hash = password_hash($nouveau_mot_de_passe, PASSWORD_DEFAULT);
    
            $sql_update = "UPDATE utilisateurs SET mot_de_passe='$mot_de_passe_hash' WHERE email='$email'";
            if ($conn->query($sql_update) === TRUE) {
                $to = $email;
                $subject = "Réinitialisation du mot de passe";
                $message = "Votre nouveau mot de passe est : " . $nouveau_mot_de_passe;
                $headers = "From: noreply@votreapp.com";
    
                if (mail($to, $subject, $message, $headers)) {
                    echo "Un e-mail avec votre nouveau mot de passe a été envoyé.";
                } else {
                    echo "Erreur lors de l'envoi de l'e-mail.";
                }
            } else {
                echo "Erreur lors de la mise à jour du mot de passe : " . $conn->error;
            }
        } else {
            echo "Aucun compte associé à cet e-mail.";
        }
    }
    
    $conn->close();
    ?>
</body>
</html>
