class OtpReqModel {
  OtpReqModel({
    required this.userId,
    required this.otp,
  });

  final String userId;
  final String otp;

  factory OtpReqModel.fromJson(Map<String, dynamic> json) => OtpReqModel(
        userId: json["userId"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "otp": otp,
      };
}
