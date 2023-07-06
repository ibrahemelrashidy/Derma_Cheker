// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HyperLink extends StatelessWidget {
  
  final String text;
  HyperLink(this.text);
  @override
  Widget build(BuildContext context) {

    return RichText(
      
      text: TextSpan(
          text: text,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: Color.fromARGB(255, 255, 255, 255)),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launchUrlString(text);
            }),
    );
  }
}
