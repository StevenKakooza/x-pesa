import 'dart:ui';

import 'package:USFP/json/intro.dart';
import 'package:USFP/theme/colors.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void initState() {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
            itemCount: 3,
            onPageChanged: (s) {
              setState(() {
                currentpage = s;
              });
            },
            itemBuilder: (context, u) => Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(intro[u]['image']),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      height: height * .15,
                      alignment: AlignmentDirectional.topCenter,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                color: white,
                                fontSize: 14,
                              ),
                              text: intro[u]['details']),
                        ),
                      ),
                    ),
                  ],
                )),
        Positioned(
          bottom: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                3,
                (index) => Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: index == currentpage ? white : null,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: white)),
                      ),
                    )),
          ),
        )
      ],
    ));
  }
}
