class SignInResModel {
  SignInResModel({
    this.jwtToken,
    this.message,
    this.loggedIn,
    this.time,
  });

  String? jwtToken;
  String? message;
  bool? loggedIn;
  int? time;

  factory SignInResModel.fromJson(Map<String, dynamic> json) => SignInResModel(
        jwtToken: json["jwtToken"],
        message: json["message"],
        loggedIn: json["loggedIn"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "jwtToken": jwtToken,
        "message": message,
        "loggedIn": loggedIn,
        "time": time,
      };
}
