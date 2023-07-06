// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_page/about_app.dart';
import 'package:lottie/lottie.dart';
import 'package:home_page/signup.dart';
import 'package:home_page/login.dart';
import 'package:home_page/TfliteModel.dart';
import 'change_theme_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedLang = 'en';
  @override
  build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
        onWillPop: showExitPopup,
        child: Scaffold(
          body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  Container(
                      height: 370,
                      child: ClipPath(
                          clipper: WaveClip(),
                          child: Column(children: [
                            Container(
                                padding: EdgeInsets.only(top: 10),
                                width: double.infinity,
                                height: 370,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Color.fromARGB(255, 100, 149, 189)
                                                .withOpacity(0.7),
                                            BlendMode.dstATop),
                                        fit: BoxFit.cover,
                                        image: AssetImage("images/home.jpeg"))),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 50),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Themes".tr,
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    shadows: [
                                                      Shadow(
                                                          offset:
                                                              Offset(-.5, -.5),
                                                          color: Color.fromARGB(
                                                              255,
                                                              21,
                                                              121,
                                                              235)),
                                                      Shadow(
                                                          offset:
                                                              Offset(.5, -.5),
                                                          color: Color.fromARGB(
                                                              255,
                                                              21,
                                                              121,
                                                              235)),
                                                      Shadow(
                                                          offset:
                                                              Offset(.5, .5),
                                                          color: Color.fromARGB(
                                                              255,
                                                              21,
                                                              121,
                                                              235)),
                                                      Shadow(
                                                          offset:
                                                              Offset(-.5, .5),
                                                          color: Color.fromARGB(
                                                              255,
                                                              21,
                                                              121,
                                                              235)),
                                                    ]),
                                              ),
                                              ChangeThemeButtonWidget()
                                            ],
                                          ),
                                          Container(
                                              child: DropdownButton(
                                            items: [
                                              DropdownMenuItem(
                                                  child: Text("en"),
                                                  value: 'en'),
                                              DropdownMenuItem(
                                                  child: Text("ar"),
                                                  value: 'ar')
                                            ],
                                            value: _selectedLang,
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedLang = value as String;
                                              });
                                              Get.updateLocale(
                                                  Locale(_selectedLang));
                                            },
                                          )),
                                          Container(
                                            width: 50,
                                            height: 50,
                                            child: Lottie.network(
                                                "https://assets4.lottiefiles.com/packages/lf20_0pivjQFVZl.json"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text("SKIN CANCER".tr,
                                        style: TextStyle(
                                            fontFamily: 'CastoroTitling',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: Color.fromARGB(
                                                255, 21, 121, 235),
                                            shadows: [
                                              Shadow(
                                                  offset: Offset(-1.5, -1.5),
                                                  color: Color.fromARGB(
                                                      255, 11, 37, 108)),
                                              Shadow(
                                                  offset: Offset(1.5, -1.5),
                                                  color: Color.fromARGB(
                                                      255, 11, 37, 108)),
                                              Shadow(
                                                  offset: Offset(1.5, 1.5),
                                                  color: Color.fromARGB(
                                                      255, 11, 37, 108)),
                                              Shadow(
                                                  offset: Offset(-1.5, 1.5),
                                                  color: Color.fromARGB(
                                                      255, 11, 37, 108)),
                                            ])),
                                    Text("DETECTION WITH AI".tr,
                                        style: TextStyle(
                                            fontFamily: 'CastoroTitling',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: Color.fromARGB(
                                                255, 21, 121, 235),
                                            shadows: [
                                              Shadow(
                                                  offset: Offset(-1.5, -1.5),
                                                  color: Color.fromARGB(
                                                      255, 11, 37, 108)),
                                              Shadow(
                                                  offset: Offset(1.5, -1.5),
                                                  color: Color.fromARGB(
                                                      255, 11, 37, 108)),
                                              Shadow(
                                                  offset: Offset(1.5, 1.5),
                                                  color: Color.fromARGB(
                                                      255, 11, 37, 108)),
                                              Shadow(
                                                  offset: Offset(-1.5, 1.5),
                                                  color: Color.fromARGB(
                                                      255, 11, 37, 108)),
                                            ])),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.only(
                                        top: 55,
                                      ),
                                      child: MaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: ((context) {
                                            return SignUp();
                                          })));
                                        },
                                        child: Text(
                                          "SIGNUP".tr,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              shadows: [
                                                Shadow(
                                                    offset: Offset(-.7, -.7),
                                                    color: Color.fromARGB(
                                                        255, 21, 121, 235)),
                                                Shadow(
                                                    offset: Offset(.7, -.7),
                                                    color: Color.fromARGB(
                                                        255, 21, 121, 235)),
                                                Shadow(
                                                    offset: Offset(.7, .7),
                                                    color: Color.fromARGB(
                                                        255, 21, 121, 235)),
                                                Shadow(
                                                    offset: Offset(-.7, .7),
                                                    color: Color.fromARGB(
                                                        255, 21, 121, 235)),
                                              ]),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      height: 20,
                                      child: MaterialButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return Login();
                                          }));
                                        },
                                        child: Text(
                                          "ALREADY HAVE AN ACCOUNT".tr,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              shadows: [
                                                Shadow(
                                                    offset: Offset(-.5, -.5),
                                                    color: Color.fromARGB(
                                                        255, 21, 121, 235)),
                                                Shadow(
                                                    offset: Offset(.5, -.5),
                                                    color: Color.fromARGB(
                                                        255, 21, 121, 235)),
                                                Shadow(
                                                    offset: Offset(.5, .5),
                                                    color: Color.fromARGB(
                                                        255, 21, 121, 235)),
                                                Shadow(
                                                    offset: Offset(-.5, .5),
                                                    color: Color.fromARGB(
                                                        255, 21, 121, 235)),
                                              ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ]))),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Text(
                            "THIS APP CAN HELP YOU DETECT ".tr,
                            style: TextStyle(
                              fontFamily: 'CastoroTitling',
                              fontWeight: FontWeight.w700,
                              fontSize: 21.7,
                              color: Color.fromARGB(255, 21, 121, 235),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5, bottom: 10),
                          child: Text(
                            "SKIN CANCER AT EARLY STAGES".tr,
                            style: TextStyle(
                                fontFamily: 'CastoroTitling',
                                fontWeight: FontWeight.w700,
                                fontSize: 22,
                                color: Color.fromARGB(255, 21, 121, 235)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: 150,
                          child: Lottie.network(
                              "https://assets4.lottiefiles.com/packages/lf20_0pivjQFVZl.json"),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(bottom: 5, left: 5, right: 5),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 21, 121, 235),
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return about();
                            }));
                          },
                          child: Text(
                            "ABOUT APP".tr,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        MaterialButton(
                          color: Color.fromARGB(255, 76, 140, 237),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }));
                          },
                          child: Icon(
                            Icons.home,
                            size: 48.3,
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return MyApp();
                            }));
                          },
                          child: Text(
                            "TRY THIS".tr,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    final lowPoint = size.height - 20;
    final highPoint = size.height - 40;
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 4, highPoint, size.width / 2, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
