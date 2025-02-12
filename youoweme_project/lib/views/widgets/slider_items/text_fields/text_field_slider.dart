import 'package:flutter/material.dart';
import 'package:youoweme_project/core/utils/theme.dart';

class InputFieldSlider extends StatelessWidget {
  final String? _hintText;
  final TextInputType _keyboardType;
  InputFieldSlider({super.key, String? hintText, bool? numberKeyboard})
      : _hintText = hintText,
        _keyboardType = numberKeyboard == true
            ? TextInputType.numberWithOptions()
            : TextInputType.text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      //margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        cursorColor: AppStyles.darkText(context),
        keyboardType: _keyboardType,
        style: TextStyle(
          fontSize: 20,
        ),
        decoration: InputDecoration(
          filled: true,
          hintText: _hintText,
          hintStyle: TextStyle(color: AppStyles.darkTextHint(context)),
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
        ),
      ),
    );
  }
}
