import 'package:flutter/material.dart';

class CustomTimePicker extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> onTimeChanged;

  const CustomTimePicker({super.key,
    required this.controller,
    required this.hintText,
    required this.onTimeChanged});

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
          icon: const Icon(Icons.access_alarms_sharp, color: Color(0xff2a44c5)),
      onPressed: () async {
        final timeOfDay = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (timeOfDay != null) {
          final formattedTime = timeOfDay.format(context);
          controller.text = timeOfDay.format(context);
          onTimeChanged(formattedTime);
        }
      },
    ),
      ),
    );
  }
}
