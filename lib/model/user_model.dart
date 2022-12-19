class UserModel {
  String? token;
  String? userId;
  String? name;
  String? username;

  UserModel({this.token, this.userId, this.name, this.username});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
    name = json['name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['user_id'] = userId;
    data['name'] = name;
    data['username'] = username;
    return data;
  }
}
