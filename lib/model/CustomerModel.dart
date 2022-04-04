class CustomerModel {
  String? cusId;
  String? cusName;
  String? cusPhone;
  String? cusEmail;
  String? userId;

  CustomerModel(
      {this.cusId, this.cusName, this.cusPhone, this.cusEmail, this.userId});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    cusId = json['cus_id'];
    cusName = json['cus_name'];
    cusPhone = json['cus_phone'];
    cusEmail = json['cus_email'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cus_id'] = this.cusId;
    data['cus_name'] = this.cusName;
    data['cus_phone'] = this.cusPhone;
    data['cus_email'] = this.cusEmail;
    data['user_id'] = this.userId;
    return data;
  }
}