import 'package:intl/intl.dart';
import 'package:project_flow/models/label.dart';
import 'package:project_flow/models/project.dart';
import 'package:project_flow/models/task.dart';

class HomeViewController {
  int currentPage = 0;
  bool isExpandedMenu = false;
  late LabelOptions selectedMenu =projects[0].task[0].label;
  String formattedDate() {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, d');
    return formatter.format(now);
  }
  Set<LabelOptions> getListOfLabelTake(List<Task> tasks){
    return tasks.map((item)=> item.label).toSet();
  }

  
}
