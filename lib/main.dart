
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login/Home/home.dart';
import 'package:login/Login/login.dart';

void main() =>runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '登录',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      onGenerateRoute: (RouteSettings settings){
        switch(settings.name){
          case '/login':
            return MyCustomRoute(
              builder: (_) => LoginPage(),
              settings: settings,
            );
          case '/home':
            return MyCustomRoute(
              builder: (_) => HomePage(),
              settings: settings,
            );
        }
      },
    );
  }
}


class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}