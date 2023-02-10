class SignUpResModel {
  final int status;
  final String message;

  SignUpResModel({
    required this.status,
    required this.message,
  });

  factory SignUpResModel.fromJson(Map<String, dynamic> json) {
    return SignUpResModel(
      status: json["status"],
      message: json["message"],
    );
  }
}
