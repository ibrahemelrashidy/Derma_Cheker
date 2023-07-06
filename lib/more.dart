import 'package:firebase_auth/firebase_auth.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_page/link.dart';

import 'package:lottie/lottie.dart';
import 'package:home_page/signup.dart';
import 'package:home_page/login.dart';
import 'package:home_page/TfliteModel.dart';
import 'package:home_page/more.dart';

class more extends StatefulWidget {
  @override
  State<more> createState() => _moreState();
}

class _moreState extends State<more> {
  var _selectedLang ='en';
  @override
  Widget build(BuildContext context) {
     // applies this theme if the device theme is dark mode
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: [ Container(child:DropdownButton(items: [
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
               },)),],
            
            bottom: TabBar(tabs: [
              Tab(
                child: Text("About us".tr),
                icon: Icon(Icons.insert_drive_file_outlined),
              ),
              Tab(
                child: Text("Contact".tr),
                icon: Icon(Icons.contact_mail_rounded),
              ),
              Tab(
                child: Text("About diseas".tr),
                icon: Icon(Icons.medical_information),
              ),
            ]),
          ),
          
          body: TabBarView(children: [
            
            Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.all(5),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 400,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue,
                              blurRadius: 15,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 70,
                              backgroundImage: AssetImage("images/ebrahem.jpg"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Team leader".tr,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Name:-${'Ibrahem Elrashidy'.tr}".tr,
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 20),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Column(
                              children: [
                                Text("Job1:-${'Mobile Developer.'.tr}".tr,
                                    style: TextStyle(color: Colors.blue)),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                    "Job2:-${'Make Simple Model To Classify Type Of Skin '.tr}".tr,
                                    style: TextStyle(color: Colors.blue)),
                                Text(" Cancer.".tr,
                                    style: TextStyle(color: Colors.blue)),
                                SizedBox(
                                  height: 3,
                                ),
                                Text("Job3:-${'UI And UX Designer.'.tr}".tr,
                                    style: TextStyle(color: Colors.blue)),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                    "Job4:-${'make an integration page for two models.'.tr}".tr,
                                    style: TextStyle(color: Colors.blue))
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 300,
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue,
                                    blurRadius: 15,
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 70,
                                    backgroundImage:
                                        AssetImage('images/sasa.jpg'),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Name:-${'Mostafa Saad '.tr}".tr,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    children: [
                                      Text("Jobs:-${'Mobile Developer'.tr}".tr,
                                          style: TextStyle(color: Colors.blue)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 300,
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue,
                                    blurRadius: 15,
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 70,
                                    backgroundImage:
                                        AssetImage("images/has.jpg"),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Name:-${'Hassan_Ali'.tr}".tr,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    children: [
                                      Text("Jobs:-${'Mobile Developer'.tr}".tr,
                                          style: TextStyle(color: Colors.blue)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 300,
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue,
                                    blurRadius: 15,
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 70,
                                    backgroundImage:
                                        AssetImage("images/ghadeer.jpg"),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Name:-${'Ghadeer_Ahmed'.tr}".tr,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    children: [
                                      Text("Jobs:-${'Mobile Developer'.tr}".tr,
                                          style: TextStyle(color: Colors.blue)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 300,
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue,
                                    blurRadius: 15,
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 70,
                                    backgroundImage:
                                        AssetImage("images/elkomy.jpg"),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Name:-${'Mostafa_Elkomy'.tr}".tr,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    children: [
                                      Text("Jobs:-${'Mobile Developer'.tr}".tr,
                                          style: TextStyle(color: Colors.blue)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 300,
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue,
                                    blurRadius: 15,
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 70,
                                    backgroundImage:
                                        AssetImage('images/fady.jpg'),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Name:-${'Fady Samer'.tr}".tr,
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Column(
                                    children: [
                                      Text("Jobs:-${'Ai'.tr}".tr,
                                          style: TextStyle(color: Colors.blue)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                height: 300,
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue,
                                      blurRadius: 15,
                                    )
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 70,
                                      backgroundImage:
                                          AssetImage('images/elswasany.jpg'),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Name:-${'Mohamed_Hamed'.tr}".tr,
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      children: [
                                        Text("Jobs:-${'Ai'.tr}".tr,
                                            style:
                                                TextStyle(color: Colors.blue)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Contact Us".tr,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CastoroTitling',
                      ),
                    ),
                  )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color.fromARGB(255, 21, 121, 235)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color:
                                          Color.fromARGB(255, 154, 153, 238)),
                                  child: Text("1",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)),
                                )),
                            Expanded(
                                flex: 5,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Ibrahim Elrashidy".tr,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Email: elrashidyibrahem@gmail.com",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ],
                                    )))
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color.fromARGB(255, 21, 121, 235)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color:
                                          Color.fromARGB(255, 154, 153, 238)),
                                  child: Text("2",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)),
                                )),
                            Expanded(
                                flex: 5,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Mostafa Saad".tr,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Email: espammm48@gmail.com",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ],
                                    )))
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color.fromARGB(255, 21, 121, 235)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color:
                                          Color.fromARGB(255, 154, 153, 238)),
                                  child: Text("3",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)),
                                )),
                            Expanded(
                                flex: 5,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Hassan Ali".tr,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Email: ha8019468@gmail.com",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ],
                                    )))
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color.fromARGB(255, 21, 121, 235)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color:
                                          Color.fromARGB(255, 154, 153, 238)),
                                  child: Text("4",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)),
                                )),
                            Expanded(
                                flex: 5,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Ghadeer Ahmed".tr,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Email: ghadeer.elsalhawy@gmail.com",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ],
                                    )))
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color.fromARGB(255, 21, 121, 235)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color:
                                          Color.fromARGB(255, 154, 153, 238)),
                                  child: Text("5",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)),
                                )),
                            Expanded(
                                flex: 5,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Mostafa Elkomy".tr,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Email: mustafaelkomy2000@gmail.com",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ],
                                    )))
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color.fromARGB(255, 21, 121, 235)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color:
                                          Color.fromARGB(255, 154, 153, 238)),
                                  child: Text("6",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)),
                                )),
                            Expanded(
                                flex: 5,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Fady Samir".tr,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Email: fadysamir053@gmail.com",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ],
                                    )))
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color.fromARGB(255, 21, 121, 235)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color:
                                          Color.fromARGB(255, 154, 153, 238)),
                                  child: Text("7",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)),
                                )),
                            Expanded(
                                flex: 5,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.all(5),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Mohamed Hamed".tr,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Email: mh0394929@gmail.com",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ))
                                      ],
                                    )))
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color.fromARGB(255, 21, 121, 235)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color:
                                          Color.fromARGB(255, 154, 153, 238)),
                                  child: Text("8",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)),
                                )),
                            
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Color.fromARGB(255, 21, 121, 235)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color:
                                          Color.fromARGB(255, 154, 153, 238)),
                                  child: Text("Gmail".tr,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)),
                                )),
                            Expanded(
                                flex: 3,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.all(5),
                                    child:
                                        HyperLink("https://mail.google.com/")))
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Container(
                width: double.infinity,
                height: 800,
                child: ListView(physics: BouncingScrollPhysics(), children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Types of Skin Cancer".tr,
                          style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              fontFamily: "CastoroTitling"),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                margin: EdgeInsets.all(5),
                                height: 320,
                                child: FlipCard(
                                  fill: Fill.fillBack,
                                  direction: FlipDirection.HORIZONTAL,
                                  front: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 21, 121, 235),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 154, 153, 238),
                                                blurRadius: 5,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: Column(
                                        children: [
                                          Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(top: 145),
                                              child: Text(
                                                "Actinic Keratosis".tr,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    inherit: true,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        "CastoroTitling",
                                                    fontSize: 18.0,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    shadows: [
                                                      Shadow(
                                                          offset: Offset(
                                                              -1.5, -1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(1.5, -1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(1.5, 1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(-1.5, 1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                    ]),
                                              )),
                                          Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  "For Information press here".tr,
                                                  style: TextStyle(
                                                    inherit: true,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:
                                                        "CastoroTitling",
                                                    fontSize: 10.0,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  )))
                                        ],
                                      )),
                                  back: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 154, 153, 238),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "This is a type of skin lesion that develops due to chronic sun exposure.                        It typically appears as rough, scaly patches on the skin and can progress into a type of skin cancer called squamous cell carcinoma if left untreated.".tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                                margin: EdgeInsets.all(5),
                                height: 320,
                                child: FlipCard(
                                  fill: Fill.fillBack,
                                  direction: FlipDirection.HORIZONTAL,
                                  front: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 21, 121, 235),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 154, 153, 238),
                                                blurRadius: 5,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: Column(
                                        children: [
                                          Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(top: 145),
                                              child: Text(
                                                "Basal Cell Carcinoma".tr,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    inherit: true,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily:
                                                        "CastoroTitling",
                                                    fontSize: 18.0,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    shadows: [
                                                      Shadow(
                                                          offset: Offset(
                                                              -1.5, -1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(1.5, -1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(1.5, 1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(-1.5, 1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                    ]),
                                              )),
                                          Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  "For Information press here".tr,
                                                  style: TextStyle(
                                                    inherit: true,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:
                                                        "CastoroTitling",
                                                    fontSize: 10.0,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  )))
                                        ],
                                      )),
                                  back: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 154, 153, 238),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "This is a type of skin cancer that usually develops on areas of skin that have been exposed to the sun, such as the face or neck.                                   It often appears as a raised, pink or pearly bump that may bleed or become crusty. Basal cell carcinoma tends to grow slowly and rarely spreads to other parts of the body.".tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                margin: EdgeInsets.all(5),
                                height: 320,
                                child: FlipCard(
                                  fill: Fill.fillBack,
                                  direction: FlipDirection.HORIZONTAL,
                                  front: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 21, 121, 235),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 154, 153, 238),
                                                blurRadius: 5,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: Column(
                                        children: [
                                          Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(top: 145),
                                              child: Text(
                                                "Dermatofibroma".tr,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    inherit: true,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        "CastoroTitling",
                                                    fontSize: 18.0,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    shadows: [
                                                      Shadow(
                                                          offset: Offset(
                                                              -1.5, -1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(1.5, -1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(1.5, 1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(-1.5, 1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                    ]),
                                              )),
                                          Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  "For Information press here".tr,
                                                  style: TextStyle(
                                                    inherit: true,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:
                                                        "CastoroTitling",
                                                    fontSize: 11.0,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  )))
                                        ],
                                      )),
                                  back: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 154, 153, 238),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "This is a benign skin growth that usually appears on the legs but can appear anywhere on the body. It often appears as a round, firm bump that may be brown or reddish in color. Although it is harmless, some people may choose to have it removed for cosmetic reasons.".tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                                margin: EdgeInsets.all(5),
                                height: 320,
                                child: FlipCard(
                                  fill: Fill.fillBack,
                                  direction: FlipDirection.HORIZONTAL,
                                  front: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 21, 121, 235),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 154, 153, 238),
                                                blurRadius: 5,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: Column(
                                        children: [
                                          Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(top: 145),
                                              child: Text(
                                                "Melanoma".tr,
                                                style: TextStyle(
                                                    inherit: true,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily:
                                                        "CastoroTitling",
                                                    fontSize: 18.0,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    shadows: [
                                                      Shadow(
                                                          offset: Offset(
                                                              -1.5, -1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(1.5, -1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(1.5, 1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(-1.5, 1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                    ]),
                                              )),
                                          Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  "For Information press here".tr,
                                                  style: TextStyle(
                                                    inherit: true,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:
                                                        "CastoroTitling",
                                                    fontSize: 10.0,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  )))
                                        ],
                                      )),
                                  back: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 154, 153, 238),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "This is the deadliest form of skin cancer and can develop anywhere on the body, including areas not exposed to the sun. It often appears as a dark, irregularly shaped mole and can spread quickly to other parts of the body if left untreated.".tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                margin: EdgeInsets.all(5),
                                height: 320,
                                child: FlipCard(
                                  fill: Fill.fillBack,
                                  direction: FlipDirection.HORIZONTAL,
                                  front: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 21, 121, 235),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 154, 153, 238),
                                                blurRadius: 5,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: Column(
                                        children: [
                                          Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(top: 145),
                                              child: Text(
                                                "Nevus".tr,
                                                style: TextStyle(
                                                    inherit: true,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        "CastoroTitling",
                                                    fontSize: 18.0,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    shadows: [
                                                      Shadow(
                                                          offset: Offset(
                                                              -1.5, -1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(1.5, -1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(1.5, 1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(-1.5, 1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                    ]),
                                              )),
                                          Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  "For Information press here".tr,
                                                  style: TextStyle(
                                                    inherit: true,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:
                                                        "CastoroTitling",
                                                    fontSize: 10.0,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  )))
                                        ],
                                      )),
                                  back: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 154, 153, 238),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "This is another term for a mole, which is a common type of benign skin growth that usually appears during childhood or adolescence. Moles can vary in size, shape, and color, but most are harmless.".tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                                margin: EdgeInsets.all(5),
                                height: 320,
                                child: FlipCard(
                                  fill: Fill.fillBack,
                                  direction: FlipDirection.HORIZONTAL,
                                  front: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 21, 121, 235),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 154, 153, 238),
                                                blurRadius: 5,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: Column(
                                        children: [
                                          Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(top: 145),
                                              child: Text(
                                                "Pigmented Benign Keratosis (Seborrheic Keratosis)".tr,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    inherit: true,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily:
                                                        "CastoroTitling",
                                                    fontSize: 18.0,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    shadows: [
                                                      Shadow(
                                                          offset: Offset(
                                                              -1.5, -1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(1.5, -1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(1.5, 1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(-1.5, 1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                    ]),
                                              )),
                                          Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  "For Information press here".tr,
                                                  style: TextStyle(
                                                    inherit: true,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:
                                                        "CastoroTitling",
                                                    fontSize: 10.0,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  )))
                                        ],
                                      )),
                                  back: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 154, 153, 238),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "This is a harmless, non-cancerous skin growth that usually appears in older adults. It often appears as a waxy, tan or brown patch on the skin.".tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                margin: EdgeInsets.all(5),
                                height: 320,
                                child: FlipCard(
                                  fill: Fill.fillBack,
                                  direction: FlipDirection.HORIZONTAL,
                                  front: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 21, 121, 235),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 154, 153, 238),
                                                blurRadius: 5,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: Column(
                                        children: [
                                          Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(top: 145),
                                              child: Text(
                                                "Squamous Cell Carcinoma".tr,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    inherit: true,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        "CastoroTitling",
                                                    fontSize: 18.0,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    shadows: [
                                                      Shadow(
                                                          offset: Offset(
                                                              -1.5, -1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(1.5, -1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(1.5, 1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(-1.5, 1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                    ]),
                                              )),
                                          Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  "For Information press here".tr,
                                                  style: TextStyle(
                                                    inherit: true,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:
                                                        "CastoroTitling",
                                                    fontSize: 10.0,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  )))
                                        ],
                                      )),
                                  back: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 154, 153, 238),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "This is a type of skin cancer that usually develops on areas of skin that have been exposed to the sun, such as the face, neck, and hands. It often appears as a scaly, red patch or bump that may bleed or become crusty. Squamous cell carcinoma can spread to other parts of the body if left untreated.".tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                                margin: EdgeInsets.all(5),
                                height: 320,
                                child: FlipCard(
                                  fill: Fill.fillBack,
                                  direction: FlipDirection.HORIZONTAL,
                                  front: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 21, 121, 235),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 154, 153, 238),
                                                blurRadius: 5,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: Column(
                                        children: [
                                          Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.only(top: 145),
                                              child: Text(
                                                "Vascular lesions".tr,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    inherit: true,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily:
                                                        "CastoroTitling",
                                                    fontSize: 18.0,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    shadows: [
                                                      Shadow(
                                                          offset: Offset(
                                                              -1.5, -1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(1.5, -1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(1.5, 1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                      Shadow(
                                                          offset:
                                                              Offset(-1.5, 1.5),
                                                          color: Color.fromARGB(
                                                              255, 0, 0, 0)),
                                                    ]),
                                              )),
                                          Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                  "For Information press here".tr,
                                                  style: TextStyle(
                                                    inherit: true,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily:
                                                        "CastoroTitling",
                                                    fontSize: 10.0,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0),
                                                  )))
                                        ],
                                      )),
                                  back: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 154, 153, 238),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "refer to abnormal growths or damage in blood vessels.".tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  )
                ]))
          ]),
        ));
  }
}
