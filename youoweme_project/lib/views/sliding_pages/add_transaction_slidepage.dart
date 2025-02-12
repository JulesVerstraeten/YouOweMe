import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youoweme_project/core/models/contact.dart';
import 'package:youoweme_project/core/utils/theme.dart';
import 'package:youoweme_project/viewmodels/local_viewmodel.dart';
import 'package:youoweme_project/views/widgets/slider_items/buttons/add_button_slider.dart';
import 'package:youoweme_project/views/widgets/slider_items/dropdown/dropdown_slider.dart';
import 'package:youoweme_project/views/widgets/slider_items/text_fields/text_field_slider.dart';

class TransactionSlidePage extends StatelessWidget {
  const TransactionSlidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LocalViewModel>(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppStyles.primaryColor(context),
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
            Row(
              children: [
                DropDownSlider(
                  selectedItem: viewModel.selectedContact,
                  items: viewModel.contacts,
                  itemLabelBuilder: (contact) => contact.giveName(),
                  onChanged: (contact) {
                    viewModel.selectContact(contact!);
                  },
                ),
                SizedBox(
                  width: 16,
                ),
                AddButtonSlider(),
              ],
            ),
            InputFieldSlider(
              hintText: "Bedrag",
              numberKeyboard: true,
            ),
            InputFieldSlider(
              hintText: "Yolo",
              numberKeyboard: true,
            ),
          ],
        ),
      ),
    );
  }
}
