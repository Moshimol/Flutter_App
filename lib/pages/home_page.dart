import 'package:flutter/material.dart';
import 'package:websiteflutter/pages/home_banner.dart';
import 'package:websiteflutter/services/product.dart';
import 'home_page.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          BannerWidget(),

          RaisedButton(
              child: Text("获取产品数据"),
              onPressed: (){
                get_productResult();
          })
        ],
      ),
    );

  }
}
