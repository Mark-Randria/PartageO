import 'dart:ffi';

class Facture {
  final String ref_facture;
  final String date;
  final Float montant;
  final int id_adresse;
  final List facture_adresse;

  Facture(this.ref_facture, this.date, this.montant, this.id_adresse, this.facture_adresse);

  Facture.fromJson(Map<String, dynamic> json)
    : ref_facture = json['ref_facture'],
      date = json['date'],
      montant = json['montant'],
      id_adresse = json['id_adresse'],
      facture_adresse = json['facture_adresse'];

  Map<String, dynamic> toJson() => {
    'ref_facture': ref_facture,
    'date': date,
    'montant': montant,
    'id_adresse': id_adresse
  };
}