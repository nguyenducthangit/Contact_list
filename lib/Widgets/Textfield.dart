import 'package:flutter/material.dart';

class Textfield extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final FocusNode? focusNode;

  const Textfield({
    super.key,
    required this.hintText,
    required this.icon,
    required this.focusNode,
  });

  @override
  _TextfieldState createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        focusNode: widget.focusNode,
        keyboardType: TextInputType.number,
        maxLength: 10,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black38, fontSize: 20),
          prefixIcon: Icon(
            widget.icon,
            color: Colors.black45,
          ),
          filled: true,
          fillColor: Color(0xFFedf0f8),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
