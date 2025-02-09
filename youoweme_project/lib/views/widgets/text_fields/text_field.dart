import 'package:flutter/material.dart';
import 'package:youoweme_project/core/utils/theme.dart';

class InputField extends StatelessWidget {
  final String? _hintText;
  final TextInputType _keyboardType;
  InputField({super.key, String? hintText, bool? numberKeyboard})
      : _hintText = hintText,
        _keyboardType = numberKeyboard == true
            ? TextInputType.numberWithOptions()
            : TextInputType.text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        child: TextField(
          keyboardType: _keyboardType,
          style: TextStyle(
            fontSize: 24,
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
      ),
    );
  }
}
