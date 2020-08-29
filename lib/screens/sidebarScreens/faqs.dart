import 'package:dbapp/constants/colors.dart';
import 'package:dbapp/constants/sidebarConstants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../constants/colors.dart';
import '../../constants/colors.dart';

class FAQS extends StatelessWidget {
  final List faqlist = SidebarConstants.faqQuestionAnswers;
  Widget faqList() {
    return Center(
        child: Container(
      child: ListView.builder(
          itemCount: faqlist.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Center(
                child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Text(
                      "Here are some Frequently Asked questions",
                      style: TextStyle(fontFamily: 'GoogleSans', fontSize: 19),
                    )),
              );
            } else if ((index - 1) % 2 == 0) {
              return Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                decoration: BoxDecoration(
                    color: AppColors.PROTEGE_CYAN,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 150,
                        minHeight: 35,
                      ),
                      child:
                          // alignment: WrapAlignment.center,
                          // direction: Axis.vertical,
                          // children: <Widget>[

                          Text(
                        faqlist[index - 1],
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: AppColors.PROTEGE_GREY,
                            fontFamily: 'GoogleSans',
                            fontSize: 18,
                            fontStyle: FontStyle.italic),
                      ),
                      // Text(
                      //   faqlist[index],
                      //   overflow: TextOverflow.ellipsis,
                      //   // maxLines: 5,
                      //   style: TextStyle(
                      //       color: AppColors.PROTEGE_GREY,
                      //       fontFamily: 'GoogleSans',
                      //       fontSize: 15),
                      // ),
                      // ]))
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 150,
                        minHeight: 35,
                      ),
                      child:
                          // alignment: WrapAlignment.center,
                          // direction: Axis.vertical,
                          // children: <Widget>[

                          Text(
                        faqlist[index],
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'GoogleSans',
                            fontSize: 18,
                            fontWeight: FontWeight.w200),
                      ),
                      // Text(
                      //   faqlist[index],
                      //   overflow: TextOverflow.ellipsis,
                      //   // maxLines: 5,
                      //   style: TextStyle(
                      //       color: AppColors.PROTEGE_GREY,
                      //       fontFamily: 'GoogleSans',
                      //       fontSize: 15),
                      // ),
                      // ]))
                    ),
                  ),
                ]),
              );

              // return Container(
              //   padding: EdgeInsets.all(40.0),
              //   child:Text("Lorem Ipsum is simply dummy text of the printin.")
              // );
            } else {
              return Center(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              ));
            }
            // else {
            //   return Container(
            //     padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            //     margin: EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
            //     color: AppColors.PROTEGE_CYAN,
            //     child: Center(
            //       child: Text(faqlist[index - 1],
            //           style: TextStyle(
            //               color: Colors.black, fontFamily: 'GoogleSans')),
            //     ),
            //   );
            //   // return Container(
            //   //   padding: EdgeInsets.symmetric(horizontal:20.0,vertical:20.0),
            //   //   child:Text((index).toString()+". "+faqlist[index-1])
            //   // );
            // }
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text(
              "FAQs",
              style: TextStyle(fontFamily: 'GoogleSans'),
            ),
            backgroundColor: AppColors.COLOR_TEAL_LIGHT),
        body: faqList());
  }
}
