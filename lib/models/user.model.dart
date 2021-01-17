class User {
  String userName;
  String employeeId;
  String personName;
  String roleId;
  String refreshToken;
  String jwtToken;

  User(
      {this.employeeId,
      this.personName,
      this.roleId,
      this.refreshToken,
      this.jwtToken,
      this.userName});

  factory User.fromJson(Map<String, dynamic> json) {
    final User user = User(
      userName: json['userName'],
      employeeId: json['employeeId'],
      personName: json['personName'],
      roleId: json['roleId'],
      refreshToken: json['refreshToken'],
      jwtToken: json['jwtToken'],
    );
    return user;
  }

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "employeeId": employeeId,
        "personName": personName,
        "roleId": roleId,
        "refreshToken": refreshToken,
        "jwtToken": jwtToken,
      };
}
