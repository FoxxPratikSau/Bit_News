import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start, // to make the text from left
            // ignore: prefer_const_literals_to_create_immutables
            children: [
               // ignore: deprecated_member_use
               "BitNews".text.xl5.bold.color(context.theme.accentColor).make(),
      
            ]
    );
  }
}