class OtpResModel {
  OtpResModel({
    required this.message,
  });

  final String message;

  factory OtpResModel.fromJson(Map<String, dynamic> json) => OtpResModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
