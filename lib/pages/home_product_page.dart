import 'package:flutter/material.dart';
import '../model/product.dart';

class HomePageProductPage extends StatelessWidget {

  final ProductListModel list;

  HomePageProductPage(this.list);

  Widget build(BuildContext context) {

    double deivceWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 7.5),
      width: deivceWidth,
      child: _build(context, deivceWidth),
    );
  }


  Widget _build(BuildContext context, double deivceWidth) {
    //item 的宽度
    double itemWidth = (deivceWidth - 20) / 2.0;
    double imageWidth = (deivceWidth - 56 - 10 ) / 2.0;

    //返回产品列表
    List<Widget> listWidgets = list.data.map((i) {

      // 定义一个值
      return Container(
        width: itemWidth,
        height: 100.0,
        color: Colors.grey,
        margin: EdgeInsets.only(bottom: 5,left: 2),
        padding: EdgeInsets.only(top: 10.0,left: 13,bottom: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              i.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15.0,color: Colors.white),
            ),
            Text(
              i.desc,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15.0,color: Colors.white),
            ),
          ],
        ),
      );
    }).toList();

    //标题及产品列表
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 5,bottom: 10),
          child:Text('最新产品',style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),),
        ),
        //流式布局列表
        Wrap(
          spacing: 2,
          children: listWidgets,
        ),
      ],
    );
  }
}