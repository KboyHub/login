import 'package:flutter/material.dart';

class ProfileNotification extends StatelessWidget {
  final Animation<double> containerGrowAnimation;
  final DecorationImage profileImage;
  ProfileNotification({this.profileImage,this.containerGrowAnimation});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: containerGrowAnimation.value*30,
            height: containerGrowAnimation.value*30,
            margin: EdgeInsets.only(left: 80.0),
            child: Center(
              child: Text(
                '5',
                style: TextStyle(
                  fontSize: containerGrowAnimation.value*15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromRGBO(80, 210, 194, 1.0),
            ),
          ),
        ],
      ),
      width: containerGrowAnimation.value*100,
      height: containerGrowAnimation.value*100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: profileImage,
      ),
    );
  }
}
