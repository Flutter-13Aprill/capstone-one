class Department {
  final int id;
  final String name;
  final int leaderUserId;
  final int referenceId;

  Department({
    required this.id,
    required this.name,
    required this.leaderUserId,
    required this.referenceId,
  });

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json["id"] as int,
        name: json["name"] as String,
        leaderUserId: json["leader_user_id"] as int,
        referenceId: json["reference_id"] as int,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "leader_user_id": leaderUserId,
        "reference_id": referenceId,
      };
}