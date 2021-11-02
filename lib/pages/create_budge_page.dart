import 'package:USFP/json/create_budget_json.dart';
import 'package:USFP/json/day_month.dart';
import 'package:USFP/helpers/http_helper.dart';
import 'package:USFP/theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class CreatBudgetPage extends StatefulWidget {
  @override
  _CreatBudgetPageState createState() => _CreatBudgetPageState();
}

class _CreatBudgetPageState extends State<CreatBudgetPage> {
  final saveKey = GlobalKey<FormState>();
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
          decoration: BoxDecoration(color: primary, boxShadow: [
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
                          color: white),
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
                  onTap: index != 2
                      ? () {
                          setState(() {
                            activeCategory = index;
                          });
                        }
                      : () {
                          Toast.show('Not Available Now', context, duration: 5);
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
                                    color: index == 2
                                        ? Colors.grey.withOpacity(.4)
                                        : null,
                                    height: 30,
                                    fit: BoxFit.contain,
                                  ),
                                )),
                            Text(
                              categories[index]['name'],
                              style: TextStyle(
                                color: index == 2
                                    ? Colors.grey.withOpacity(.4)
                                    : null,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
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
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: activeCategory == 0
                ? Form(
                    key: saveKey,
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
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
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
                              TextFormField(
                                controller: _budgetName,
                                validator: (x) {
                                  if (double.tryParse(x) != null) {
                                    if (double.tryParse(x) < 500) {
                                      return 'Save above 500';
                                    } else {
                                      return null;
                                    }
                                  } else {
                                    return 'Required';
                                  }
                                },
                                cursorColor: black,
                                keyboardType: TextInputType.number,
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
                                "Phone Number",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color: Color(0xff67727d)),
                              ),
                              TextFormField(
                                controller: _budgetPrice,
                                keyboardType: TextInputType.number,
                                validator: (f) {
                                  if ((f.length > 10 && !f.startsWith("+")) ||
                                      f.length < 10) {
                                    return 'Enter Correct Number';
                                  } else if (f.startsWith('+256704') ||
                                      f.startsWith('+25675') ||
                                      f.startsWith('+25674') ||
                                      f.startsWith('075') ||
                                      f.startsWith('070') ||
                                      f.startsWith('074')) {
                                    return 'Number Not yet Supported';
                                  } else {
                                    return null;
                                  }
                                },
                                cursorColor: black,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: black),
                                decoration: InputDecoration(
                                    hintText: "Enter Mobile Number",
                                    border: UnderlineInputBorder()),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              MaterialButton(
                                color: primary,
                                onPressed: () {
                                  if (saveKey.currentState.validate()) {
                                    deposit(_budgetName.text);
                                  }
                                },
                                textColor: Colors.white,
                                child: Text("Make Saving"),
                              )
                            ],
                          ),
                        ),
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
                                keyboardType: TextInputType.number,
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
                                  children: List.generate(1, (index) {
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
                              SizedBox(
                                height: 20,
                              ),
                              MaterialButton(
                                color: primary,
                                onPressed: () {},
                                textColor: Colors.white,
                                child: Text("Request Loan"),
                              )
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
                              SizedBox(
                                height: 30,
                              ),
                              MaterialButton(
                                color: primary,
                                onPressed: () {},
                                textColor: Colors.white,
                                child: Text("Make Saving"),
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
