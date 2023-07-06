import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
String condition = ''; // Global variable

void main() => runApp(MaterialApp(
      home: MyApp(),
      themeMode: ThemeMode.system,
       // applies this theme if the device theme is dark mode
    ));

class MyApp extends StatefulWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _selectedLang ='en';
  List? _outputs;
  File? image;
  bool _loading = false;
  Future<void> addOutputToFirestore(String condition) async {
    await Firebase.initializeApp();
    final userRef = FirebaseFirestore.instance.collection('users');
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await userRef.doc(uid).set({
      'uid': uid,
      'Condition': condition,
    });
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel().then((value) {
      setState(() {
        _loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title: Center(child: Text("detection".tr)),
        actions: [
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
        ],
      ),
      body: _loading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Container(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  image == null
                      ? Container()
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(image!),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  _outputs != null
                      ? Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "It is ${_outputs![0]['label']}".tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 45.0,
                                backgroundColor:
                                    Color.fromARGB(255, 7, 105, 225)),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: pickImage,
        child: Icon(Icons.image),
      ),
    );
  }

  Future pickImage() async {
    var saveimg = await ImagePicker().getImage(source: ImageSource.gallery);
    if (saveimg == null) return null;
    setState(() {
      _loading = false;
      image = File(saveimg.path);
    });
    Image.file(image!);
    imageClassification(image!);
  }

  imageClassification(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    Future<void> saveCondition(String condition) async {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final docRef = FirebaseFirestore.instance.collection('users').doc(userId);

      await docRef.set({
        'condition': condition,
      }, SetOptions(merge: true));
    }
    setState(() {
      _outputs = output!;
      _loading = false;
    });
    String condition = _outputs![0]['label'];
    await addOutputToFirestore(condition);
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
    );
  }
}