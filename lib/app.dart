import 'package:flutter/material.dart';

import 'pages/about_us_page.dart';
import 'pages/home_page.dart';
import 'pages/news_page.dart';
import 'pages/product_page.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  // 添加索引变量
  var _current_index = 0;

  // 分为3个部分  头 中间 底部
  HomePage homepage;
  ProductPage productPage;
  NewsPage newsPage;
  AboutPage aboutPage;

  currentPage() {
    switch (_current_index) {
      case 0:
        if (homepage == null) {
          homepage = HomePage();
        }
        return homepage;
      case 1:
        if (productPage == null) {
          productPage = ProductPage();
        }
        return productPage;
      case 2:
        if (newsPage == null) {
          newsPage = NewsPage();
        }
        return newsPage;
      case 3:
        if (aboutPage == null) {
          aboutPage = AboutPage();
        }
        return aboutPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter企业站实战"),
        leading: Icon(Icons.home),
        actions: <Widget>[
          // 右侧的内边距
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
              ),
            ),
          )
        ],
      ),

      // 中间

      body: currentPage(),

      // 底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _current_index,
        onTap: ((index) {
          setState(() {
            _current_index = index;
          });
        }),

        // 底部导航栏
        items: [
          BottomNavigationBarItem(
            title: Text(
              "首页",
            ),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("产品"),
            icon: Icon(Icons.apps),
          ),
          BottomNavigationBarItem(
            title: Text("新闻"),
            icon: Icon(Icons.filter_6),
          ),
          BottomNavigationBarItem(
            title: Text("关于我们"),
            icon: Icon(Icons.insert_comment),
          ),
        ],
      ),
    );
  }
}
