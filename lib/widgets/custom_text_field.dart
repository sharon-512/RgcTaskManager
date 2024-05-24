import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLength;

  const CustomTextField(
      {super.key, required this.controller, required this.hintText, required this.maxLength});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.text.length >  widget.maxLength) {
        widget.controller.text = widget.controller.text.substring(0,  widget.maxLength);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        cursorColor: Colors.blueAccent,
        controller: widget.controller,
        maxLength:  widget.maxLength,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffbbbbbb),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 13),
          counterText: '${widget.controller.text.length}/${ widget.maxLength}',
          counterStyle: const TextStyle(
            color: Colors.grey, // Change the text color
            fontWeight: FontWeight.w400, // Make the text bold
            fontSize: 11, // Increase the font size
          ),
        ),
      ),
    );
  }
}
