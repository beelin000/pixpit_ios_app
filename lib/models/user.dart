// import 'dart:convert';

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() =>
    <String, dynamic>{
      'name': name,
      'email': email,
    };

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return new User(
  //     name: json['results'][0]['name']['first'],// data.results[0].name.first
  //     email: results[0]['email']
  //   );
  // }
}