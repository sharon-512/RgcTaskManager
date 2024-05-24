import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onStartDateChanged;
  final ValueChanged<String> onEndDateChanged;
  final TextEditingController controller;

  const CustomDatePicker({super.key,
    required this.hintText,
    required this.onStartDateChanged,
    required this.onEndDateChanged,
    required this.controller,});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true, // make it read-only
      decoration: InputDecoration(
        fillColor: const Color(0x94bed5ff),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder( // this is the active border
          borderSide: const BorderSide(color: Color(0x94bed5ff),),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder( // this is the active border
          borderSide: const BorderSide(color: Color(0x94bed5ff),),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
            color: Color(0xbd4f4f4f),
            fontWeight: FontWeight.w400,
            fontSize: 13
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_month_outlined, color: Color(0xff2a44c5),),
          onPressed: () async {
            final dateRange = await showDateRangePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (dateRange != null) {
              final formattedStartDate = DateFormat('dd-MM-yyyy').format(dateRange.start); // format the start date
              final formattedEndDate = DateFormat('dd-MM-yyyy').format(dateRange.end); // format the end date
              controller.text = '$formattedStartDate - $formattedEndDate';
              onStartDateChanged(formattedStartDate);
              onEndDateChanged(formattedEndDate);
            }
          },
        ),
      ),
    );
  }
}
