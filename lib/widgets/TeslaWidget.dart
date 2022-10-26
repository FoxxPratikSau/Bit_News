import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_with_api/tesla_api_services/api_tesla.dart';
import 'package:news_app_with_api/tesla%20model/tesla_model.dart';
import 'package:news_app_with_api/teslaComponent/teslaList.dart';


class TeslaNews extends StatefulWidget {
  const TeslaNews({super.key});

  @override
  State<TeslaNews> createState() => _TeslaNewsState();
}

class _TeslaNewsState extends State<TeslaNews> {
  ApiServices0 client = ApiServices0();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: client.getTesla(),
      builder: (BuildContext context, AsyncSnapshot<List<Tesla>> snapshot) {
        if (snapshot.hasData) {
          List<Tesla>? tesla = snapshot.data;
          return ListView.builder(
            itemCount: tesla?.length,
            itemBuilder: (context, index) =>
                customListTileTesla(tesla![index], context),
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