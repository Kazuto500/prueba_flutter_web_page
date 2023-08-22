class StepModel {
  int id;
  String name, description;

  StepModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory StepModel.fromJson(Map<String, dynamic> data) {
    return StepModel(
      id: data["id"],
      name: data["name"],
      description: data["description"],
    );
  }
}
