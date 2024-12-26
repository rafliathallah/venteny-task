import '../common_typography.dart';
import 'package:flutter/material.dart';
import '../common_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function? onBackTap;
  final bool showBackArrow;
  final Color? backgroundColor;
  final List<Widget>? actionWidgets;

  const CustomAppBar({super.key,
    required this.title,
    this.onBackTap,
    this.showBackArrow = true,
    this.backgroundColor = CommonColors.orangeFF,
    this.actionWidgets
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      elevation: 0,
      leading: showBackArrow ? IconButton(
        icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        onPressed: () {
          if (onBackTap != null) {
            onBackTap!();
          } else {
            Navigator.of(context).pop();
          }
        },
      ) : null,
      actions: actionWidgets,
      title: Row(
        children: [
          Text(title,style: CommonTypography.textH7.copyWith(color: Colors.white),)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}