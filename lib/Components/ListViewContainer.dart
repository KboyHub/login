import 'package:flutter/material.dart';
import 'package:login/Components/Calender.dart';
import 'package:login/Components/List.dart';
import 'package:login/Home/style.dart';

class ListViewContent extends StatelessWidget {
  final Animation<double> listTileWidth;
  final Animation<Alignment> listSlideAnimation;
  final Animation<EdgeInsets> listSlidePosition;
  ListViewContent({this.listSlidePosition,this.listSlideAnimation,this.listTileWidth});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: listSlideAnimation.value,
      children: <Widget>[
        Calender(margin: listSlidePosition.value * 6.5,),
        ListData(
          margin: listSlidePosition.value * 5.5,
          width: listTileWidth.value,
          title: '朝阳公园走一遭',
          subtitle: '7 - 9am 慢跑',
          image: avatar1,
        ),
        ListData(
          margin: listSlidePosition.value * 4.5,
          width: listTileWidth.value,
          title: '我去上班喽',
          subtitle: '9:30 - 10:20am 写博客',
          image: avatar2,
        ),
        ListData(
          margin: listSlidePosition.value * 3.5,
          width: listTileWidth.value,
          title: '撸铁半小时',
          subtitle: '14:30 - 15:00pm 健身房',
          image: avatar3,
        ),
        ListData(
          margin: listSlidePosition.value * 2.5,
          width: listTileWidth.value,
          title: '永辉超市买菜做饭',
          subtitle: '18:30 - 19:00pm 买菜',
          image: avatar4,
        ),
        ListData(
          margin: listSlidePosition.value * 1.5,
          width: listTileWidth.value,
          title: 'hello world',
          subtitle: '20:00 - 22:00pm 敲代码',
          image: avatar5,
        ),
        ListData(
          margin: listSlidePosition.value * 0.5,
          width: listTileWidth.value,
          title: '该睡觉了',
          subtitle: '22:20 - 7:00 起床啦',
          image: avatar6,
        ),
      ],
    );
  }
}
