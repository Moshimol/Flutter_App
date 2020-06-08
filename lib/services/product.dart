import 'package:http/http.dart' as http;
import 'dart:convert';
import '../conf/configure.dart';


get_productResult([int page = 0]) async {
  String url = 'http://' + Config.IP + ':' +Config.PORT + '/?action=get_products&page=$page';

  var res = await http.get(url);

  String body =  res.body;

  var json = jsonDecode(body);

  return json['item'] as List;

}