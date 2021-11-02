import 'package:USFP/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

PageController reg;
TextEditingController cont0;
TextEditingController cont1;
TextEditingController cont2;
TextEditingController cont3;
TextEditingController cont4;
TextEditingController cont5;
List contrl = [cont0, cont1, cont2, cont3, cont4, cont5];

class _LogInState extends State<LogIn> {
  final basicInfoKey = GlobalKey<FormState>();

  @override
  void initState() {
    reg = PageController(initialPage: 0);
    cont0 = TextEditingController();
    cont1 = TextEditingController();
    cont2 = TextEditingController();
    cont3 = TextEditingController();
    cont4 = TextEditingController();
    cont5 = TextEditingController();

    super.initState();
  }

  StepState step0 = StepState.editing;
  StepState step1 = StepState.disabled;
  StepState step2 = StepState.disabled;
  StepState step3 = StepState.disabled;

  bool passwordVisible = true;
  int page = 0;
  int country = 1;
  int faculty = 1;
  int university = 1;
  int course = 1;
  int yr = 1;
  String code = '';

  int currentstep = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
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
                      page == 0 ? "LogIn" : "Register",
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: PageView(
            controller: reg,
            onPageChanged: (x) {
              setState(() {
                page = x;
              });
            },
            physics: NeverScrollableScrollPhysics(),
            children: [
              //Login
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 200,
                    child: Image.asset('assets/images/colored.png'),
                  ),
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        text:
                            'Save with ease, anytime, anywhere\nLogin to Your USFP account to continue'),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextField(
                          style: TextStyle(),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Email or Phonenumber",
                              labelText: 'Email or Phonenumber'),
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
                        MaterialButton(
                          minWidth: width * 0.9,
                          height: 45,
                          onPressed: () {},
                          child: Text('LOGIN'),
                          textColor: white,
                          color: primary,
                        ),
                        SizedBox(
                          height: height * 0.005,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('New here?'),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                reg.jumpToPage(1);
                              },
                              splashColor: primary,
                              child: Text(
                                'Sign Up',
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
                ],
              ),

              //Registeration

              Stepper(
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  return currentstep == 0
                      ? Row(
                          children: <Widget>[
                            MaterialButton(
                              onPressed: () {
                                if (basicInfoKey.currentState.validate()) {
                                  step0 = StepState.complete;
                                  step1 = StepState.editing;
                                  currentstep++;
                                  setState(() {});
                                } else {
                                  print('OOppaa');
                                }
                              },
                              child: Text('REGISTER'),
                              textColor: white,
                              color: primary,
                            ),
                            currentstep == 0
                                ? Text('')
                                : TextButton(
                                    onPressed: onStepCancel,
                                    child: const Text('CANCEL'),
                                  ),
                          ],
                        )
                      : currentstep == 2
                          ? Row(
                              children: <Widget>[
                                MaterialButton(
                                  onPressed: () {
                                    step2 = StepState.complete;
                                    currentstep++;
                                    setState(() {});
                                  },
                                  child: Text('SAVE'),
                                  textColor: white,
                                  color: primary,
                                ),
                                currentstep == 0
                                    ? Text('')
                                    : TextButton(
                                        onPressed: onStepCancel,
                                        child: const Text('CANCEL'),
                                      ),
                              ],
                            )
                          : Text('');
                },
                currentStep: currentstep,
                onStepContinue: () {
                  currentstep++;

                  setState(() {});
                },
                onStepTapped: (x) {
                  if (currentstep > 1 && x <= 1) {
                  } else {
                    currentstep = x;
                    setState(() {});
                  }
                },
                steps: [
                  Step(
                      state: step0,
                      subtitle: currentstep > 1
                          ? Text(
                              "Submitted",
                              style: TextStyle(color: Colors.green),
                            )
                          : Text("Get Started Here"),
                      isActive: currentstep == 0,
                      title: Text(
                        "Basic Inforamtion",
                        style: TextStyle(
                            color: currentstep > 1 ? Colors.green : null),
                      ),
                      content: Form(
                          key: basicInfoKey,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 10),
                            child: Column(
                              children: [
                                TextFormField(
                                  textCapitalization: TextCapitalization.words,
                                  validator: (x) {
                                    if (x.isEmpty) {
                                      return 'Required';
                                    } else if (!x.contains(' ')) {
                                      return 'Enter Full Names Separated by Space';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onEditingComplete: () {
                                    FocusScope.of(context).nextFocus();
                                  },
                                  style: TextStyle(),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: "Enter Full Names",
                                      labelText: 'Full Name'),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                TextFormField(
                                  validator: (x) {
                                    if (x.isEmpty) {
                                      return 'Required';
                                    } else if (x.length < 6) {
                                      return 'Use a Stronger Password';
                                    } else {
                                      return null;
                                    }
                                  },
                                  style: TextStyle(),
                                  obscureText: passwordVisible,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              passwordVisible =
                                                  !passwordVisible;
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
                                      child: TextFormField(
                                        validator: (x) {
                                          if (x.isEmpty) {
                                            return 'Required';
                                          } else if (x.length != 9) {
                                            return 'Check Phone Number';
                                          } else {
                                            return null;
                                          }
                                        },
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
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('Have an Account?'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        reg.jumpToPage(0);
                                      },
                                      splashColor: primary,
                                      child: Text(
                                        'LogIn',
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
                          ))),
                  Step(
                    state: step1,
                    isActive: currentstep == 1,
                    title: Text(
                      "Verify Phone Nnumber",
                      style: TextStyle(
                          color: currentstep > 1 ? Colors.green : null),
                    ),
                    subtitle: currentstep > 1
                        ? Text(
                            "Verified",
                            style: TextStyle(color: Colors.green),
                          )
                        : Text("Enter 6 Digit Code Sent to Your Phone"),
                    content: Column(
                      children: [
                        Text(
                            "Please Enter the Code sent Your Phone Number +256772053630"),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            6,
                            (index) => Container(
                                width:
                                    (MediaQuery.of(context).size.width - 40) /
                                        8,
                                height:
                                    (MediaQuery.of(context).size.width - 40) /
                                        8,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: contrl[index],
                                  style: TextStyle(),
                                  onChanged: (x) {
                                    code = code + x;

                                    if (index == 5 &&
                                        code.length == contrl.length) {
                                      FocusScope.of(context).unfocus();
                                      step1 = StepState.complete;

                                      step2 = StepState.editing;
                                      currentstep++;
                                      setState(() {});
                                    } else {
                                      print(code);
                                    }
                                  },
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
                    state: step2,
                    isActive: currentstep == 2,
                    subtitle: currentstep > 2
                        ? Text(
                            "All Set!",
                            style: TextStyle(color: Colors.green),
                          )
                        : Text("Set Up Your University & Course"),
                    title: Text(
                      "Academic Identity",
                      style: TextStyle(
                          color: currentstep > 2 ? Colors.green : null),
                    ),
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
                      state: step3,
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
                              'Next Of Keen(Close Friends)',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.005,
                            ),
                            TextField(
                              style: TextStyle(),
                              textCapitalization: TextCapitalization.words,
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
                              textCapitalization: TextCapitalization.words,
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
                            SizedBox(
                              height: height * 0.02,
                            ),
                            MaterialButton(
                              minWidth: width * 0.9,
                              height: 45,
                              onPressed: () {},
                              child: Text('FINISH'),
                              textColor: white,
                              color: primary,
                            ),
                          ],
                        ),
                      ))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
