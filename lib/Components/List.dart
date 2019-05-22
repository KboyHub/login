import 'package:flutter/material.dart';

class ListData extends StatelessWidget {
  final EdgeInsets margin;
  final double width;
  final String title;
  final String subtitle;
  final DecorationImage image;

  ListData({this.width,this.margin,this.image,this.title,this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: margin,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            width: 1.0,
            color: const Color.fromRGBO(204, 204, 204, 0.3),
          ),
          bottom: BorderSide(
            width: 1.0,
            color: const Color.fromRGBO(204, 204, 204, 0.3),
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20.0,top: 10.0,bottom: 10.0,right: 20.0),
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,image: image
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
