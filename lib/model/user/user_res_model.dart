import 'user_details.dart';

class UserResModel {
  UserResModel({
    required this.status,
    required this.userDetails,
    required this.entrolledCourse,
    required this.message,
  });

  final bool status;
  final UserDetails userDetails;
  final List<dynamic> entrolledCourse;
  final String message;

  factory UserResModel.fromJson(Map<String, dynamic> json) => UserResModel(
        status: json["status"],
        userDetails: UserDetails.fromJson(json["userDetails"]),
        entrolledCourse:
            List<dynamic>.from(json["entrolledCourse"].map((x) => x)),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "userDetails": userDetails.toJson(),
        "entrolledCourse": List<dynamic>.from(entrolledCourse.map((x) => x)),
        "message": message,
      };
}
