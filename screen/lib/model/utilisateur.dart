class Utilisateur {
    String nom_utilisateur;
    String nom_adresse;
    int montant_payer;
    int montant_rano;
    var user_materiel;
    
  Utilisateur ({
    required this.nom_utilisateur,
    required this.nom_adresse,
    required this.montant_payer,
    required this.montant_rano,
    required this.user_materiel
  });
}

class Token {
  var access_token;
  var token_type;

  Token(Map map) {
    access_token = map["access_token"];
    token_type = map["token_type"];
  }
}