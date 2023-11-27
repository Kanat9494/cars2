class UserModel {
  final int id;
  final String email;
  final String firstname;
  final String lastname;
  final String avatar;

  UserModel(
      {required this.id,
      required this.email,
      required this.firstname,
      required this.lastname,
      required this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        email: json['email'],
        firstname: json['firtname'],
        lastname: json['lastname'],
        avatar: json['avatar'] ??
            'https://api.slingacademy.com/v1/sample-data/photos/1');
  }
}
