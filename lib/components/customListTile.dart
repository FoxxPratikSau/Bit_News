import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/news_model.dart';
import '../pages/article_detail_page.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                    article: article,
                  )));
    },
    child: Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Color.fromARGB(179, 255, 255, 255),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.purpleAccent,
              blurRadius: 33.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              //let's add the height

              image: DecorationImage(
                  image: NetworkImage(article.urlToImage.toString()),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 94, 161, 216),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              article.source!.name.toString(),
              style: TextStyle(
                color: Colors.white,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            article.title.toString(),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    ),
  );
}
