import 'package:flutter/material.dart';
import 'package:youoweme_project/core/utils/theme.dart';
import 'package:youoweme_project/views/widgets/text_fields/text_field.dart';

class AddTransactionSlidePage {
  void showSlidingPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Volledige hoogte mogelijk
      backgroundColor:
          Colors.transparent, // Transparante achtergrond voor effect
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9, // Start op 50% van het scherm
        minChildSize: 0.9, // Minimaal 30% van het scherm
        maxChildSize: 0.9, // Kan volledig scherm worden
        expand: false,
        builder: (context, scrollController) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppStyles.primaryColor(context),
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 32,
                    ),
                  ),
                ),
                // Container(
                //   width: 50,
                //   height: 5,
                //   margin: EdgeInsets.symmetric(vertical: 10),
                //   decoration: BoxDecoration(
                //     color: const Color.fromARGB(255, 107, 74, 74),
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                // ),
                InputField(
                  hintText: "Bedrag",
                  numberKeyboard: true,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
