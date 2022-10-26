import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:news_app_with_api/tesla model/tesla_model.dart';

class ApiServices0 {
  // Future<http.Response> getNews() {
  //   return http.get(endPointUrl);
  // }
  // final endPointUrl = Uri.parse(
  //     'https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=5a7b4284754841ac85f1c3407d5f811b');
  Future<List<Tesla>> getTesla() async {
    final response0 = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=tesla&from=2022-09-25&sortBy=publishedAt&apiKey=5a7b4284754841ac85f1c3407d5f811b'));

    if (response0.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response0.body);
      List<dynamic> body = json['article'];
      List<Tesla> tesla =
          body.map((dynamic item) => Tesla.fromJson(item)).toList();
      return tesla;
    } else {
      throw ("Can't get the article");
    }
  }
}
