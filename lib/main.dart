import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:opt_verify/profile.dart';
import 'package:opt_verify/verification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'language.dart';
import 'package:responsive_mediaquery/responsive_mediaquery.dart';
import 'mobile.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 1,
          backgroundColor: Colors.black,
          toolbarHeight: 21,
          iconTheme: IconThemeData(color: Colors.white,size: 20)
        ),
        primarySwatch: Colors.blue,
      ),
      home: LanguagePage(),
    );
  }
}
