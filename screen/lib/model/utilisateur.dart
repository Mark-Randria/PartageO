class Utilisateur {
    var nom_utilisateur;
    var nom_adresse;
    var montant_payer;
    var user_materiel;
    
  Utilisateur(Map map) {
    nom_utilisateur = map["nom_utilisateur"];
    Map user_adresse = map["user_adresse"];
    nom_adresse = user_adresse["nom_adresse"];
    user_materiel = map["user_materiel"];
    montant_payer = map["montant_payer"];
  }
}

class Token {
  var access_token;
  var token_type;

  Token(Map map) {
    access_token = map["access_token"];
    token_type = map["token_type"];
  }
}