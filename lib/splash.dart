// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:home_page/HomePage.dart';
// import 'package:home_page/themes.dart';
// import 'package:lottie/lottie.dart';

// class splash extends StatefulWidget {
//   const splash({Key? key}) : super(key: key);

//   @override
//   State<splash> createState() => _splashState();
// }

// class _splashState extends State<splash> {
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   startTimer() {
//     var duration = Duration(seconds: 4);
//     return Timer(duration, route);
//   }

//   route() {
//     Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
//       return HomePage();
//     })));
//   }

//   @override
//   Widget build(BuildContext context) {
//      ThemeMode.system;
//       ThemeClass.lightTheme; // applies this theme if the device theme is light mode
//       ThemeClass.darkTheme;// applies this theme if the device theme is dark mode
//     return Scaffold(
      
//       body: Center(
//         child: Lottie.network(
//             "https://assets4.lottiefiles.com/packages/lf20_0pivjQFVZl.json"),
//       ),
//     );
//   }
// }
