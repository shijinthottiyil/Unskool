class SignInReqModel {
  final String email;
  final String password;

  SignInReqModel({required this.email, required this.password});

  factory SignInReqModel.fromJson(Map<String, dynamic> json) {
    return SignInReqModel(
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
