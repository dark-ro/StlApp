// ignore_for_file: non_constant_identifier_names

class Person {
  String Nom;
  String? Taille;
  String? Longueur;
  String? Poitrine;
  String? Jambe;
  String? Bras;
  String? Cuisse;
  String? Dos;

  Person(
      {required this.Nom,
      this.Taille,
      this.Longueur,
      this.Poitrine,
      this.Jambe,
      this.Bras,
      this.Cuisse,
      this.Dos});

  Map<String, dynamic> toJson() => {
        'Nom': Nom,
        'Taille': Taille,
        'Longueur': Longueur,
        'Poitrine': Poitrine,
        'Jambe': Jambe,
        'Bras': Bras,
        'Cuisse': Cuisse,
        'Dos': Cuisse
      };
}
