import 'package:flutter/material.dart';
import 'package:youoweme_project/core/utils/theme.dart';

class DatePickerSlider extends StatefulWidget {
  final String label;
  final DateTime? selectedDate;
  final Function(DateTime?) onDateSelected;
  const DatePickerSlider(
      {super.key,
      required this.label,
      this.selectedDate,
      required this.onDateSelected});

  @override
  State<DatePickerSlider> createState() => _DatePickerSliderState();
}

class _DatePickerSliderState extends State<DatePickerSlider> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate;
  }

  Future<void> _pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
      widget.onDateSelected(pickedDate);
    } else {
      widget.onDateSelected(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppStyles.secondaryColor(context),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text(
            widget.label,
            style: TextStyle(
              fontSize: 18,
              color: AppStyles.darkTextHint(context),
            ),
          ),
          subtitle: Text(
            _selectedDate != null
                ? "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}"
                : "Geen datum geselecteerd",
            style: TextStyle(
              fontSize: 24,
              color: _selectedDate != null
                  ? AppStyles.darkText(context)
                  : AppStyles.darkTextHint(context),
            ),
          ),
          trailing: Icon(
            Icons.calendar_today,
            color: AppStyles.darkTextHint(context),
          ),
          onTap: () => _pickDate(context),
        ),
      ),
    );
  }
}
