import 'dart:ffi';

class Materiel {
  final String nom_materiel;
  final Float duree_utilisation;
  final Float nombre_kw;
  final int id_user;
  final Map materiel_user;

  Materiel(this.nom_materiel, this.duree_utilisation, this.nombre_kw,
      this.id_user, this.materiel_user);

  Materiel.fromJson(Map<String, dynamic> json)
      : nom_materiel = json['nom_materiel'],
        duree_utilisation = json['duree_utilisation'],
        nombre_kw = json['nombre_kw'],
        id_user = json['id_user'],
        materiel_user = json['materiel_user'];

  Map<String, dynamic> toJson() => {
        'nom_materiel': nom_materiel,
        'duree_utilisation': duree_utilisation,
        'nombre_kw': nombre_kw,
        'id_user': id_user
      };
}
