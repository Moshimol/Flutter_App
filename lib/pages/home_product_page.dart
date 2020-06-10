import 'package:flutter/material.dart';
import '../model/product.dart';
import '../utils/utils.dart';
import 'product_detail_page.dart';

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

  // 标题和列表
  Widget _build(BuildContext context, double deivceWidth) {
    //item 的宽度
    double itemWidth = (deivceWidth - 20) / 2.0;
    double imageWidth = (deivceWidth - 56 - 10) / 2.0;

    //返回产品列表
    List<Widget> listWidgets = list.data.map((i) {
      Color bgColor = StringToColor('#FFf8f8f8');
      Color titleColor = StringToColor('#FFdb5411');
      Color subtitileColor = StringToColor('#FF999999');

      // 返回产品
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetail(item: i)),
          );
        },
        child: Container(
          width: itemWidth,
          height: 200.0,
          color: bgColor,
          margin: EdgeInsets.only(bottom: 5, left: 2),
          padding: EdgeInsets.only(top: 10.0, left: 13, bottom: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                i.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12.0, color: titleColor),
              ),
              Text(
                i.desc,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12.0, color: subtitileColor),
              ),
              Container(
                alignment: Alignment(0, 0),
                margin: EdgeInsets.only(top: 5.0),
                child: Image.network(
                    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1591813132686&di=d04c1cd721b42b32e0af11f8f953bbcc&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201407%2F08%2F20140708220431_Ny5w4.jpeg"),
                width: imageWidth,
                height: itemWidth - 40,
              ),
            ],
          ),
        ),
      );
    }).toList();

    //标题及产品列表
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 5, bottom: 10),
          child: Text(
            '最新产品',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
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
