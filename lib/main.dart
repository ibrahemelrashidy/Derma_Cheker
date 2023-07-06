import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:home_page/TfliteModel.dart';
import 'package:home_page/splash.dart';
import 'package:home_page/theme.dart';

import 'package:home_page/translations.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_page/signup.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String title = "flutter Demo";
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: HomePage(),
          translations: translation(),
          locale: Locale('en'),
          fallbackLocale: Locale('en'),
        );
      });
}
