import 'package:sawan_app/core/text/app_text.dart';

class TabBarSizeModel {
  final String title;

  TabBarSizeModel({required this.title});
}

List<TabBarSizeModel> sizeData = [
  TabBarSizeModel(title: AppText.size1),
  TabBarSizeModel(title: AppText.size2),
  TabBarSizeModel(title: AppText.size3),
  TabBarSizeModel(title: AppText.size4),
];
