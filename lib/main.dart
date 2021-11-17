// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Store/EditData.dart';
import 'package:myapp/Store/addData.dart';
import 'Store/viewData.dart';
import 'graphic/color.dart';
import 'screen/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SIndex());
}


class SIndex extends StatelessWidget {
  const SIndex({Key? key}) : super(key: key);

  // const ShowText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowIndex(),
      routes: {
        'AddData': (context) => AddData(),
        'ViewData': (context) => ViewData(),
        'EditData': (context) => EditData(id: key,),
      //   // 'Image': (context) => PackageImage(),
      //   // 'Video': (context) => PackageVideo(),
      //   // 'Location': (context) => PackageLocation(),
      //   //  'Store': (context) => Store(),
      },
      theme: ThemeData(
        primaryColor: pdColor, 
        secondaryHeaderColor: sColor,
        // appBarTheme: pdColor,
        fontFamily: 'Kanit'),
      // seconder
    );
  }
}
