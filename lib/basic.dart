

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_page/TfliteModel.dart';

import 'package:home_page/detect.dart';
import 'package:home_page/doctor.dart';

import 'package:home_page/more.dart';
import 'package:home_page/profile.dart';

import 'package:lottie/lottie.dart';
import 'HomePage.dart';
import 'package:home_page/login.dart';
import 'package:home_page/basic.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class basic extends StatefulWidget {
  const basic({Key? key}) : super(key: key);

  @override
  State<basic> createState() => _basicState();
}

class _basicState extends State<basic> {
  var _selectedLang ='en';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,actions: [Container(
        margin: EdgeInsets.only(right: 40),child:DropdownButton(items: [
                DropdownMenuItem(child: Text("en"),
                value : 'en'),
                 DropdownMenuItem(child: Text("ar"),
                 value : 'ar')
              ],
               value : _selectedLang,
               onChanged: (value){
                setState(() {
                  _selectedLang = value as String ;
                });
                Get.updateLocale(Locale(_selectedLang));
               },)),
               Container
      
      (
        height: 40,
        
        width: 40,
        child:  FloatingActionButton(
        onPressed: () {
          _signOut(context);
        },
        child: Icon(Icons.logout),
        
      ),),],),
       
        body: Column(
          children: [
            
            ClipPath(
                clipper: WaveClip(),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 300,
                        child: Lottie.network(
                            "https://assets10.lottiefiles.com/packages/lf20_coahzstz.json"),
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 40,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Container(
                  padding: EdgeInsets.all(40),
                  margin: EdgeInsets.all(20),
                  height: 300,
                  width: 260,
                  decoration: BoxDecoration(
                    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
                    borderRadius: BorderRadius.circular(28),
                    color: Color.fromARGB(171, 255, 255, 255),
                  ),
                  child: MaterialButton(
                      hoverColor: Color.fromARGB(255, 232, 134, 101),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return profile();
                        }));
                      },
                      child: Column(
                        children: [
                          Text(
                            "Your Profile".tr,
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(
                            Icons.person,
                            color: Colors.blue,
                            size: 170,
                          ),
                        ],
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(40),
                  margin: EdgeInsets.all(20),
                  height: 300,
                  width: 260,
                  decoration: BoxDecoration(
                    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
                    borderRadius: BorderRadius.circular(28),
                    color: Color.fromARGB(171, 255, 255, 255),
                  ),
                  child: MaterialButton(
                      hoverColor: Color.fromARGB(255, 232, 134, 101),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return MyApp();
                        }));
                      },
                      child: Column(
                        children: [
                          Text(
                            "To Check If You Malignant Or Not Press Here".tr,
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(
                            Icons.medical_services_outlined,
                            color: Colors.blue,
                            size: 150,
                          ),
                        ],
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(40),
                  margin: EdgeInsets.all(20),
                  height: 300,
                  width: 260,
                  decoration: BoxDecoration(
                    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
                    borderRadius: BorderRadius.circular(28),
                    color: Color.fromARGB(171, 255, 255, 255),
                  ),
                  child: MaterialButton(
                      hoverColor: Color.fromARGB(255, 232, 134, 101),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return detect();
                        }));
                      },
                      child: Column(
                        children: [
                          Text(
                            " To Check The Type Of Skin Cancer ".tr,
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(
                            Icons.medical_information_outlined,
                            color: Colors.blue,
                            size: 150,
                          ),
                        ],
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(40),
                  margin: EdgeInsets.all(20),
                  height: 300,
                  width: 260,
                  decoration: BoxDecoration(
                    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
                    borderRadius: BorderRadius.circular(28),
                    color: Color.fromARGB(171, 255, 255, 255),
                  ),
                  child: MaterialButton(
                      hoverColor: Color.fromARGB(255, 232, 134, 101),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return doctor();
                        }));
                      },
                      child: Column(
                        children: [
                          Text(
                            " To See Top Doctor In Egypt Press Her  ".tr,
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(
                            Icons.local_hospital_rounded,
                            color: Colors.blue,
                            size: 150,
                          ),
                        ],
                      )),
                ),
                Container(
                  padding: EdgeInsets.all(40),
                  margin: EdgeInsets.all(20),
                  height: 300,
                  width: 260,
                  decoration: BoxDecoration(
                    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
                    borderRadius: BorderRadius.circular(28),
                    color: Color.fromARGB(171, 255, 255, 255),
                  ),
                  child: MaterialButton(
                      hoverColor: Color.fromARGB(255, 32, 15, 9),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return more();
                        }));
                      },
                      child: Column(
                        children: [
                          Text(
                            "  More  ".tr,
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(
                            Icons.more_horiz,
                            color: Colors.blue,
                            size: 170,
                          ),
                        ],
                      )),
                ),
              ]),
            ),
          ],
        ));
  }
}

//Container(
//width: double.infinity,
//margin: EdgeInsets.only(top: 628),
//decoration: BoxDecoration(
// color: Color.fromARGB(207, 255, 255, 255),
//),
//alignment: Alignment.bottomCenter,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [

// ],
//),
//),
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
Future<void> _signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );
}