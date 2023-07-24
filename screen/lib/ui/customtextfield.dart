import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final void Function(String) onSubmitted;

  const CustomTextField({Key? key, required this.label, required this.onSubmitted})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        SizedBox(height: 10.0),
        TextField(
          controller: _controller,
          onChanged: (value) {
            widget.onSubmitted(value); // Pass the entered value to the callback
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
