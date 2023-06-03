import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: Text('Custom DateTime Picker')),
      body: CustomDateTimePicker(
        onChanged: (value) => print(value),
      ),
    ),
  ));
}

class CustomDateTimePicker extends StatefulWidget {
  final ValueChanged<DateTime> onChanged;

  CustomDateTimePicker({required this.onChanged});

  @override
  _CustomDateTimePickerState createState() => _CustomDateTimePickerState();
}

class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  DateTime _selectedDateTime = DateTime.now();

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
      );
      if (selectedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            picked.year,
            picked.month,
            picked.day,
            selectedTime.hour,
            selectedTime.minute,
          );
        });
        widget.onChanged(_selectedDateTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDateTime(context),
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Date and Time',
            suffixIcon: Icon(Icons.calendar_today),
          ),
          controller: TextEditingController(
            text: _selectedDateTime != null
                ? DateFormat.yMd().add_jm().format(_selectedDateTime)
                : '',
          ),
        ),
      ),
    );
  }
}
