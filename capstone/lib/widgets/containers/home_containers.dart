import 'package:capstone/extensions/size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeContainers extends StatelessWidget {
  const HomeContainers({
    super.key,
    required this.setImage,
    required this.setTitle,
    this.widgetPath,
    this.setColor,
    this.isLocked,
  });

  final Widget setImage;
  final String setTitle;
  final Widget? widgetPath;
  final Color? setColor;
  final bool? isLocked;
  // here is the home screen containers 
  //if the user clicked on avilable game will go to play
  //if not bottomsheet will show with massage 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (widgetPath != null) {
              Navigator.push(
                context,

                MaterialPageRoute(builder: (context) => widgetPath!),
              );
            }
            if (isLocked == true) {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    width: context.getWidth(),
                    height: context.getHieght() * 0.5,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 172, 173, 173),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Text(
                          'bottomSheetTitle'.tr(),
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(height: 25),

                        Container(
                          width: context.getWidth() * 0.75,
                          child: Text(textAlign: TextAlign.center,
                            'bottomSheetBody'.tr(),
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
          child: Container(
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.only(top: 10),
            width: context.getWidth()*0.352,
            height: context.getHieght()*0.157,
            decoration: BoxDecoration(
              color: setColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: setImage,
          ),
        ),
        Text(setTitle),
      ],
    );
  }
}
