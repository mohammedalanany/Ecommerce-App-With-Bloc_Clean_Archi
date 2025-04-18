class RegisterUserRequest {
  String? username;
  String? birth_date;
  String? email;
  String? phone;
  String? password;
  String? password_confirmation;
  RegisterUserRequest(
      {this.username,
      this.birth_date,
      this.email,
      this.phone,
      this.password,
      this.password_confirmation});
}
