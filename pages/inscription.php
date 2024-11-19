



 <!doctype html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>inscription</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"><link rel="stylesheet" type="text/css" href="inscription meteo.css">
    </head>
    <body>
          <div class="container mt-5">
             <h2>Formulaire d'Inscription</h2>
               <form> <div class="mb-3">
                  <label for="firstName" class="form-label">Prénom</label>
                  <input type="text" class="form-control" id="firstName" required> </div>
                   <div class="mb-3">
                     <label for="lastName" class="form-label">Nom</label> 
                     <input type="text" class="form-control" id="lastName" required> </div> 
                     <div class="mb-3"> 
                        <label for="exampleInputEmail1" class="form-label">Adresse Email</label>
                         <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"> 
                         <div id="emailHelp" class="form-text">Nous ne partagerons jamais votre email avec quelqu'un d'autre.</div>
                         </div>
                          <div class="mb-3"> 
                            <label for="exampleInputPassword1" class="form-label">Mot de Passe</label> 
                            <input type="password" class="form-control" id="exampleInputPassword1"> 
                            <div class="form-text">votre mot de passe doit comporter 8 à 12 caractères.</div>
                         </div> 
                          <div class="mb-3"> 
                            <label for="exampleInputPassword2" class="form-label">Confirmer le Mot de Passe</label>
                             <input type="password" class="form-control" id="exampleInputPassword2"> </div> 
                             <div class="mb-3 form-check"> 
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                 <label class="form-check-label" for="exampleCheck1">Accepter les termes et conditions</label>
                                 </div> 
                                 <button type="submit" class="btn btn-primary">S'inscrire</button>
                                 </form>
                                 </div>
                                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">

                                    </script>
    </body>
</html>