import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:project_flow/controllers/home_view_controller.dart';
import 'package:project_flow/models/project.dart';
import 'package:project_flow/style/my_style.dart';
import 'package:project_flow/utils/extensions/screen_size.dart';
import 'package:project_flow/widgets/appbar_container_icon_wideget.dart';
import 'package:project_flow/widgets/menu_label_task_widget.dart';
import 'package:project_flow/widgets/project/project_card_widget.dart';
import 'package:project_flow/widgets/task_cart_widget.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewController controller = HomeViewController();
  late final PageController _pageController = PageController(
    initialPage: controller.currentPage,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: AppbarContainerIconWideget(
          size: 30,
          isLeading: true,
          imagePath: "assets/home/Category.png",
          onTap: () {},
        ),
        actions: [
          AppbarContainerIconWideget(
            size: 30,
            imagePath: "assets/home/notifications.png",
            onTap: () {},
          ),
        ],
        title: Text(controller.formattedDate()),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StyleApp.sizeH16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "home.header".tr(),
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Visibility(
                  visible: Theme.of(context).brightness == Brightness.light,
                  child: Image.asset(
                    "assets/login/pop.png",
                    width: 64,
                    height: 49,
                  ),
                ),
              ],
            ),
            // show projects
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: context.getHight(pre: 0.25),
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    controller.currentPage = value;
                    controller.selectedMenu = projects[value].task[value].label;
                  });
                },
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return ProjectCardWidget(
                    project: projects[index],
                    isActive: controller.currentPage == index,
                  );
                },
              ),
            ),
            // show label of task in project
            MenuLabelTaskWidget(
              controller: controller,
              menu: controller.getListOfLabelTake(
                projects[controller.currentPage].task,
              ),
              onTap: () {
                setState(() {});
              },
            ),
            StyleApp.sizeH16,
            //show task in project with same label
            Expanded(
              child: ListView(
                shrinkWrap: true,
                // physics: const ClampingScrollPhysics(),

                children: [
                  ...projects[controller.currentPage]
                      .task
                      .where((item) => item.label == controller.selectedMenu)
                      .map((task) {
                    return TaskCartWidget(task: task);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
