class TabBarProductModel {
  final String titleKey;
  TabBarProductModel({required this.titleKey});
}

List<TabBarProductModel> getTabData() {
  return [
    TabBarProductModel(titleKey: "tabbartitle1"),
    TabBarProductModel(titleKey: "tabbartitle2"),
    TabBarProductModel(titleKey: "tabbartitle3"),
    TabBarProductModel(titleKey: "tabbartitle4"),
    TabBarProductModel(titleKey: "tabbartitle5"),
  ];
}
