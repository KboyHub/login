import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:login/Components/form.dart';
import 'package:login/Components/loginButton.dart';
import 'package:login/Components/setupLink.dart';
import 'package:login/Components/whiteTick.dart';
import 'package:login/Login/loginAnimation.dart';
import 'package:login/Login/style.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key : key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  AnimationController _loginButtonController;
  var animationStatus = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginButtonController = AnimationController(
      duration: Duration(milliseconds: 3000),
      vsync: this
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _loginButtonController.dispose();
    super.dispose();

  }

  Future<Null> _playAnimation() async {
    try{
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    }on TickerCanceled{}
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (BuildContext buildContext) => new AlertDialog(
        title: Text('你确定吗？'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () =>Navigator.of(context).pop(false),
            child: Text('否'),
          ),
          new FlatButton(
            onPressed: () =>Navigator.pushReplacementNamed(context, '/home'),
            child: Text('是'),
          )
        ],
      )
    ) ?? false;

}

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image:backgroundImage,
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  const Color.fromRGBO(110, 199, 129, 0.8),
                  const Color.fromRGBO(51, 51, 63, 0.9),
                ],
                stops: [0.2,1.0],
                begin: const FractionalOffset(0.0,0.0),
                end:  const FractionalOffset(0.0,1.0),
              )
            ),
            child: ListView(
              padding: const EdgeInsets.all(0.0),
              children: <Widget>[
                new Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Tick(image: tick),
                        FormContainer(),
                        Setup(),
                      ],
                    ),
                    animationStatus == 0 ? Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: InkWell(
                        onTap: (){
                          setState(() {
                            animationStatus = 1;
                          });
                          _playAnimation();
                        },
                        child: LoginButton(),
                      ),
                    ) : LoginAnimation(
                      buttonAnimationController: _loginButtonController.view,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


