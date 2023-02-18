class SignUpResModel {
  final int status;
  final String message;
  final String userId;

  SignUpResModel({
    required this.status,
    required this.message,
    required this.userId,
  });

  factory SignUpResModel.fromJson(Map<String, dynamic> json) {
    return SignUpResModel(
      status: json["status"],
      message: json["message"],
      userId: json["userId"],
    );
  }
}
