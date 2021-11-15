// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:myapp/Store/viewData.dart';
import 'package:myapp/graphic/color.dart';

class ShowIndex extends StatefulWidget {
  const ShowIndex({Key? key}) : super(key: key);

  @override
  ShowIndexState createState() => ShowIndexState();
}

class ShowIndexState extends State<ShowIndex> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sColor,
      body: const TabBarView(
        children: [
          const ViewData(),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ghost Stories'),
        backgroundColor: pdColor,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              // ignore: unnecessary_const
              decoration: const BoxDecoration(
                  color: sColor,
                  image: DecorationImage(
                    image: AssetImage(
                        'graphic/img/btn_google_signin_dark_pressed_web.png'),
                  )
                  // image: AssetImage('graphic/img/btn_google_signin_dark_pressed_web.png'),
                  // image: AssetImage(null),
                  ),
              padding: EdgeInsets.all(15),
              child: Text(
                'Meun',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
            const Text(
              'รายการ',
              style: TextStyle(
                // color: Colors.white,
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
            ),
            ListTile(
              title: const Text(
                'รายการ',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              leading: const Icon(
                Icons.catching_pokemon_outlined,
                color: Colors.amber,
                size: 36,
              ),
              onTap: () {
                // print("Menu Video");
                // Navigator.pushNamed(context, 'รายการ');
              },
            ),
          ],
        ),
      ),
    );
  }
}
