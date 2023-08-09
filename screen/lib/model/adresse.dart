class Adresse {
  String? nomAdresse;
  var adresse_user;
  var adresse_facture;
  
  Adresse ({
    this.nomAdresse,
    this.adresse_user,
    this.adresse_facture
  });

  Adresse.fromJson(Map<String, dynamic> json) {
    nomAdresse = json['nom_adresse'];
  }
}
