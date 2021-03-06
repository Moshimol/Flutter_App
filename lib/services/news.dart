import 'package:http/http.dart' as http;
import 'dart:convert';
import '../conf/configure.dart';

//获新闻数据
getNewsResult() async{
  String url = 'http://' + Config.IP + ':' + Config.PORT + '/?action=get_news';
  print(url);

  var res = await http.get(url);
  String body = res.body;
  var json = jsonDecode(body);

  return json['items'] as List;
}