import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_with_api/widgets/BusinessWidget.dart';
import 'package:news_app_with_api/widgets/Entertainment.dart';
import 'package:news_app_with_api/widgets/ScienceWidget.dart';
import 'package:news_app_with_api/widgets/TechWidget.dart';

import '../components/customListTile.dart';
import '../models/news_model.dart';
import '../services/api_serv.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiServices client = ApiServices();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              children: [
                Text(
                  "Bit",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w300,
                      fontSize: 25.5),
                ),
                Text(
                  "NEWS",
                  style: TextStyle(
                      color: Colors.purple,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w300,
                      fontSize: 25.5),
                )
              ],
            ),
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            bottom: TabBar(
                isScrollable: true,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Colors.purple),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Technology",
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 13)),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Science",
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Business",
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily)),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Entertainment",
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily)),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            TechNews(),
            ScNews(),
            BusinessNews(),
            EntertaimentNews(),
          ]),
        ),
      ),
    );
  }
}
