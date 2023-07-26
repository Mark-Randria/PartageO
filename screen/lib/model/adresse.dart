class Adresse {
  final String nom_adresse;
  final List adresse_user;
  final List adresse_facture;

  Adresse(this.nom_adresse, this.adresse_user, this.adresse_facture);

  Adresse.fromJson(Map<String, dynamic> json)
    : nom_adresse = json['nom_adresse'],
      adresse_user = json['adresse_user'],
      adresse_facture = json['adresse_facture'];

  Map<String, dynamic> toJson() => {
    'nom_adresse': nom_adresse
  }; 
}