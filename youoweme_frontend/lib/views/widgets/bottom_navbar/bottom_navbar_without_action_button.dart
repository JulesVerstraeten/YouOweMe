import 'package:flutter/material.dart';
import 'package:youoweme_project/core/utils/navigation_helper.dart';
import 'package:youoweme_project/core/utils/theme.dart';

class BottomNavbarWithoutAction extends StatelessWidget {
  final String page;
  const BottomNavbarWithoutAction({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppStyles.primaryColor(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: AppStyles.secondaryColor3(context),
            ),
            onPressed: () {
              NavigationHelper.navigateToHome(context);
            },
            iconSize: 36,
          ),
          IconButton(
            icon: Icon(
              Icons.groups,
              color: AppStyles.secondaryColor3(context),
            ),
            onPressed: () {
              // Add functionality for groups button
            },
            iconSize: 36,
          ),
          IconButton(
            icon: Icon(
              Icons.description,
              color: AppStyles.secondaryColor3(context),
            ),
            onPressed: () {
              // Add functionality for description button
            },
            iconSize: 36,
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: AppStyles.secondaryColor3(context),
            ),
            onPressed: () {
              NavigationHelper.navigateToSetting(context);
            },
            iconSize: 36,
          ),
        ],
      ),
    );
  }
}
