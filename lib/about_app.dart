import 'package:flutter/material.dart';
import 'package:get/get.dart';


class about extends StatefulWidget {
  const about({Key? key}) : super(key: key);

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  var _selectedLang ='en';
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.all(5),
     
      child: ListView(
        children: [
          Column(
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
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.all(10),
                child: Text(
                  "Your Way to know the services provided by this application.".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "CastoroTitling"),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40)),
                child: Text(
                  "1- The program allows the user to have the opportunity for early detection of skin cancer by submitting a photo of the skin to the model embedded in the application. Based on that, the model classifies the image into two possible categories: malignant skin cancer or your scan is clean.".tr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40)),
                child: Text(
                  "2-This program contains a page called the home page. This page offers many services, the first of which is the ability to create an account in the application. Secondly If you have already created an account, you can also log in through your previously created account. Thirdly the home page also provides the ability to try the application without creating an account by providing a page called Try This.".tr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40)),
                child: Text(
                  "3- When you create an account in the program, it will provide you with a profile page that includes your first and last name, age, email address, and the live status that you have identified through the model classification of the entered image. It also allows you to have other capabilities like identifying the type of skin cancer. There are eight types of skin cancer, and this is achieved by clicking on the identification of the type of skin cancer button. Additionally, it allows you to identify the best doctors in Egypt by clicking on the Best Doctors in Egypt button.".tr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40)),
                child: Text(
                  "4- Here we will learn about the guidelines that users should follow in order to get accurate results from the program. First, if the user does not want to log in, they can access the model page directly by clicking on the try this button on the home page. Through the button located at the bottom of the model page, the user can add an image to the model, and the application will display the image on the screen with its classification based on the pre-defined labels. Secondly, if the user wants to create a personal page and experience identifying the type of skin cancer they are suffering from and learning about the most important doctors in that field, which means the user wants to get the complete experience, they must create an account in that application This provides four pages first, the profile page, second, the model page for classifying the disease as malignant or not, third, the model page for classifying the type of disease based on the eight types, and fourth, the page used to identify the most important doctors in that field. Fifth, provide a More page that contains three internal pages: one with detailed information about the disease and its types, another with ways to contact us, and a page dedicated to the team that created the program.".tr,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40)),
                child: Text(
                  "  WE WISH YOU A SPEEDY RECOVERY ".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
