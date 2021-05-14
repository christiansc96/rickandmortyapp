class CharacterDTO {
  int id;
  String name;
  String species;
  String image;
  String status;

  CharacterDTO.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        name = json['name'],
        species = json['species'],
        status = json['status'],
        image = json['image'];
}
