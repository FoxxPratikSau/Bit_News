import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/news_model.dart';



  
  class ApiServices {
  // Future<http.Response> getNews() {
  //   return http.get(endPointUrl);
  // }
  final endPointUrl = Uri.parse(
      'https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=##');
  Future<List<Article>> getArticle() async {
     final response = await http
      .get(Uri.parse('https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=##'));

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
