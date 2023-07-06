import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:home_page/TfliteModel.dart';
import 'package:home_page/signup.dart';
import 'dart:io';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'HomePage.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_page/signup.dart';
import 'package:home_page/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _selectedLang ='en';
  var myusername, mypassword, myemail;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _ageController = TextEditingController();
  final _countryController = TextEditingController();
  final _usernameController = TextEditingController();

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  SignUp() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: myemail,
          password: mypassword,
        );
        await userCredential.user?.sendEmailVerification();
        addUserDetails(
          _firstnameController.text.trim(),
          _lastnameController.text.trim(),
          _emailController.text.trim(),
          int.parse(_ageController.text.trim()),
        );
        return UserCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak password') {
          AwesomeDialog(
            context: context,
            title: "ERROR",
            body: Text("password is to weak"),
          )..show();
        } else if (e.code == 'email already use') {
          AwesomeDialog(
            context: context,
            title: "ERROR",
            body: Text("the account is already exists for that email"),
          )..show();
        }

        var userCredential;
        print(userCredential.user.emailVerified);
        if (userCredential.user.emailVerified == false) {
          User? user = FirebaseAuth.instance.currentUser;
          await user?.sendEmailVerification();
        }
      }
      ;
    } else {
      print("not valid");
    }
  }

  Future<void> addUserDetails(
      String firstName, String lastName, String email, int age) async {
    final userRef = FirebaseFirestore.instance.collection('users');
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await userRef.doc(uid).set({
      'uid': uid,
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'age': age,
      'Condition': condition,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        body: Container(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.blue.withOpacity(0.5), BlendMode.dstATop),
                    fit: BoxFit.cover,
                    image: AssetImage("images/66.jpeg"))),
            child: ListView(
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Container(child:DropdownButton(items: [
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
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            Container(
                                width: 220,
                                height: 200,
                                child: Lottie.network(
                                    "https://assets1.lottiefiles.com/packages/lf20_8jjkg2ut.json")),
                            SizedBox(
                              height: 30,
                            ),
                            Form(
                                key: formstate,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: _firstnameController,
                                      decoration: InputDecoration(
                                        labelText: "enter your first name".tr,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 236, 238, 239))),
                                      ),
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: _lastnameController,
                                      decoration: InputDecoration(
                                        labelText: "enter your last name".tr,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 249, 250, 251))),
                                      ),
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: _ageController,
                                      decoration: InputDecoration(
                                        labelText: "enter your age".tr,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 249, 250, 251))),
                                      ),
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: _usernameController,
                                      onSaved: (val) {
                                        myusername = val;
                                      },
                                      validator: (val) {
                                        if (val!.length > 100) {
                                          return "username can't to be larger than 100 letter";
                                        }
                                        if (val.length < 6) {
                                          return "username can't to be less than 10 letter";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: "user name".tr,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 243, 244, 245))),
                                      ),
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: _emailController,
                                      onSaved: (val) {
                                        myemail = val;
                                      },
                                      validator: (val) {
                                        if (val!.length > 100) {
                                          return "Email can't to be larger than 100 letter";
                                        }
                                        if (val.length < 10) {
                                          return "Email can't to be less than 10 letter";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: "enter your mail address".tr,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 249, 250, 252))),
                                      ),
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      obscureText: true,
                                      controller: _passwordController,
                                      onSaved: (val) {
                                        mypassword = val;
                                      },
                                      validator: (val) {
                                        if (val!.length > 30) {
                                          return "password can't to be larger than 30 letter";
                                        }
                                        if (val.length < 6) {
                                          return "password can't to be less than 6 letter";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        labelText: "enter password".tr,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 249, 246, 246))),
                                      ),
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                    SizedBox(height: 15),
                                    TextFormField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        labelText: "confirm password".tr,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 235, 238, 236))),
                                        hintStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 253, 254, 255)),
                                      ),
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 50,
                            ),
                            ElevatedButton.icon(
                              onPressed: () async {
                                var response = await SignUp();

                                if (response != null) {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return Login();
                                  }));
                                } else {
                                  print('Sign Up failed');
                                }
                              },
                              icon: Icon(
                                Icons.person,
                                size: 25,
                              ),
                              label: Text(
                                "create".tr,
                                style: TextStyle(fontSize: 25),
                              ),
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(300, 30),
                                  textStyle: TextStyle(fontSize: 10),
                                  shadowColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
