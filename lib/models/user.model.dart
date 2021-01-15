class User {
  final String employeeId;
  final String personName;
  final String roleId;
  final String refreshToken;
  final String jwtToken;

  User(this.employeeId, this.personName, this.roleId, this.refreshToken,
      this.jwtToken);
}
