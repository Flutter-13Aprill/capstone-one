class TeamUser {
  final int userId;
  final int userJobId;
  final int teamId;

  TeamUser({
    required this.userId,
    required this.userJobId,
    required this.teamId,
  });

  factory TeamUser.fromJson(Map<String, dynamic> json) => TeamUser(
        userId: json["user_id"] as int ,
        userJobId: json["user_job_id"] as int,
        teamId: json["team_id"] as int,
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_job_id": userJobId,
        "team_id": teamId,
      };
}