import 'package:flutter/material.dart';
import '../model/news.dart';
import '../services/news.dart';
import 'news_detail_page.dart';

class NewsPage extends StatefulWidget {
  @override
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  NewsListModel listData = NewsListModel([]);

  void getNewsList() async {
    var data = await getNewsResult();
    if (data != null) {
      NewsListModel list = NewsListModel.fromJosn(data);

      setState(() {
        if (list.data.length > 0) {
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
              leading: Icon(Icons.fiber_new),
              trailing: Icon(Icons.arrow_forward_ios),
              contentPadding: EdgeInsets.all(10.0),
              enabled: true,
              // 跳转到新闻详情页面
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewsDetail(item: item)),
                );
              },
            );
          },
          itemCount: listData.data.length),
    );
  }
}
