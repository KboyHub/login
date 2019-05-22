import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Setup extends StatelessWidget {
  Setup();
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: const EdgeInsets.only(top: 160.0),
      onPressed: () => print('注册'),
      child: Text(
        '还没有账号吗？【点击注册】',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        softWrap: true,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          letterSpacing: 0.5,
          color: Colors.white,
          fontSize: 12.0,
        )
      ),
    );
  }
}
