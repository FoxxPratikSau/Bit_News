import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/customListTile.dart';
import '../models/news_model.dart';
import '../services/api_serv.dart';

class ScNews extends StatefulWidget {
  const ScNews({super.key});

  @override
  State<ScNews> createState() => _ScNewsState();
}

class _ScNewsState extends State<ScNews> {
    ApiServices client = ApiServices();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
       future: client.getArticle("science"),
            builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
              if (snapshot.hasData) {
                List<Article>? articles = snapshot.data;
                return ListView.builder(
                  itemCount: articles?.length,
                  itemBuilder: (context, index) =>
                      customListTile(articles![index], context),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
    );
  }
}


// FutureBuilder(
//            
//           ),