// lista json da api ja convertida em objeto dart

class Pokemon {
  List<String>? weakness; // Null-Safety: con "?" indicamos que puede recibir null y no quiebra la app
  String? number;
  String? description;
  String? name;
  String? thumbnailImage;
  int? id;
  List<String>? type;

  Pokemon(
      {this.weakness,
      this.number,
      this.description,
      this.name,
      this.thumbnailImage,
      this.id,
      this.type});

  Pokemon.fromJson(Map<String, dynamic> json) {
    this.weakness =
        json["weakness"] == null ? null : List<String>.from(json["weakness"]);
    this.number = json["number"];
    this.description = json["description"];
    this.name = json["name"];
    this.thumbnailImage = json["thumbnailImage"];
    this.id = json["id"];
    this.type = json["type"] == null ? null : List<String>.from(json["type"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.weakness != null) data["weakness"] = this.weakness;
    data["number"] = this.number;
    data["description"] = this.description;
    data["name"] = this.name;
    data["thumbnailImage"] = this.thumbnailImage;
    data["id"] = this.id;
    if (this.type != null) data["type"] = this.type;
    return data;
  }
}
