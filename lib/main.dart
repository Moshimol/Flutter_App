import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:websiteflutter/app.dart';

import 'loading.dart';
import 'app.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'flutter 企业站',

  // 自定义主题
  theme: mDafaultTheme,

  routes: <String,WidgetBuilder> {
    // app
    //
    "app":(BuildContext context) => App(),
    "complay_info":(BuildContext context) => WebviewScaffold(
      url : "https://www.baidu.com/",
      appBar: AppBar(
        title : Text("公司介绍"),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: (){

            Navigator.of(context).pushReplacementNamed('app');
          },
        ),
      ),
    )
  },
  //home 是主页

  // 置顶加载页面 应用启动的页面

  home: LoadingPage(),

));

final ThemeData mDafaultTheme = ThemeData(
  primaryColor: Colors.redAccent,
);