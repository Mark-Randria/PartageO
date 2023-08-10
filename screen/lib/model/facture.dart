class Facture {
  String? refFacture;
  String? dateFacture;
  double? montant;
  double? rano;
  String? nomAdresse;
  int? idAdresse;

  Facture ({
    this.refFacture,
    this.dateFacture,
    this.montant,
    this.rano,
    this.nomAdresse,
    this.idAdresse
  });

  Facture.fromJson(json) {
    refFacture = json['ref_facture'];
    dateFacture = json['date_facture'];
    montant = json['montant'];
    rano = json['rano'];
    nomAdresse = json['facture_adresse']['nom_adresse'];
    idAdresse = json['facture_adresse']['id'];
  }
}
