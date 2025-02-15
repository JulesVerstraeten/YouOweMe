import 'package:flutter/material.dart';
import 'package:youoweme_project/core/utils/string_utils.dart';
import 'package:youoweme_project/core/utils/theme.dart';

class DropDownSlider<T> extends StatelessWidget {
  final String? label;
  final List<T> items;
  final T? selectedItem;
  final String Function(T) itemLabelBuilder;
  final Function(T?) onChanged;
  final String? Function(T?)? validator;

  const DropDownSlider(
      {super.key,
      required this.items,
      this.selectedItem,
      required this.itemLabelBuilder,
      required this.onChanged,
      this.label = "-",
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        constraints: BoxConstraints(maxWidth: 10000),
        child: DropdownButtonFormField<T>(
          validator: validator,
          decoration: InputDecoration(
            hintText: label,
            filled: true,
            fillColor: AppStyles.textFieldFill(context),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(width: 2, color: AppStyles.primaryBlue(context)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(width: 0, color: AppStyles.textFieldFill(context)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(width: 2, color: AppStyles.primaryRed(context)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:
                  BorderSide(width: 2, color: AppStyles.primaryRed(context)),
            ),
          ),
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
              child: Text(
                StringUtils.capitalizeFirstLetter(itemLabelBuilder(item)),
              ), // Laat het label zien gebaseerd op de functie
            );
          }).toList(),
        ),
      ),
    );
  }
}
