import 'package:project_flow/models/project.dart';

enum LabelProject { Tasks, File }

class ProjectViewController {
  getTeamImages(Project project) {
    return project.team.map((user) {
      return user.avatar;
    }).toList();
  }
}
