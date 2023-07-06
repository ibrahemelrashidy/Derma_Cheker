import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:home_page/basic.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'HomePage.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_page/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var mypassword, myemail;
  bool staySignedIn =
      false; // Added variable to track stay signed in preference

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  signIn() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myemail, password: mypassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
            context: context,
            title: "ERROR",
            body: Text("user-not-found"),
          )..show();
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
            context: context,
            title: "ERROR",
            body: Text("wrong-password"),
          )..show();
        }
      }
    } else {
      print("not valid");
    }
  }

  void saveStaySignedIn(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('staySignedIn', value);
  }

  void loadStaySignedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? signedIn = prefs.getBool('staySignedIn');
    setState(() {
      staySignedIn = signedIn ?? false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadStaySignedIn();

    // Check if user is already signed in
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return basic();
        }));
      }
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
                Colors.blue.withOpacity(0.5),
                BlendMode.dstATop,
              ),
              fit: BoxFit.cover,
              image: AssetImage("images/66.jpeg"),
            ),
          ),
          child: ListView(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Container(
                            width: 350,
                            height: 350,
                            child: Lottie.network(
                              "https://assets7.lottiefiles.com/packages/lf20_ktwnwv5m.json",
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Form(
                            key: formstate,
                            child: Column(
                              children: [
                                TextFormField(
                                  onSaved: (val) {
                                    myemail = val;
                                  },
                                  validator: (val) {
                                    if (val!.length > 100) {
                                      return "Email can't be larger than 100 letters";
                                    }
                                    if (val.length < 2) {
                                      return "Email can't be less than 2 letters";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Enter your name",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 69, 192, 131),
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  onSaved: (val) {
                                    mypassword = val;
                                  },
                                  validator: (val) {
                                    if (val!.length > 30) {
                                      return "Password can't be larger than 30 letters";
                                    }
                                    if (val.length < 6) {
                                      return "Password can't be less than 6 letters";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Enter your password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 69, 192, 131),
                                      ),
                                    ),
                                  ),
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 70,
                                ),
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    var user = await signIn();
                                    if (user != null) {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(builder: (context) {
                                        return basic();
                                      }));
                                      saveStaySignedIn(
                                          staySignedIn); // Save the stay signed in preference
                                    }
                                  },
                                  icon: Icon(
                                    Icons.home,
                                    size: 25,
                                  ),
                                  label: Text(
                                    "Enter",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(300, 30),
                                    textStyle: TextStyle(fontSize: 10),
                                    shadowColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                CheckboxListTile(
                                  title: Text(
                                    'Stay Signed In',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  value: staySignedIn,
                                  onChanged: (value) {
                                    setState(() {
                                      staySignedIn = value!;
                                    });
                                  },
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
            ],
          ),
        ),
      ),
    );
  }
}
