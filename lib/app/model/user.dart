class User {
  int id;
  String name;
  String photo;
  String email;

  User({this.id, this.name, this.photo, this.email});

  User.fromJson(Map<String, dynamic> json) {
    print("json recebido: $json");
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['email'] = this.email;
    return data;
  }
}
