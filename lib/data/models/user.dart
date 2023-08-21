class UserModel {
  String firstName, lastName, userName, email;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      firstName: data["firstName"],
      lastName: data["lastName"],
      userName: data["userName"],
      email: data["email"],
    );
  }
}
