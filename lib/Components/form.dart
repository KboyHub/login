import 'package:flutter/material.dart';
import 'package:login/Components/inputFields.dart';

class FormContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InputFieldArea(
                  hint: '用户名',
                  obscure: false,
                  icon: Icons.person_outline,
                ),
                InputFieldArea(
                  hint: '密码',
                  obscure: true,
                  icon: Icons.lock_outline,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
