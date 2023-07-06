// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
//import 'package:js/js.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:home_page/HomePage.dart';

import 'package:lottie/lottie.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Hide the debug banner
      
      debugShowCheckedModeBanner: false,
      title: 'skin cancer ',

    );
  }
}

class doctor extends StatefulWidget {
  const doctor({Key? key}) : super(key: key);

  @override
  State<doctor> createState() => _doctorState();
}

class _doctorState extends State<doctor> {
  List _docdata = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/csvjson.json');
    final data = await json.decode(response);
    setState(() {
      _docdata = data["docdata"];
      print("..number of items ${_docdata.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                          "https://assets5.lottiefiles.com/packages/lf20_q4h0lj4s.json"),
                    ),
                  ],
                ),
              )),
          _docdata.isNotEmpty

              //     BoxDecoration(
              //         image: DecorationImage(
              //             image: NetworkImage( 'assets/csvjson.json'),fit: BoxFit.fill,)
              //     );
              ? Expanded(
                  child: ListView.builder(
                    itemCount: _docdata.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Card(
                              elevation: 5.0,
                              key: ValueKey(_docdata[index]["name"]),
                              margin: const EdgeInsets.all(10),
                              
                              child: ListTile(
                                //isThreeLine: true,
                                leading: CircleAvatar(
                                    //radius: 30.0,
                                    backgroundImage: NetworkImage(
                                  _docdata[index]['image'],
                                )
                                    // ClipRRect(
                                    //     borderRadius: BorderRadius.circular(25.0),
                                    //     //          decoration: BoxDecoration(
                                    //     //    image: DecorationImage(
                                    //     //        image: NetworkImage(
                                    //     //      _docdata[index]['image'],
                                    //     //    )),
                                    //     child: Image.network(
                                    //       _docdata[index]['image'],
                                    ),
                                title: Text(_docdata[index]["name"],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                subtitle: Text(_docdata[index]["address"],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal
                                        //fontSize: 15.0,
                                        )),
                                trailing:
                                    Text("Fees: " + _docdata[index]["fees"],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                              )),
                        ],
                      );
                      //     backgroundImage: NetworkImage(
                      //   _docdata[index]['image'],
                      // ),

                      //leading: Text(_docdata[index]["name"],
                      //    style: const TextStyle(
                      //      fontWeight: FontWeight.bold,
                      //    )),
                      //title: Text(_docdata[index]["address"],
                      //    style: const TextStyle(
                      //      fontWeight: FontWeight.normal,
                      //    )),
                      //
                      //trailing: CircleAvatar(
                      //    radius: 30.0,
                      //    backgroundImage: NetworkImage(
                      //      _docdata[index]['image'],
                      //    )),

                      //          //fit: BoxFit.cover,
                      //          ),
                      //    ),
                    },
                  ),
                )
              : ElevatedButton(
                  onPressed: () {
                    readJson();
                  },
                  child: Center(child: Text("Load Json")))
        ],
      ),
    );
  }
}
