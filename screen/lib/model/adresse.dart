class Adresse {
  var nomAdresse;
  var idAdresse;
  var adresse_user;
  var adresse_facture;
  
  Adresse ({
    this.nomAdresse,
    this.idAdresse,
    this.adresse_user,
    this.adresse_facture
  });

  Adresse.fromJson(json) {
    nomAdresse = json['nom_adresse'];
    idAdresse = json['id'];

  }
}
