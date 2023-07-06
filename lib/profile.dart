import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_page/TfliteModel.dart';
import 'package:home_page/more.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'HomePage.dart';
import 'package:home_page/login.dart';
import 'package:home_page/basic.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  Future<void> updateCondition(String condition) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'Condition': condition});
      print('Condition updated successfully.');
    } catch (error) {
      print('Error updating condition: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
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
                              "https://assets8.lottiefiles.com/packages/lf20_zfszhesy.json"),
                        ),
                      ],
                    ),
                  )),
              Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(children: [
                      StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                          stream: FirebaseFirestore.instance
                              .collection('users')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              debugPrint('snapshot status: ${snapshot.error}');
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.green,
                                  backgroundColor: Colors.grey,
                                ),
                              );
                            } else {
                              Map<String, dynamic>? data = snapshot.data?.data()
                                  as Map<String, dynamic>?;
                              if (data != null) {
                                return SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(20),
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          width: double.infinity,
                                          height: 50,
                                          child: Text(
                                            "First Name :- ${data['first name']}",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white70),
                                          )),
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        width: double.infinity,
                                        height: 50,
                                        child: Text(
                                          "Last Name :- ${data['last name']}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white70),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        width: double.infinity,
                                        height: 50,
                                        child: Text(
                                          "Email :- ${data['email']}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white70),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        width: double.infinity,
                                        height: 50,
                                        child: Text(
                                          "Age :- ${data['age']}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white70),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(20),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        width: double.infinity,
                                        height: 50,
                                        child: Text(
                                          "Condition :- ${data['condition']}",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white70),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Center(
                                  child: Text('error happened'),
                                );
                              }
                            }
                          })
                    ]),
                  ),
                ],
              )
            ],
          ),
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
