import 'package:project_flow/models/task.dart';
import 'package:project_flow/models/user.dart';

enum Status { inprogress, review, completed, onHold, cancelled }

class Project {
  final String title;
  final String subTitle;
  final Status status;
  final int totalTask;
  final int completedTask;
  final List<User> team;
  final List<Task> task;
  Project({
    required this.status,
    required this.task,
    required this.title,
    required this.team,
    required this.subTitle,
    required this.totalTask,
    required this.completedTask,
  });
}
// sample of projects

List<Project> projects = [
  Project(
    title: "Application Design",
    subTitle: "department of ",
    totalTask: 80,
    completedTask: 60,
    team: team1,
    status: Status.inprogress,
    task: applicationDesignTasks,
  ),
  Project(
    title: "Redesign Databse",
    subTitle: "department of infrastructure ",
    totalTask: 80,
    completedTask: 80,
    team: team1,
    status: Status.inprogress,
    task: redesignDatabaseTasks,
  ),
];
