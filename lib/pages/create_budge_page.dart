import 'package:USFP/json/create_budget_json.dart';
import 'package:USFP/json/day_month.dart';
import 'package:USFP/theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CreatBudgetPage extends StatefulWidget {
  @override
  _CreatBudgetPageState createState() => _CreatBudgetPageState();
}

class _CreatBudgetPageState extends State<CreatBudgetPage> {
  int activeCategory = 0;
  int activeDay = 3;
  TextEditingController _budgetName = TextEditingController();
  TextEditingController _budgetPrice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          decoration: BoxDecoration(color: white, boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.01),
              spreadRadius: 10,
              blurRadius: 3,
              // changes position of shadow
            ),
          ]),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 60,
              right: 20,
              left: 20,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      activeCategory == 0
                          ? "New Saving"
                          : activeCategory == 1
                              ? "Request Loan"
                              : "Cash Withdraw",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: black),
                    ),
                  ],
                ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Text(
              "Choose Action",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: black.withOpacity(0.5)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                  children: List.generate(categories.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      activeCategory = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      width: 130,
                      height: 150,
                      decoration: BoxDecoration(
                          color: white,
                          border: Border.all(
                              width: 2,
                              color: activeCategory == index
                                  ? primary
                                  : Colors.transparent),
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
                                    color: grey.withOpacity(0.15)),
                                child: Center(
                                  child: Image.asset(
                                    categories[index]['icon'],
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.contain,
                                  ),
                                )),
                            Text(
                              categories[index]['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: activeCategory == 0
                ? Container(
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
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ammount",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d),
                            ),
                          ),
                          TextField(
                            controller: _budgetName,
                            cursorColor: black,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: black),
                            decoration: InputDecoration(
                                hintText: "Enter Ammount",
                                border: UnderlineInputBorder()),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: (size.width - 140),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Phone Number",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Color(0xff67727d)),
                                    ),
                                    TextField(
                                      controller: _budgetPrice,
                                      cursorColor: black,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: black),
                                      decoration: InputDecoration(
                                          hintText: "Enter Mobile Number",
                                          border: UnderlineInputBorder()),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : activeCategory == 1
                    ? Container(
                        width: double.infinity,
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
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ammount",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Color(0xff67727d),
                                ),
                              ),
                              TextField(
                                // controller: _budgetName,
                                cursorColor: black,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: black),
                                decoration: InputDecoration(
                                    hintText: "Enter Ammount",
                                    border: UnderlineInputBorder()),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Reason",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Color(0xff67727d)),
                              ),
                              TextField(
                                // controller: _budgetPrice,
                                cursorColor: black,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: black),
                                decoration: InputDecoration(
                                    hintText: "Enter Enter Reason",
                                    border: UnderlineInputBorder()),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Period",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Color(0xff67727d)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:
                                      List.generate(interest.length, (index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          activeDay = index;
                                        });
                                        print(interest[activeDay]);
                                      },
                                      child: Container(
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    40) /
                                                4,
                                        child: Column(
                                          children: [
                                            Text(
                                              interest[index]['period'],
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: activeDay == index
                                                      ? primary
                                                      : black.withOpacity(0.02),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: activeDay == index
                                                          ? primary
                                                          : black.withOpacity(
                                                              0.1))),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 12,
                                                  right: 12,
                                                  top: 5,
                                                  bottom: 5,
                                                ),
                                                child: Text(
                                                  "${interest[index]['rate']} %",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: activeDay == index
                                                          ? white
                                                          : black),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  })),
                              SizedBox(
                                height: 10,
                              ),
                              // _budgetPrice.text != null
                              //     ? Text(
                              //         "You will pay UGX ${_budgetPrice.text} And Interest of UGX${double.parse(_budgetPrice.text) * double.parse(interest[activeDay]['rate'])}",
                              //         style: TextStyle(
                              //             fontWeight: FontWeight.w500,
                              //             fontSize: 13,
                              //             color: Color(0xff67727d)),
                              //       )
                              //     : Text(''),
                              SizedBox(
                                height: 20,
                              ),
                              MaterialButton(
                                color: primary,
                                onPressed: () {},
                                textColor: Colors.white,
                                child: Text("Request Loan"),
                              )

                              // Container(
                              //   height: 50,
                              //   decoration: BoxDecoration(
                              //       color: primary,
                              //       borderRadius: BorderRadius.circular(10)),
                              //   child: Center(
                              //     child: Text('Request Loan'),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      )
                    : Container(
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
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ammount",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Color(0xff67727d),
                                ),
                              ),
                              TextField(
                                controller: _budgetName,
                                cursorColor: black,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: black),
                                decoration: InputDecoration(
                                    hintText: "Enter Ammount",
                                    border: UnderlineInputBorder()),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: (size.width - 140),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Phone Number",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Color(0xff67727d)),
                                        ),
                                        TextField(
                                          controller: _budgetPrice,
                                          cursorColor: black,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: black),
                                          decoration: InputDecoration(
                                              hintText: "Enter Mobile Number",
                                              border: UnderlineInputBorder()),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: primary,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: white,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
          )
        ],
      ),
    );
  }
}
