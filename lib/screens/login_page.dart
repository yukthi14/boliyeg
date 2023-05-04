import 'package:boliyeg/constants/sizer.dart';
import 'package:boliyeg/constants/strings.dart';
import 'package:boliyeg/screens/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          reverse: false,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: displayHeight(context) * 0.03,
                    left: displayWidth(context) * 0.7),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const HomePage(),
                            duration: const Duration(milliseconds: 300)));


                        // setState(() {
                        //   loginInText;
                        // });

                  },
                  child: Container(
                      width: displayWidth(context) * 0.2,
                      height: displayHeight(context) * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 3.0,
                          ),
                        ],
                      ),
                      child: const Center(
                          child: Text(
                        signInText,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ))),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: displayHeight(context)*0.02,),
                child: Container(
                  width: displayWidth(context)*0.6,
                  height: displayHeight(context)*0.3,
                  decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/image.gif")),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: displayHeight(context) * 0.03,
                    left: displayWidth(context) * 0.04,
                    right: displayWidth(context) * 0.04),
                child: Container(
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      filled: true,
                      //fillColor: Colors.black12,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: emailText,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 2),
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: displayHeight(context) * 0.03,
                    left: displayWidth(context) * 0.04,
                    right: displayWidth(context) * 0.04),
                child: Container(
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: passwordText,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 2),
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: displayHeight(context) * 0.03),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: displayWidth(context) * 0.2,
                      height: displayHeight(context) * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 3.0,
                          ),
                        ],
                      ),
                      child: const Center(
                          child: Text(
                        loginInText,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
