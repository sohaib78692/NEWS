import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp (
          debugShowCheckedModeBanner: false,
          title: 'NEWS App',
          theme: ThemeData(textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),fontFamily: "RobotoSlab"   ,colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.black,background: Colors.green) ),
          home: Homescreen(),
          
        )
    ;
  }
}

