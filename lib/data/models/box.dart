class BoxModel {
  int id;
  String image, name, description;

  BoxModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
  });

  factory BoxModel.fromJson(Map<String, dynamic> data) {
    return BoxModel(
      id: data["id"],
      image: data["image"],
      name: data["name"],
      description: data["description"],
    );
  }
}
