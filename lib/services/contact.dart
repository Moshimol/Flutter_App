import 'package:http/http.dart' as http;
import 'dart:convert';
import '../conf/configure.dart';

//获取产品数据
postContactUs(String msg) async{
  String url = 'http://' + Config.IP + ':' + Config.PORT + '/?action=company&msg=$msg';
  print(url);

  var res = await http.get(url);
  String info = res.body;
  print(info);
  return info;
}