
import 'package:dbapp/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Chat with your mentor"), backgroundColor: AppColors.COLOR_TEAL_LIGHT),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Center(
              child: Container(
                width: 5000.0,
                height: 400.0,
                decoration: new BoxDecoration(
                //shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new AssetImage('assets/images/wait_for_it.png')
                  )
              )),
            ),
          ),
          Text("WAIT FOR IT...",style:GoogleFonts.lato(
                    textStyle: TextStyle(
                     // color: AppColors.PROTEGE_GREY,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
            )
          )
        ],
      )
    );
  }
}