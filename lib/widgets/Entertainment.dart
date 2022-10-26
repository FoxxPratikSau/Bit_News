import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/customListTile.dart';
import '../models/news_model.dart';
import '../services/api_serv.dart';

class EntertaimentNews extends StatefulWidget {
  const EntertaimentNews({super.key});

  @override
  State<EntertaimentNews> createState() => _EntertaimentNewsState();
}

class _EntertaimentNewsState extends State<EntertaimentNews> {
    ApiServices client = ApiServices();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
       future: client.getArticle("entertainment"),
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
//         Business