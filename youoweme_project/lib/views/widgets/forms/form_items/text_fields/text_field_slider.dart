import 'package:flutter/material.dart';
import 'package:youoweme_project/core/utils/theme.dart';

class InputFieldSlider extends StatelessWidget {
  final int? _maxLines;
  final String? _hintText;
  final TextInputType _keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController _controller;
  const InputFieldSlider(
      {super.key,
      String? hintText,
      TextInputType? numberKeyboard,
      int? maxLines,
      this.validator,
      required TextEditingController controller})
      : _hintText = hintText,
        _keyboardType = numberKeyboard ?? TextInputType.text,
        _maxLines = maxLines ?? 1,
        _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      //margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        controller: _controller,
        validator: validator,
        maxLines: _maxLines,
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
