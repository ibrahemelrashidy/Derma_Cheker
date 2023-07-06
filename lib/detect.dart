import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MaterialApp(
      home: detect(),

    ));

class detect extends StatefulWidget {
  const detect({Key? key}) : super(key: key);

  @override
  _detectState createState() => _detectState();
}

class _detectState extends State<detect> {
  List? _outputs;
  var _selectedLang ='en';
  File? image;
  bool _loading = false;

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
                            "It is ${_outputs![0]['label']}",
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
    setState(() {
      _outputs = output!;
      _loading = false;
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "detect/model.tflite",
      labels: "detect/labels.txt",
    );
  }
}
