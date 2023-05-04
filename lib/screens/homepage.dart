import 'package:animate_icons/animate_icons.dart';
import 'package:boliyeg/constants/strings.dart';
import 'package:boliyeg/screens/chat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../constants/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  // bool onEndIconPress(BuildContext context) {
  //
  //   return true;
  // }
  //
  // bool onStartIconPress(BuildContext context) {
  //
  //   return true;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _globalKey,
      drawer: Drawer(
        width: displayWidth(context) * 0.5,
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('yukthi'),
              accountEmail: const Text('yukthi@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(avatar),
                ),
              ),
            ),
            ListTile(
              title: const Text(profile),
              leading: Icon(Icons.person),
              onTap: () {
                // Navigator.pop(context);
              },
            ),
            const Divider(
              color: Colors.black,
              thickness: 0.2,
            ),
            ListTile(
              title: const Text(setting),
              leading: Icon(Icons.settings),
              onTap: () {
                // Navigator.pop(context);
              },
            ),
            const Divider(
              color: Colors.black,
              thickness: 0.2,
            ),
            ListTile(
              title: const Text(aboutUs),
              leading: const Icon(Icons.arrow_outward),
              onTap: () async {},
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: displayHeight(context) * 0.03),
              height: displayHeight(context) * 0.06,
              child: Center(
                  child: Text(
                name,
                style: TextStyle(
                    fontSize: displayWidth(context) * 0.07,
                    fontWeight: FontWeight.w500),
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: displayHeight(context) * 0.03),
              child: IconButton(
                  onPressed: () {
                    _globalKey.currentState?.openDrawer();
                  },
                  icon: Icon(Icons.menu_rounded)),
            ),
            GestureDetector(
              onTap: () {
                // ImagePicker image = ImagePicker();
                // try {
                //   XFile? filePath =
                //       await image.pickImage(
                //       source:
                //       ImageSource.gallery);
                //   print(filePath);
                // } catch (e) {
                //   print(e);
                // }
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: displayHeight(context) * 0.04,
                    left: displayWidth(context) * 0.38),
                width: displayWidth(context) * 0.25,
                height: displayHeight(context) * 0.25,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.circle,
                    color: Colors.black12,
                    image: const DecorationImage(image: NetworkImage(avatar))),
                // height: displayHeight(context)*0.1,
                // child: OutlinedButton(
                //
                //     onPressed:() {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => ChatPage(
                //             )),
                //       );
                //     },
                //     child: const Text(outlineButton)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: displayHeight(context) * 0.24),
              height: displayHeight(context) * 0.03,
              width: displayWidth(context),
              child: const Center(child: Text(userName)),
            ),
            // AnimatedContainer(
            //   height: drawer ? displayHeight(context) * 0.7 : 0,
            //   decoration: const BoxDecoration(
            //     color: Colors.black38,
            //     borderRadius: BorderRadius.only(
            //         bottomLeft: Radius.circular(50),
            //         bottomRight: Radius.circular(50)),
            //   ),
            //   duration: const Duration(milliseconds: 300),
            // ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.topToBottom,
                        child: const ChatPage(),duration: Duration(milliseconds: 300)));
              },
              child: Container(
                margin: EdgeInsets.only(top: displayHeight(context) * 0.3),
                height: displayHeight(context) * 0.7,
                decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: displayHeight(context) * 0.03,
                          left: displayWidth(context) * 0.06,
                          right: displayWidth(context) * 0.06),
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Search by name",
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: Colors.black87,
                        ),
                      ),
                    ),
                    Container(
                      height: displayHeight(context) * 0.59,
                      margin:
                          EdgeInsets.only(top: displayHeight(context) * 0.01),
                      child: ListView.separated(
                        padding:
                            EdgeInsets.only(top: displayHeight(context) * 0.01),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: displayHeight(context) * 0.075,
                            child: Stack(
                              children: [
                                Container(
                                  height: displayHeight(context) * 0.04,
                                  margin: EdgeInsets.only(
                                    top: displayHeight(context) * 0.015,
                                    right: displayWidth(context) * 0.3,
                                  ),
                                  child: const Center(child: Text(userName)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      left: displayWidth(context) * 0.05),
                                  width: displayWidth(context) * 0.12,
                                  height: displayHeight(context) * 0.12,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      shape: BoxShape.circle,
                                      color: Colors.black12,
                                      image: const DecorationImage(
                                          image: NetworkImage(avatar))),
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.only(
            //       top: displayHeight(context) * 0.9,
            //       left: displayWidth(context) * 0.8),
            //   child: FloatingActionButton(
            //     elevation: 20.0,
            //     backgroundColor: Colors.black,
            //     child: const Icon(Icons.message_rounded),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => ChatPage()),
            //       );
            //     },
            //   ),
            // ),

            // Column(
            //   children: [
            //     drawer
            //         ? Padding(
            //             padding: EdgeInsets.only(
            //                 top: displayHeight(context) * 0.2,
            //                 right: displayWidth(context) * 0.6),
            //             child: const Text(
            //               animatedContainerProfile,
            //               style: TextStyle(fontSize: 20, color: Colors.white),
            //             ),
            //           )
            //         : const SizedBox(),
            //     drawer
            //         ? const Divider(
            //             color: Colors.white,
            //             endIndent: 240,
            //           )
            //         : SizedBox(),
            //     drawer
            //         ? Padding(
            //             padding: EdgeInsets.only(
            //                 top: displayHeight(context) * 0.02,
            //                 right: displayWidth(context) * 0.6),
            //             child: const Text(
            //               animatedContainerAboutUs,
            //               style: TextStyle(fontSize: 20, color: Colors.white),
            //             ),
            //           )
            //         : SizedBox(),
            //   ],
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: displayHeight(context) * 0.03),
            //   child: AnimateIcons(
            //     duration: const Duration(milliseconds: 300),
            //     startIcon: Icons.menu_rounded,
            //     endIcon: Icons.close_rounded,
            //     startIconColor: Colors.black,
            //     endIconColor: Colors.black,
            //     controller: c1,
            //     size: displayWidth(context) * 0.07,
            //     onEndIconPress: () => onEndIconPress(context),
            //     onStartIconPress: () => onStartIconPress(context),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
