import 'dart:io';

import 'package:flutter/material.dart';
import '/utils/routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.blue[50],

        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 43)),
                    Container(
                      height: 50,
                      width: 230,
                      child: Image.asset(
                        "assets/images/head.PNG",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                      Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(top: 5)),
                                RichText(
                                  text: TextSpan(
                                    style: Theme.of(context).textTheme.bodyText2,
                                    children: [
                                      TextSpan(
                                        text: '4. フィールドワークに出かけよう         ',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          child: Icon(
                                            Icons.arrow_forward_outlined,
                                            color: Colors.blue,
                                            size: 27,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 5)),
                                Text(
                                  "災害アーカイブ情報や現地でインタビューしてオリジナルの災害情報マップを作りましょう",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  height: 260,
                                  width: 350,
                                  child: Image.asset(
                                    "assets/images/home_b1.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.sectionfourRoute);
                            }),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        height: 350,
                        width: 450,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                      Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(top: 5)),
                                RichText(
                                  text: TextSpan(
                                    style: Theme.of(context).textTheme.bodyText2,
                                    children: [
                                      TextSpan(
                                        text: '5. プレゼンテーションをしよう         ',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          child: Icon(
                                            Icons.arrow_forward_outlined,
                                            color: Colors.blue,
                                            size: 27,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 5)),
                                Text(
                                  "フィールドマップで作成した災害情報マップを他の人に発表して意見を聴いてみましょう",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  height: 260,
                                  width: 350,
                                  child: Image.asset(
                                    "assets/images/home_b2.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.presentation);
                            }),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        height: 350,
                        width: 450,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                      Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(top: 5)),
                                RichText(
                                  text: TextSpan(
                                    // style: Theme.of(context).textTheme.body1,
                                    children: [
                                      TextSpan(
                                        text: '1. 防災知識を学ぶ      \n',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19),
                                      ),
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          child: Icon(
                                            Icons.arrow_forward_outlined,
                                            color: Colors.blue,
                                            size: 26,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 5)),
                                Container(
                                  height: 125,
                                  width: 200,
                                  child: Image.asset(
                                    "assets/images/home_b3.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.preventionKnowledge);
                            }),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        height: 200,
                        width: 300,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(top: 5)),
                                RichText(
                                  text: TextSpan(
                                    // style: Theme.of(context).textTheme.body1,
                                    children: [
                                      TextSpan(
                                        text: '2. 防災クイズ     \n',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19),
                                      ),
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          child: Icon(
                                            Icons.arrow_forward_outlined,
                                            color: Colors.blue,
                                            size: 26,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 5)),
                                Container(
                                  height: 130,
                                  width: 200,
                                  child: Image.asset(
                                    "assets/images/home_b4.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, MyRoutes.quiz);
                            }),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        height: 200,
                        width: 300,
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                      Container(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.only(top: 5)),
                                RichText(
                                  text: TextSpan(
                                    // style: Theme.of(context).textTheme.body1,
                                    children: [
                                      TextSpan(
                                        text: '3. 災害アーカイブ     \n',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19),
                                      ),
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2.0),
                                          child: Icon(
                                            Icons.arrow_forward_outlined,
                                            color: Colors.blue,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(top: 5)),
                                Container(
                                  height: 130,
                                  width: 200,
                                  child: Image.asset(
                                    "assets/images/home_b5.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.disasterArchive);
                            }),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        height: 200,
                        width: 300,
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   child: Text(
                //     "Disaster Prevention Education",
                //     style: TextStyle(
                //       fontSize: 25,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                //   height: 25.0,
                // ),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 30, horizontal: 32),
                //   child: Column(
                //     children: <Widget>[
                //       ElevatedButton(
                //         child: Text(
                //           "1. Learn Disaster Prevention Knowledge",
                //           style: TextStyle(
                //             fontSize: 18,
                //             color: Colors.white,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //         style: TextButton.styleFrom(minimumSize: Size(350, 50)),
                //         onPressed: () {
                //           Navigator.pushNamed(
                //               context, MyRoutes.preventionKnowledge);
                //         },
                //       ),
                //       SizedBox(
                //         height: 5.0,
                //       ),
                //       ElevatedButton(
                //         child: Text(
                //           "2. Disaster Prevention Quiz",
                //           style: TextStyle(
                //             fontSize: 18,
                //             color: Colors.white,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //         style: TextButton.styleFrom(minimumSize: Size(350, 50)),
                //         onPressed: () {
                //           Navigator.pushNamed(context, MyRoutes.quiz);
                //         },
                //       ),
                //       SizedBox(
                //         height: 5.0,
                //       ),
                //       ElevatedButton(
                //         child: Text(
                //           "3. Disaster Archive",
                //           style: TextStyle(
                //             fontSize: 18,
                //             color: Colors.white,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //         style: TextButton.styleFrom(minimumSize: Size(350, 50)),
                //         onPressed: () {
                //           Navigator.pushNamed(
                //               context, MyRoutes.disasterArchive);
                //         },
                //       ),
                //       SizedBox(
                //         height: 5.0,
                //       ),
                //       ElevatedButton(
                //         child: Text(
                //           "4. Fieldwork",
                //           style: TextStyle(
                //             fontSize: 18,
                //             color: Colors.white,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //         style: TextButton.styleFrom(minimumSize: Size(350, 50)),
                //         onPressed: () {
                //           Navigator.pushNamed(
                //               context, MyRoutes.sectionfourRoute);
                //         },
                //       ),
                //       SizedBox(
                //         height: 5.0,
                //       ),
                //       ElevatedButton(
                //         child: Text(
                //           "5. Presentation",
                //           style: TextStyle(
                //             fontSize: 18,
                //             color: Colors.white,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //         style: TextButton.styleFrom(minimumSize: Size(350, 50)),
                //         onPressed: () {
                //           Navigator.pushNamed(context, MyRoutes.presentation);
                //         },
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
        // drawer: Drawer(),
      ),
    );
  }
}
