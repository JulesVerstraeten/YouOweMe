import 'package:flutter/material.dart';
import 'package:youoweme_project/core/utils/theme.dart';

class BigAddButtonSlider extends StatelessWidget {
  final String _text;
  final Color _color;
  final VoidCallback _onPressed;
  const BigAddButtonSlider(
      {super.key, required text, required color, required onPressed})
      : _color = color,
        _text = text,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: _color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: _onPressed,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            _text,
            style: TextStyle(
              color: AppStyles.whiteText(context),
              fontSize: 32,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
