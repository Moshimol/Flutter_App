import 'package:flutter/material.dart';
import 'package:websiteflutter/model/news.dart';

class NewsDetail extends StatelessWidget {
  final NewsItemModal item;

  NewsDetail({Key key,@required this.item}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.network(
            'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=1130432669,1153405039&fm=26&gp=0.jpg',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(item.content),
          ),
        ],
      ),
    );
  }
}