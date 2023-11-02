class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String profile;
  final String created_at;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.profile,
    required this.created_at,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      profile: json['profile'],
      created_at: json['created_at'],
    );
  }
}
