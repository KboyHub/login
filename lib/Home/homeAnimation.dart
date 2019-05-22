import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class HomeAnimation extends StatelessWidget {
  HomeAnimation({Key key,this.buttonController}):
      buttonZoomOutAnimation = Tween(
        begin: 60.0,
        end: 1000.0,
      ).animate(
        CurvedAnimation(
          parent: buttonController,
          curve: Curves.easeOut,
        ),
      ),
      buttonBottomCenterAnimation = AlignmentTween(
        begin: Alignment.bottomRight,
        end: Alignment.center,
      ).animate(
        CurvedAnimation(
          parent: buttonController,
          curve: Interval(
            0.0,
            0.200,
            curve: Curves.easeOut,
          ),
        ),
      ),
      super(key:key);

  final Animation<double> buttonController;
  final Animation buttonZoomOutAnimation;
  final Animation<Alignment> buttonBottomCenterAnimation;

  Widget _buildAnimation(BuildContext context,Widget child){
    timeDilation = 0.4;
    return Padding(
      padding: buttonZoomOutAnimation.value < 400
          ? EdgeInsets.all(20.0)
          : EdgeInsets.all(0.0),
      child: Container(
        alignment: buttonBottomCenterAnimation.value,
        child: InkWell(
          child: Container(
            width: buttonZoomOutAnimation.value,
            height: buttonZoomOutAnimation.value,
            alignment: buttonBottomCenterAnimation.value,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(247, 64, 106, 1.0),
                shape: buttonZoomOutAnimation.value <400
                    ? BoxShape.circle
                    : BoxShape.rectangle
            ),
            child: Icon(
              Icons.add,
              size: buttonZoomOutAnimation.value <50
                  ? buttonZoomOutAnimation.value
                  : 0.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    buttonController.addListener((){
      if(buttonController.isCompleted){
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: buttonController,
    );
  }
}


