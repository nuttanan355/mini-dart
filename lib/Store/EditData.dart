// ignore_for_file: avoid_print, prefer_const_constructors, file_names, avoid_unnecessary_containers, unnecessary_new, unused_import, no_logic_in_create_state, use_key_in_widget_constructors, prefer_final_fields
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/graphic/color.dart';

class EditData extends StatefulWidget {
  final dynamic id, channel, link;
  const EditData({required this.id, this.channel, this.link})
      : super();

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  String? title, channel, link;
  final formKey = GlobalKey<FormState>();

  // late TextEditingController _title, _channel, _link;

  // @override
  // void initState() {
  //   super.initState();
  //   _title = new TextEditingController(text: widget.title);
  //   _channel = new TextEditingController(text: widget.channel);
  //   _link = new TextEditingController(text: widget.link);
  // }

  final dbfirebase = FirebaseDatabase.instance.reference().child('Stories');

  Future<void> updateData() async {
    try {
      dbfirebase
          .child(widget.id)
          .update({
            // 'Title': title,
            'Channel': channel,
            'Link': link,
          })
          .then((value) {print('Success');
          Navigator.of(context).pop();} )
          .catchError((onError) {
            print(onError.code);
            print(onError.message);
          });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: sColor,
        appBar: AppBar(
          backgroundColor: pdColor,
          title: Text('Edit Date'),
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
  //     child: TextFormField(
  //         initialValue: widget.title,
  //         decoration: InputDecoration(
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           hintText: 'ชื่อเรื่อง',
  //           fillColor: Colors.white,
  //           filled: true,
  //         ),
  //         style: TextStyle(fontSize: 18),
  //         onSaved: (value) {
  //           title = value;
  //         }),
  //   );
  // }

  Widget txtChannel() {
    return Container(
      // margin: EdgeInsets.symmetric( vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        initialValue: widget.channel,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: 'รายการ',
          fillColor: Colors.white,
          filled: true,
        ),
        style: TextStyle(fontSize: 18),
        onSaved: (value) {
          channel = value;
        },
      ),
    );
  }

  Widget txtLink() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
          initialValue: widget.link,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'Link Youtrue',
            fillColor: Colors.white,
            filled: true,
          ),
          style: TextStyle(fontSize: 18),
          onSaved: (value) {
            link = value;
          }),
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
            print('EditData');
            // print(title);
            print(channel);
            print(link);
            updateData();
          }
        },
        label: Text(
          'Update',
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
