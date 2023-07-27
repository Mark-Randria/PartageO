class Adresse {
  var nom_adresse;
  var adresse_user;
  var adresse_facture;
  
  Adresse(Map map) {
    nom_adresse = map["nom_adresse"];
    adresse_user = map["adresse_user"];
    adresse_facture = map["adresse_facture"];
  }
}
