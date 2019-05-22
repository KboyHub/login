import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginAnimation extends StatelessWidget {

  final AnimationController buttonAnimationController;
  final Animation<EdgeInsets> containeCircleAnimation;
  final Animation buttonSqueezeanAnimation;
  final Animation buttonZoomOut;

  LoginAnimation({Key key,this.buttonAnimationController})
      : buttonSqueezeanAnimation = new Tween(
    begin: 320.0,
    end: 60.0,
  ).animate(CurvedAnimation(
    parent: buttonAnimationController,
    curve: Interval(
      0.0,
      0.150,
      ),
    ),
  ),
  buttonZoomOut = Tween(
    begin: 60.0,
    end: 1000.0,
  ).animate(CurvedAnimation(
    parent: buttonAnimationController,
    curve: Interval(
      0.550,
      0.999,
      curve: Curves.bounceOut,
      ),
     ),
  ),
  containeCircleAnimation = EdgeInsetsTween(
    begin: const EdgeInsets.only(bottom: 50.0),
    end:  const EdgeInsets.only(bottom: 0.0),
  ).animate(CurvedAnimation(
    parent: buttonAnimationController,
    curve: Interval(
      0.500,
      0.800,
      curve: Curves.ease,
       ),
     ),
  ), super(key : key);

  Future<Null> _playAnimation() async {
    try {
      await buttonAnimationController.forward();
      await buttonAnimationController.reverse();
    }on TickerCanceled {}
  }


  Widget _buildAnimation(BuildContext context,Widget child) {
    return Padding(
      padding: buttonZoomOut.value == 60
      ? const EdgeInsets.only(bottom: 50.0)
      : containeCircleAnimation.value,
      child: InkWell(
        onTap: (){
          _playAnimation();
        },
        child: Hero(
          tag: 'fade',
          child: buttonZoomOut.value <= 300
              ? Container(
                    width: buttonZoomOut.value == 60
                        ? buttonSqueezeanAnimation.value
                        :buttonZoomOut.value,
                    height: buttonZoomOut.value == 60 ? 60.0 : buttonZoomOut.value,
                    alignment: FractionalOffset.center,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(247, 64, 106, 1.0),
                      borderRadius: buttonZoomOut.value < 400
                          ? BorderRadius.all(const Radius.circular(30.0))
                          : BorderRadius.all(const Radius.circular(0.0)),
                    ),
                    child: buttonSqueezeanAnimation.value > 65.0
                         ? Text(
                             '登录',
                             style: TextStyle(
                               color: Colors.white,
                               fontSize: 20.0,
                               fontWeight: FontWeight.w300,
                               letterSpacing: 0.3,
                             ),
                    )
                         : buttonZoomOut.value < 300.0
                              ? CircularProgressIndicator(
                                  value: null,
                                  strokeWidth: 1.0,
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                )
                              : null)
              : Container(
                   width: buttonZoomOut.value,
                   height: buttonZoomOut.value,
                   decoration: BoxDecoration(
                     shape: buttonZoomOut.value < 500
                         ? BoxShape.circle
                         : BoxShape.rectangle,
                     color: const Color.fromRGBO(247, 64, 106, 1.0),
                   ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    buttonAnimationController.addListener((){
      if (buttonAnimationController.isCompleted){
        Navigator.pushNamed(context, '/home');
      }
    });
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: buttonAnimationController,
    );
  }
}
