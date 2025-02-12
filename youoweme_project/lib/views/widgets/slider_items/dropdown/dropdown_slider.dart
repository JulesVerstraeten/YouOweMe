import 'package:flutter/material.dart';
import 'package:youoweme_project/core/utils/theme.dart';

class DropDownSlider<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedItem;
  final String Function(T) itemLabelBuilder;
  final Function(T?) onChanged;

  const DropDownSlider(
      {super.key,
      required this.items,
      this.selectedItem,
      required this.itemLabelBuilder,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        constraints: BoxConstraints(maxWidth: 10000),
        child: DropdownButton<T>(
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 24,
          ),
          style: TextStyle(
            fontSize: 20,
            color: AppStyles.darkText(context),
          ),
          dropdownColor: AppStyles.primaryColor(context),
          value: selectedItem,
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<T>>((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(itemLabelBuilder(
                  item)), // Laat het label zien gebaseerd op de functie
            );
          }).toList(),
        ),
      ),
    );
  }
}
