// ignore_for_file: avoid_print, prefer_const_constructors, file_names, avoid_unnecessary_containers, unnecessary_new, unused_import

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/graphic/color.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  // var name, surname, email, password;
  String? title, channel, link;
  final formKey = GlobalKey<FormState>();

  final dbfirebase = FirebaseDatabase.instance.reference().child('Stories');

  Future<void> createData() async {
    dbfirebase.push().set({
      // 'Title': title,
      'Channel': channel,
      'Link': link,
    }).then((value) {
      Navigator.of(context).pop();
      print("Success");
    }).catchError((onError) {
      print(onError.code);
      print(onError.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: sColor,
        appBar: AppBar(
          backgroundColor: pdColor,
          title: Text('Add Data'),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                imgVdd(),
                // txtTitle(),
                txtChannel(),
                txtLink(),
                btnSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imgVdd() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child:  Icon(FontAwesomeIcons.ghost,
        size: 200,color: pdColor,),
        // Image.network(
        //   'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
        //   width: 400,
        //   height: 230,
        // )
        );
  }

  // Widget txtTitle() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  //     child: TextField(
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         hintText: 'ชื่อเรื่อง',
  //         fillColor: Colors.white,
  //         filled: true,
  //       ),
  //       style: TextStyle(fontSize: 18),
  //       onChanged: (value) {
  //         title = value;
  //         return;
  //       },
  //     ),
  //   );
  // }

  Widget txtChannel() {
    return Container(
      // margin: EdgeInsets.symmetric( vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'รายการ',
          fillColor: Colors.white,
          filled: true,
        ),
        style: TextStyle(fontSize: 18),
        onChanged: (value) {
          channel = value;
          return;
        },
      ),
    );
  }

  Widget txtLink() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'Link Youtrue',
          fillColor: Colors.white,
          filled: true,
        ),
        style: TextStyle(fontSize: 18),
        onChanged: (value) {
          link = value;
          return;
        },
      ),
    );
  }

  Widget btnSubmit() {
    return Container(
      width: 250,
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            primary: aColor,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10))),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            // print(title);
            print(channel);
            print(link);
            createData();
          }
        },
        label: Text(
          'Save',
          style: TextStyle(color: Colors.black, fontSize: 26),
        ),
        icon: Icon(
          Icons.save,
          size: 40,
          color: Colors.black,
        ),
      ),
    );
  }
}
