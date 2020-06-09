import 'package:flutter/material.dart';
import 'package:websiteflutter/pages/home_banner.dart';
import 'package:websiteflutter/services/product.dart';
import 'home_page.dart';
import '../model/product.dart';
import '../pages/home_product_page.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  ProductListModel listData = ProductListModel([]);

  void getProductList() async {
    var data = await getProdutResult();
    if(data != null) {
      ProductListModel list = ProductListModel.fromJosn(data);
      setState(() {
        if(list.data.length > 0) {
          listData.data.addAll(list.data);

        }
      });
    }
  }


  @override
  void initState(){
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          BannerWidget(),
          HomePageProductPage(listData),

        ],
      ),
    );

  }
}
