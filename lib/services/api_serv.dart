import 'dart:convert';

import 'package:http/http.dart';

import '../models/news_model.dart';

class ApiServices {
  // var url = Uri.parse("https://your_api_link");
  final endPointUrl = Uri.parse(
      "https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=5a7b4284754841ac85f1c3407d5f811b");

  Future<List<News>> getNews() async {
    var res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<News> news =
          body.map((dynamic item) => News.fromJson(item)).toList();
      return news;
    } else {
      throw ("Can't get the article");
    }
  }
}
