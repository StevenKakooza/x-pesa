import 'package:USFP/theme/colors.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.black,
              child: Image.asset('assets/images/bank.png'),
            ),
            RichText(
              text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  text:
                      'Save with ease, anytime, anywhere\nLogin to You USFP account to continue'),
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
                    height: height * 0.005,
                  ),
                  MaterialButton(
                    minWidth: width * 0.9,
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
                        onTap: () {},
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
      ),
    ));
  }
}
