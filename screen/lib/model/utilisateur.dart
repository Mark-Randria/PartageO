class Utilisateur {
  final String E_mail;
  final String nom_utilisateur;
  final String mot_de_passe;
  final int id_adresse;
  final bool role;
  final Map user_adresse;
  final List user_materiel;
  final int montant_payer;

  Utilisateur(
      this.E_mail,
      this.nom_utilisateur,
      this.mot_de_passe,
      this.id_adresse,
      this.role,
      this.user_adresse,
      this.user_materiel,
      this.montant_payer);

  Utilisateur.fromJson(Map<String, dynamic> json)
      : E_mail = json['E_mail'],
        nom_utilisateur = json['nom_utilisateur'],
        mot_de_passe = json['mot_de_passe'],
        id_adresse = json['id_adresse'],
        role = json['role'],
        user_adresse = json['user_adresse'],
        user_materiel = json['user_materiel'],
        montant_payer = json['montant_payer'];

  Map<String, dynamic> toJson() => {
        'E_mail': E_mail,
        'nom_utilisateur': nom_utilisateur,
        'mot_de_passe': mot_de_passe,
        'id_adresse': id_adresse,
        'role': role
      };
}
