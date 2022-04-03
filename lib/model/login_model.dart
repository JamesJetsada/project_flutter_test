class Loginmodel {
  String? id;
  String? username;
  String? password;
  String? name;
  String? phone;
  String? email;

  Loginmodel(
      {this.id,
      this.username,
      this.password,
      this.name,
      this.phone,
      this.email});

  Loginmodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    return data;
  }
}