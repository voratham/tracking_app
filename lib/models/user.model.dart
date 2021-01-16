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
}
