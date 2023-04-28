import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,

            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width*0.1),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.06,
                    child: const Center(child: Text("Boliyeg",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),)),
                  ),


                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.19),
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(90),
                          topLeft: Radius.circular(90))),
                )
              ],
            ),
          ),

        ],
      ),

      // Container(
      //   height: MediaQuery.of(context).size.height * 0.7,
      //   decoration: const BoxDecoration(
      //       color: Colors.black54,
      //       borderRadius: BorderRadius.only(
      //           topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      // ),
    );
  }
}
