import 'package:flutter/material.dart';
import 'package:project_flow/Theme/app_colors.dart';
import 'package:project_flow/controllers/home_view_controller.dart';
import 'package:project_flow/models/label.dart';

class MenuLabelTaskWidget extends StatefulWidget {
  MenuLabelTaskWidget({
    super.key,
    required this.controller,
    required this.menu,
    required this.onTap,
  });
  HomeViewController controller;
  Set<LabelOptions> menu;

  Function onTap;

  @override
  State<MenuLabelTaskWidget> createState() => _MenuLabelTaskWidgetState();
}

class _MenuLabelTaskWidgetState extends State<MenuLabelTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: InkWell(
            onTap: () {
              widget.controller.isExpandedMenu =
                  !widget.controller.isExpandedMenu;
              widget.onTap();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // menu title 
                Text(
                  widget.controller.selectedMenu.name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                ),
                Icon(
                  widget.controller.isExpandedMenu
                      ? Icons.arrow_drop_down
                      : Icons.arrow_forward_ios,
                  size: 16.0,
                  color: AppColors.primaryLight, 
                ),
              ],
            ),
          ),
        ),
        //show submenu 
        if (widget.controller.isExpandedMenu)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widget.menu
                .map(
                  (item) => TextButton(
                    onPressed: () {
                      setState(() {
                        widget.controller.selectedMenu = item;
                        widget.controller.isExpandedMenu = false;
                        widget.onTap();
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary, 
                    ),
                    child: Text(
                      item.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }
}
