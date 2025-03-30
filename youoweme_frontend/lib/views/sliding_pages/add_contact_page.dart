import 'package:flutter/material.dart';
import 'package:youoweme_project/core/utils/theme.dart';

class AddContactSlidePage extends StatelessWidget {
  const AddContactSlidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppStyles.primaryColor(context),
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [Text("Copnta")],
        ),
      ),
    );
  }
}
