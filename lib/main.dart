// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'graphic/color.dart';
import 'screen/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(SIndex());
}


class SIndex extends StatelessWidget {
  // const ShowText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowIndex(),
      // routes: {
      //   // 'Login': (context) => Login(),
      //   // 'Register': (context) => Register(),
      //   // 'Dashboard': (context) => Dashboard(),
      //   // 'Image': (context) => PackageImage(),
      //   // 'Video': (context) => PackageVideo(),
      //   // 'Location': (context) => PackageLocation(),
      //   //  'Store': (context) => Store(),
      // },
      theme: ThemeData(
        primaryColor: pdColor, 
        secondaryHeaderColor: sColor,
        // appBarTheme: pdColor,
        fontFamily: 'Kanit'),
      // seconder
    );
  }
}
