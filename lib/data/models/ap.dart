class APModel {
  int id;
  String image, name, description;

  APModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
  });

  factory APModel.fromJson(Map<String, dynamic> data) {
    return APModel(
      id: data["id"],
      image: data["image"],
      name: data["name"],
      description: data["description"],
    );
  }
}
