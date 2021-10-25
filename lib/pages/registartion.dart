import 'package:USFP/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool passwordVisible = true;
  int country = 1;
  int faculty = 1;
  int university = 1;
  int course = 1;
  int yr = 1;

  int currentstep = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Stepper(
        currentStep: currentstep,
        onStepContinue: () {
          currentstep++;

          setState(() {});
        },
        onStepTapped: (x) {
          currentstep = x;
          setState(() {});
        },
        steps: [
          Step(
              subtitle: Text("Get Started Here"),
              isActive: currentstep == 0,
              title: Text("Basic Inforamtion"),
              content: Form(
                  child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Column(
                  children: [
                    TextField(
                      style: TextStyle(),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Full Names",
                          labelText: 'Full Name'),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    TextField(
                      style: TextStyle(),
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                              icon: Icon(passwordVisible
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.remove_red_eye)),
                          border: OutlineInputBorder(),
                          hintText: "Enter Password",
                          labelText: 'Password'),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: country,
                          child: DropdownButton(
                            onTap: () {},
                            onChanged: (x) {
                              setState(() {
                                country = x;
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                child: Text('+256'),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text('+276'),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                child: Text('+286'),
                                value: 3,
                              )
                            ],
                            value: country,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: TextField(
                            style: TextStyle(),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Phone Number",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ))),
          Step(
            isActive: currentstep == 1,
            title: Text('Verify Phonenumber'),
            subtitle: Text("Enter 6 Digit Code Sent to Your Phone"),
            content: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    6,
                    (index) => Container(
                        width: (MediaQuery.of(context).size.width - 40) / 8,
                        height: (MediaQuery.of(context).size.width - 40) / 8,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(),
                          onChanged: (x) {},
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1)
                          ],
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            border: OutlineInputBorder(),
                          ),
                        )),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      splashColor: primary,
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Step(
            isActive: currentstep == 2,
            title: Text('University'),
            subtitle: Text("Setup Your University"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton(
                  onTap: () {},
                  onChanged: (x) {
                    setState(() {
                      university = x;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      child: Text('Select University'),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text('Gulu University'),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text('Lira University'),
                      value: 3,
                    )
                  ],
                  value: university,
                ),
                DropdownButton(
                  onTap: () {},
                  onChanged: (x) {
                    setState(() {
                      faculty = x;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      child: Text('Select Faculty'),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text('Mangement'),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text('Computing & IT'),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text('Health Sciences'),
                      value: 4,
                    )
                  ],
                  value: faculty,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: DropdownButton(
                        onTap: () {},
                        onChanged: (x) {
                          setState(() {
                            course = x;
                          });
                        },
                        items: [
                          DropdownMenuItem(
                            child: Text('Select Course'),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text('Computer Science'),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text('BBA'),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text('MBA'),
                            value: 4,
                          )
                        ],
                        value: course,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: DropdownButton(
                        onTap: () {},
                        onChanged: (x) {
                          setState(() {
                            yr = x;
                          });
                        },
                        items: [
                          DropdownMenuItem(
                            child: Text('Year'),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text('1'),
                            value: 2,
                          ),
                          DropdownMenuItem(
                            child: Text('2'),
                            value: 3,
                          ),
                          DropdownMenuItem(
                            child: Text('3'),
                            value: 4,
                          )
                        ],
                        value: yr,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  style: TextStyle(),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter Student Number",
                      labelText: 'Student Number'),
                ),
              ],
            ),
          ),
          Step(
              subtitle: Text("More Contact Information"),
              isActive: currentstep == 3,
              title: Text("Contact Inforamtion"),
              content: Form(
                  child: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      style: TextStyle(),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Email",
                          labelText: 'Email Adress'),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: country,
                          child: DropdownButton(
                            onTap: () {},
                            onChanged: (x) {
                              setState(() {
                                country = x;
                              });
                            },
                            items: [
                              DropdownMenuItem(
                                child: Text('+256'),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text('+276'),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                child: Text('+286'),
                                value: 3,
                              )
                            ],
                            value: country,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: TextField(
                            style: TextStyle(),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Other Number",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      'Next Of Keen',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    TextField(
                      style: TextStyle(),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Full Name",
                          labelText: 'Name'),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    TextField(
                      style: TextStyle(),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Phone Number",
                          labelText: 'Phone Number'),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    TextField(
                      style: TextStyle(),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Full Name",
                          labelText: 'Name'),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    TextField(
                      style: TextStyle(),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Phone Number",
                          labelText: 'Phone Number'),
                    ),
                  ],
                ),
              ))),
        ],
      )),
    );
  }
}
