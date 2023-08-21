class BoxModel {
  String image, name, description;

  BoxModel(
      {required this.image, required this.name, required this.description});

  factory BoxModel.fromJson(Map<String, dynamic> data) {
    return BoxModel(
      image: data["image"],
      name: data["name"],
      description: data["description"],
    );
  }
}
