import 'dart:convert';

// List<Home> homeFromJson(String str) =>
//     List<Home>.from(json.decode(str).map((x) => Home.fromJson(x)));

// String homeToJson(List<Home> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Home {
  Home({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  int userId;
  int id;
  String title;
  bool completed;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}

UserModel1 userModel1FromJson(String str) =>
    UserModel1.fromJson(json.decode(str));

String userModel1ToJson(UserModel1 data) => json.encode(data.toJson());

class UserModel1 {
  UserModel1({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  int userId;
  int id;
  String title;
  bool completed;

  factory UserModel1.fromJson(Map<String, dynamic> json) => UserModel1(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
