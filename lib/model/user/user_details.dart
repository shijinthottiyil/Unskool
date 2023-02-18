import 'package:unskool/model/user/links.dart';

class UserDetails {
  UserDetails({
    required this.id,
    required this.profileImg,
    required this.name,
    required this.email,
    required this.password,
    required this.userVerified,
    required this.links,
    required this.v,
  });

  final String id;
  final String profileImg;
  final String name;
  final String email;
  final String password;
  final bool userVerified;
  final Links links;
  final int v;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["_id"],
        profileImg: json["profile_img"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        userVerified: json["user_verified"],
        links: Links.fromJson(json["links"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "profile_img": profileImg,
        "name": name,
        "email": email,
        "password": password,
        "user_verified": userVerified,
        "links": links.toJson(),
        "__v": v,
      };
}
