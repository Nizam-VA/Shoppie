class User {
  int id;
  String email;
  String username;
  String password;
  String name;
  String phone;
  User({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      name: json['name'],
      phone: json['phone'],
    );
  }
}
