class PostModel {
  String? name;
  int? id;
  String? username;
  String? email;

  PostModel({this.name, this.id, this.username, this.email});

  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    return data;
  }
}