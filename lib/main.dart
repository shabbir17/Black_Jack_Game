import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  int leftCardNumber = 2;
  int rightCardNumber = 2;
  int playerResult = 0;
  int cpuResult = 0;
  int? totalvalue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Scaffold(
          body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/background.jpg",
                ),
              )),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/images/logo.jpeg",
                      width: 150,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/images/card$leftCardNumber.png"),
                        Image.asset("assets/images/card$rightCardNumber.png"),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        int newLeftCardNum = Random().nextInt(13);
                        int newRightCardNum = Random().nextInt(13);
                        setState(() {
                          /*leftCardNumber=Random().nextInt(13)+2;
                          rightCardNumber=Random().nextInt(13)+2;*/

                          if (newLeftCardNum == 0 || newLeftCardNum == 1) {
                            leftCardNumber = newLeftCardNum + 2;
                          } else {
                            leftCardNumber = newLeftCardNum;
                          }

                          if (newRightCardNum == 0 || newRightCardNum == 1) {
                            rightCardNumber = newRightCardNum + 2;
                          } else {
                            rightCardNumber = newRightCardNum;
                          }
                          if (leftCardNumber > rightCardNumber) {
                            //playerResult++;
                            playerResult = playerResult + 1;
                            //playerResult+=1;
                          } else {
                            //cpuResult++;
                            cpuResult = cpuResult + 1;
                          }
                            totalvalue=playerResult + cpuResult;
                          if(totalvalue==50){
                            playerResult=0;
                            cpuResult=0;
                            totalvalue=0;
                          }
                        });
                      },
                      child: Image.asset("assets/images/dealbutton.png"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Player',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '$playerResult',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'CPU',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              cpuResult.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      "Total played game:$totalvalue",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Text(
                      "Developed by : SHABBIR AJAM",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
              )),
        ));
  }
}
