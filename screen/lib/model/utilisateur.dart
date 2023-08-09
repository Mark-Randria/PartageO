class Utilisateur {
    String? nomUtilisateur;
    String? nomAdresse;
    int? idAdresse;
    double? montantPayer;
    double? montantRano;
    var userMateriel;
    
  Utilisateur ({
    this.nomUtilisateur,
    this.nomAdresse,
    this.idAdresse,
    this.montantPayer,
    this.montantRano,
    this.userMateriel
  });

  Utilisateur.fromJson(Map<String, dynamic> json) {
    nomUtilisateur = json['nom_utilisateur'];
    nomAdresse = json['user_adresse']['nom_adresse'];
    idAdresse = json['user_adresse']['id'];
    montantPayer = json['montant_payer'];
    montantRano = json['montant_rano'];
    userMateriel = json['user_materiel'];
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