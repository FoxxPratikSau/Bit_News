import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news_model.dart';

class ApiServices {
  // Future<http.Response> getNews() {
  //   return http.get(endPointUrl);
  // }
  final endPointUrl = Uri.parse(
      'https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=5a7b4284754841ac85f1c3407d5f811b');
  Future<List<Article>> getArticle(String category) async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?category=$category&country=in&apiKey=5a7b4284754841ac85f1c3407d5f811b'));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the article");
    }
  }
}
