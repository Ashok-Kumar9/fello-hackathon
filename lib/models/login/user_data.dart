import 'dart:convert';

class UserDataModel {
  final AcademicProfile? academicProfile;
  final PersonalInfo? personalInfo;

  UserDataModel({
    this.academicProfile,
    this.personalInfo,
  });

  UserDataModel copyWith({
    AcademicProfile? academicProfile,
    PersonalInfo? personalInfo,
  }) =>
      UserDataModel(
        academicProfile: academicProfile ?? this.academicProfile,
        personalInfo: personalInfo ?? this.personalInfo,
      );

  factory UserDataModel.fromRawJson(String str) => UserDataModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    academicProfile: json["academic_profile"] == null ? null : AcademicProfile.fromJson(json["academic_profile"]),
    personalInfo: json["personal_info"] == null ? null : PersonalInfo.fromJson(json["personal_info"]),
  );

  Map<String, dynamic> toJson() => {
    "academic_profile": academicProfile?.toJson(),
    "personal_info": personalInfo?.toJson(),
  };
}

class AcademicProfile {
  final int? id;
  final int? user;
  final String? name;
  final String? erp;
  final String? location;
  final List<Branch>? branch;
  final SchoolFk? schoolFk;
  final dynamic upi;
  final String? phoneNo;
  final String? email;

  AcademicProfile({
    this.id,
    this.user,
    this.name,
    this.erp,
    this.location,
    this.branch,
    this.schoolFk,
    this.upi,
    this.phoneNo,
    this.email,
  });

  AcademicProfile copyWith({
    int? id,
    int? user,
    String? name,
    String? erp,
    String? location,
    List<Branch>? branch,
    SchoolFk? schoolFk,
    dynamic upi,
    String? phoneNo,
    String? email,
  }) =>
      AcademicProfile(
        id: id ?? this.id,
        user: user ?? this.user,
        name: name ?? this.name,
        erp: erp ?? this.erp,
        location: location ?? this.location,
        branch: branch ?? this.branch,
        schoolFk: schoolFk ?? this.schoolFk,
        upi: upi ?? this.upi,
        phoneNo: phoneNo ?? this.phoneNo,
        email: email ?? this.email,
      );

  factory AcademicProfile.fromRawJson(String str) => AcademicProfile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AcademicProfile.fromJson(Map<String, dynamic> json) => AcademicProfile(
    id: json["id"],
    user: json["user"],
    name: json["name"],
    erp: json["erp"],
    location: json["location"],
    branch: json["branch"] == null ? [] : List<Branch>.from(json["branch"]!.map((x) => Branch.fromJson(x))),
    schoolFk: json["school_fk"] == null ? null : SchoolFk.fromJson(json["school_fk"]),
    upi: json["upi"],
    phoneNo: json["phone_no"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user,
    "name": name,
    "erp": erp,
    "location": location,
    "branch": branch == null ? [] : List<dynamic>.from(branch!.map((x) => x.toJson())),
    "school_fk": schoolFk?.toJson(),
    "upi": upi,
    "phone_no": phoneNo,
    "email": email,
  };
}

class Branch {
  final int? id;
  final String? branchName;
  final String? branchLatitude;
  final String? branchLongitude;
  final String? city;

  Branch({
    this.id,
    this.branchName,
    this.branchLatitude,
    this.branchLongitude,
    this.city,
  });

  Branch copyWith({
    int? id,
    String? branchName,
    String? branchLatitude,
    String? branchLongitude,
    String? city,
  }) =>
      Branch(
        id: id ?? this.id,
        branchName: branchName ?? this.branchName,
        branchLatitude: branchLatitude ?? this.branchLatitude,
        branchLongitude: branchLongitude ?? this.branchLongitude,
        city: city ?? this.city,
      );

  factory Branch.fromRawJson(String str) => Branch.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"],
    branchName: json["branch_name"],
    branchLatitude: json["branch_latitude"],
    branchLongitude: json["branch_longitude"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "branch_name": branchName,
    "branch_latitude": branchLatitude,
    "branch_longitude": branchLongitude,
    "city": city,
  };
}

class SchoolFk {
  final int? id;
  final String? schoolName;
  final dynamic schoolCode;

  SchoolFk({
    this.id,
    this.schoolName,
    this.schoolCode,
  });

  SchoolFk copyWith({
    int? id,
    String? schoolName,
    dynamic schoolCode,
  }) =>
      SchoolFk(
        id: id ?? this.id,
        schoolName: schoolName ?? this.schoolName,
        schoolCode: schoolCode ?? this.schoolCode,
      );

  factory SchoolFk.fromRawJson(String str) => SchoolFk.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SchoolFk.fromJson(Map<String, dynamic> json) => SchoolFk(
    id: json["id"],
    schoolName: json["school_name"],
    schoolCode: json["school_code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "school_name": schoolName,
    "school_code": schoolCode,
  };
}

class PersonalInfo {
  final int? userId;
  final String? firstName;
  final String? username;
  final String? token;
  final DateTime? expireDate;
  final String? role;

  PersonalInfo({
    this.userId,
    this.firstName,
    this.username,
    this.token,
    this.expireDate,
    this.role,
  });

  PersonalInfo copyWith({
    int? userId,
    String? firstName,
    String? username,
    String? token,
    DateTime? expireDate,
    String? role,
  }) =>
      PersonalInfo(
        userId: userId ?? this.userId,
        firstName: firstName ?? this.firstName,
        username: username ?? this.username,
        token: token ?? this.token,
        expireDate: expireDate ?? this.expireDate,
        role: role ?? this.role,
      );

  factory PersonalInfo.fromRawJson(String str) => PersonalInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
    userId: json["user_id"],
    firstName: json["first_name"],
    username: json["username"],
    token: json["token"],
    expireDate: json["expire_date"] == null ? null : DateTime.parse(json["expire_date"]),
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "first_name": firstName,
    "username": username,
    "token": token,
    "expire_date": "${expireDate!.year.toString().padLeft(4, '0')}-${expireDate!.month.toString().padLeft(2, '0')}-${expireDate!.day.toString().padLeft(2, '0')}",
    "role": role,
  };
}
