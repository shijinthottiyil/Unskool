class Links {
  Links({
    required this.id,
  });

  final String id;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
      };
}
