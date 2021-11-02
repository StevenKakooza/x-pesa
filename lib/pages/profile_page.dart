import 'package:USFP/json/model.dart';
import 'package:USFP/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _email = TextEditingController(text: users[0].email);
  TextEditingController dateOfBirth =
      TextEditingController(text: users[0].dob.toString().substring(0, 10));
  TextEditingController phonenumber =
      TextEditingController(text: users[0].phoneNumber[0]);
  TextEditingController regnumber = TextEditingController(text: users[0].regNo);

  TextEditingController password = TextEditingController(text: "123456");
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
                      "Profile",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: white),
                    ),
                    Spacer(),
                    Icon(
                      Ionicons.md_settings,
                      color: white,
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
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: white, boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3,
                  // changes position of shadow
                ),
              ]),
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: (size.width - 40) * 0.4,
                          child: Container(
                            child: Stack(
                              children: [
                                RotatedBox(
                                  quarterTurns: -2,
                                  child: CircularPercentIndicator(
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      backgroundColor: grey.withOpacity(0.3),
                                      radius: 110.0,
                                      lineWidth: 6.0,
                                      percent: 0.53,
                                      progressColor: primary),
                                ),
                                Positioned(
                                  top: 16,
                                  left: 13,
                                  child: Container(
                                    width: 85,
                                    height: 85,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image:
                                                AssetImage(users[0].userImage),
                                            fit: BoxFit.cover)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: (size.width - 40) * 0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                users[0].userName,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Credit score: ${users[0].creditScore}",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: black.withOpacity(0.4)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: primary.withOpacity(0.01),
                              spreadRadius: 10,
                              blurRadius: 3,
                              // changes position of shadow
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 25, bottom: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  users[0].userUniversity,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  users[0].studentNo,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: white),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: users[0].verified == 0
                                      ? Colors.green
                                      : Colors.yellow,
                                  border: Border.all(color: white)),
                              child: Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Text(
                                  users[0].verified == 0
                                      ? 'Verified'
                                      : 'Pending',
                                  style: TextStyle(color: white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reg Number",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff67727d)),
                  ),
                  TextField(
                    controller: regnumber,
                    cursorColor: black,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: black),
                    decoration: InputDecoration(
                        hintText: "Reg No.", border: InputBorder.none),
                  ),
                  Text(
                    "Phone Number",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff67727d)),
                  ),
                  TextField(
                    controller: phonenumber,
                    cursorColor: black,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: black),
                    decoration: InputDecoration(
                        hintText: "Phone Number", border: InputBorder.none),
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff67727d)),
                  ),
                  TextField(
                    controller: _email,
                    cursorColor: black,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: black),
                    decoration: InputDecoration(
                        hintText: "Email", border: InputBorder.none),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Date of birth",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff67727d)),
                  ),
                  TextField(
                    controller: dateOfBirth,
                    cursorColor: black,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: black),
                    decoration: InputDecoration(
                        hintText: "Date of birth", border: InputBorder.none),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xff67727d)),
                  ),
                  TextField(
                    obscureText: true,
                    controller: password,
                    cursorColor: black,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: black),
                    decoration: InputDecoration(
                        hintText: "Password", border: InputBorder.none),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
