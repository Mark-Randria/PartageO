class Materiel {
  var nom_materiel;
  var duree_utilisation;
  var nombre_kw;
  var montant;
  var nom_utilisateur;

  Materiel(Map map) {
    nom_materiel = map["nom_materiel"];
    duree_utilisation = map["duree_utilisation"];
    nombre_kw = map["nombre_kw"];
    montant = map["montant"];
    Map materiel_userMap = map["materiel_user"];
    nom_utilisateur = materiel_userMap["nom_utilisateur"];
  }
}