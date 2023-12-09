class UserDataModel {
  String mobileNumber;
  String password;
  UserDataModel({required this.mobileNumber, required this.password});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      mobileNumber: json['mobileNumber'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mobileNumber': mobileNumber,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'UserDataModel{mobileNumber: $mobileNumber, password: $password}';
  }
}
