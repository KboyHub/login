import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.0,
      height: 60.0,
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(247, 64, 106, 1.0),
        borderRadius: BorderRadius.all(const Radius.circular(30.0))
      ),
      child: Text(
        '登录',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
