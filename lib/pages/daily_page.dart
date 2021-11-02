import 'package:USFP/json/daily_json.dart';
import 'package:USFP/json/day_month.dart';
import 'package:USFP/theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class DailyPage extends StatefulWidget {
  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  var x;
  @override
  void initState() {
    super.initState();
    x = 0;
  }

  int activeDay = 3;

  List trns =
      daily.where((element) => element['day'] == days[3]['day']).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(155.0),
        child: Container(
          decoration: BoxDecoration(color: primary, boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.01),
              spreadRadius: 10,
              blurRadius: 3,
              // changes position of shadow
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Daily Transaction",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: white),
                    ),
                    Icon(
                      Ionicons.md_stats,
                      color: white,
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(days.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            activeDay = index;
                            x = 0;
                            trns = daily
                                .where((element) =>
                                    element['day'] == days[activeDay]['day'])
                                .toList();
                          });
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 40) / 7,
                          child: Column(
                            children: [
                              Text(
                                days[index]['label'],
                                style: TextStyle(fontSize: 10, color: white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: activeDay == index
                                        ? white
                                        : Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: activeDay == index
                                            ? primary
                                            : white.withOpacity(0.2))),
                                child: Center(
                                  child: Text(
                                    days[index]['day'],
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            activeDay == index ? black : white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: FutureBuilder(
          future: Future.delayed(Duration(seconds: 2), () {
            x = 2;
          }),
          builder: (context, y) {
            if (x == 2) {
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                        children: trns.length > 0
                            ? List.generate(trns.length, (index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: (size.width - 40) * 0.7,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: grey.withOpacity(0.1),
                                                ),
                                                child: Center(
                                                  child: Image.asset(
                                                    daily[index]['icon'],
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 15),
                                              Container(
                                                width: (size.width - 90) * 0.5,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      daily[index]['name'],
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: black,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    SizedBox(height: 5),
                                                    Text(
                                                      daily[index]['date'],
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: black
                                                              .withOpacity(0.5),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: (size.width - 40) * 0.3,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                daily[index]['price'],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15,
                                                    color: Colors.green),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 65, top: 8),
                                      child: Divider(
                                        thickness: 0.8,
                                      ),
                                    )
                                  ],
                                );
                              })
                            : [
                                SizedBox(
                                  height: 40,
                                ),
                                Center(
                                  child: Icon(
                                    Icons.emoji_people_outlined,
                                    size: 60,
                                    color: Colors.grey.withOpacity(.5),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'No Transactions here',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: black,
                                      fontWeight: FontWeight.w500),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ]),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .35,
                  ),
                  Center(child: CircularProgressIndicator()),
                ],
              );
            }
          }),
    );
  }
}
