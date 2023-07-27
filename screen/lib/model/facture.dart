class Facture {
  var ref_facture;
  var date;
  var montant;
  var nom_adresse;
  var rano;

  Facture (Map map){
    ref_facture = map["ref_facture"];
    date = map["date"];
    montant = map["montant"];
    rano = map["rano"];
    Map facture_adresse = map["facture_adresse"];
    nom_adresse = facture_adresse["nom_adresse"];
  }
}
