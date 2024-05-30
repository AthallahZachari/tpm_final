import "package:flutter/material.dart";

class MyTextfield extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Function(String) onChanged;

  MyTextfield({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Color.fromARGB(41, 130, 130, 130)),
          ),
          fillColor: Color.fromARGB(255, 223, 223, 223),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 14
          ),
        ),
        onChanged: (value) => onChanged(value),
      ),
    );
  }
}
