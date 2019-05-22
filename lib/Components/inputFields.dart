import 'package:flutter/material.dart';

class InputFieldArea extends StatelessWidget {
  final String hint;
  final bool obscure;
  final IconData icon;
  InputFieldArea({this.hint,this.obscure,this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.white24,
          ),
        )
      ),
      child: TextFormField(
        obscureText: obscure,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          border: InputBorder.none,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 15.0,
          ),
          contentPadding: const EdgeInsets.only(top: 25.0,right: 25.0,bottom: 25.0,left: 10.0),
        ),
      ),
    );
  }
}
