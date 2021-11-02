import 'package:USFP/json/day_month.dart';
import 'package:USFP/json/model.dart';
import 'package:USFP/theme/colors.dart';
import 'package:USFP/widget/chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fl_chart/fl_chart.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  int activeDay = 3;
  double ttlLoan = 0;
  double ttlSaving = 0;
  gettotal() {
    ttlLoan = 0;
    ttlSaving = 0;
    transactions
        .where((element) =>
            element.tType == 'Loan' &&
            element.tDate == months[activeDay]['month'])
        .forEach((element) {
      ttlLoan = ttlLoan + element.tAmount;
    });
    transactions
        .where((element) =>
            element.tType == 'Saving' &&
            element.tDate == months[activeDay]['month'])
        .forEach((element) {
      print(element.tAmount);

      ttlSaving = ttlSaving + element.tAmount;
    });
  }

  bool showAvg = false;

  int loading = 0;
  @override
  void initState() {
    gettotal();
    loading = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
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
            padding:
                const EdgeInsets.only(top: 60, right: 20, left: 20, bottom: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Statistics",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: white),
                    ),
                    Icon(AntDesign.search1, color: white)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(months.length, (index) {
                      return GestureDetector(
                        onTap: index == activeDay
                            ? null
                            : () {
                                setState(() {
                                  loading = 0;
                                  activeDay = index;
                                  gettotal();
                                });
                                Future.delayed(Duration(seconds: 2), () {
                                  setState(() {
                                    loading = 1;
                                  });
                                });
                              },
                        child: Container(
                          width: (MediaQuery.of(context).size.width - 40) / 6,
                          child: Column(
                            children: [
                              Text(
                                months[index]['label'],
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: activeDay == index
                                        ? white
                                        : black.withOpacity(0.02),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color:
                                            activeDay == index ? grey : white)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12, top: 7, bottom: 7),
                                  child: Text(
                                    months[index]['month'],
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
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        SingleChildScrollView(child: FutureBuilder(builder: (context, any) {
          if (loading == 0) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .34),
                child: CircularProgressIndicator(
                  color: primary,
                ),
              ),
            );
          } else if (ttlLoan > 0 || ttlSaving > 0) {
            return Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: grey.withOpacity(0.01),
                            spreadRadius: 10,
                            blurRadius: 3,
                            // changes position of shadow
                          ),
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Savings",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      color: Color(0xff67727d)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "UGX${ttlSaving.toString()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: (size.width - 20),
                              height: 150,
                              child: LineChart(
                                mainData(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Wrap(
                    spacing: 20,
                    children: List.generate(2, (index) {
                      List icons = [Icons.arrow_forward, Icons.arrow_back];
                      return Container(
                        width: (size.width - 60) / 2,
                        height: 170,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.01),
                                spreadRadius: 10,
                                blurRadius: 3,
                                // changes position of shadow
                              ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: index == 0 ? green : red),
                                child: Center(
                                    child: Icon(
                                  icons[index],
                                  color: white,
                                )),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    index == 0 ? "Savings" : "Loans",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                        color: Color(0xff67727d)),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    index == 0
                                        ? ttlSaving.toString()
                                        : ttlLoan.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }))
              ],
            );
          } else {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .33),
                child: Text('No Data Found'),
              ),
            );
          }
        })),
      ],
    );
  }
}
