import 'package:flutter/material.dart';
import '../model/news.dart';
import '../services/news.dart';

class NewsPage extends StatefulWidget {
  @override
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  NewsListModel listData = NewsListModel([]);

  void getNewsList() async {
    var data = await getNewsResult();
    if(data != null) {
      NewsListModel list = NewsListModel.fromJosn(data);

      setState(() {
        if(list.data.length > 0) {
          listData.data.addAll(list.data);
        }
      });
    }
  }

  @override
  void initState() {
    getNewsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          scrollDirection: Axis.vertical,
          separatorBuilder: (BuildContext context, int index) => Divider(
                height: 1.0,
                color: Colors.grey,
              ),
          itemBuilder: (BuildContext context, int index) {
            NewsItemModal item = listData.data[index];

            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.content),
            );
          },
          itemCount: listData.data.length),
    );
  }
}
