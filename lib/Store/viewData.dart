// ignore_for_file: prefer_adjacent_string_concatenation, avoid_print, file_names, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_name, unused_import, prefer_const_constructors, non_constant_identifier_names, avoid_web_libraries_in_flutter

// import 'package:better_player/better_player.dart';
// import 'dart:html';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:link_preview_generator/link_preview_generator.dart';
import 'package:myapp/Store/EditData.dart';
import 'package:myapp/graphic/color.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:simple_url_preview/simple_url_preview.dart';

class ViewData extends StatefulWidget {
  final dynamic chLoin;
  const ViewData({required this.chLoin, Key? key}) : super(key: key);

  @override
  _ViewdataState createState() => _ViewdataState();
}

class _ViewdataState extends State<ViewData> {
  //ประกาศตัวแปรเพื่ออ้างอิงไปยัง Child ที่ต้องการ
  final dbfirebase = FirebaseDatabase.instance.reference().child('Stories');

  Widget checkAuth() {
    if (widget.chLoin == 0) {
      return editDeleteNotLogin();
    } else {
      // Navigator.pushReplacement();
      return editDeleteLogin();
    }
  }

  Widget editDeleteNotLogin() {
    return Container(
      child: FirebaseAnimatedList(
        query: dbfirebase,
        itemBuilder: (context, snapshot, animation, index) {
          return Container(
            height: 200,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Card(
              color: pColor,
              elevation: 10,
              child: ListTile(
                title: Column(
                  children: [
                    SimpleUrlPreview(
                      url: snapshot.value['Link'],
                      onTap: () {
                        String url = '${snapshot.value['Link']}';
                        launchURL(url);
                      },
                    ),

                    // LinkPreview(
                    //   enableAnimation: true,
                    //   onPreviewDataFetched: (data) {
                    //     setState(() {
                    //       datas = {
                    //         ...datas,
                    //         snapshot.value['Link'][index]: data,
                    //       };
                    //     });
                    //   },
                    //   previewData: datas[snapshot.value['Link']
                    //       [index]], // Pass the preview data from the state
                    //   text: '${snapshot.value['Title']}',
                    //   width: MediaQuery.of(context).size.width,
                    // ),

                    Text(
                      '${snapshot.value['Channel']}',
                      style: TextStyle(fontSize: 15, color: aColor),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget editDeleteLogin() {
    return Container(
      child: FirebaseAnimatedList(
        query: dbfirebase,
        itemBuilder: (context, snapshot, animation, index) {
          return Container(
            height: 250,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Card(
              color: pColor,
              elevation: 10,
              child: ListTile(
                title: Column(
                  children: [
                    SimpleUrlPreview(
                      url: snapshot.value['Link'],
                      onTap: () {
                        String url = '${snapshot.value['Link']}';
                        launchURL(url);
                      },
                    ),
                    // ),

                    // LinkPreview(
                    //   enableAnimation: true,
                    //   onPreviewDataFetched: (data) {
                    //     setState(() {
                    //       datas = {
                    //         ...datas,
                    //         snapshot.value['Link'][index]: data,
                    //       };
                    //     });
                    //   },
                    //   previewData: datas[snapshot.value['Link']
                    //       [index]], // Pass the preview data from the state
                    //   text: '${snapshot.value['Title']}',
                    //   width: MediaQuery.of(context).size.width,
                    // ),

                    Text(
                      '${snapshot.value['Channel']}',
                      style: TextStyle(fontSize: 15, color: aColor),
                    ),
                    Row(
                      // mainAxisAlignment: ,
                      children: [
                        Expanded(
                          child: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 40,
                            ),
                            onPressed: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: aColor,
                                  shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                  title: const Text('Delete',
                                      style: TextStyle(fontSize: 25)),
                                  content: const Text(
                                      'ต้องการลบข้อมูลใช่หรือไม่',
                                      style: TextStyle(fontSize: 20)),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'ใช่');
                                        print('ลบข้อมูล');
                                        dbfirebase
                                            .child(snapshot.key!)
                                            .remove();
                                      },
                                      child: const Text(
                                        'ใช่',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      style: TextButton.styleFrom(
                                        // alignment: Alignment(S),
                                        primary: Colors.white,
                                        backgroundColor: Colors.greenAccent,
                                        onSurface: Colors.green,
                                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'ยกเลิก'),
                                      child: const Text('ยกเลิก',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black)),
                                      style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.redAccent,
                                        onSurface: Colors.red,
                                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                      ),
                                    ),
                                  ],
                                ),
                              );

                              // print('ลบข้อมูล');
                              // dbfirebase.child(snapshot.key!).remove();
                            },
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.green,
                              size: 40,
                            ),
                            onPressed: () {
                              var id = snapshot.key!;
                              // var title = snapshot.value['Title'];
                              var channel = snapshot.value['Channel'];
                              var link = snapshot.value['Link'];
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditData(
                                            id: id,
                                            // title: title,
                                            channel: channel,
                                            link: link,
                                          )));
                              print('แก้ไขข้อมูล');
                              print(id +
                                  '\n' +
                                  // title +
                                  '\n' +
                                  channel +
                                  '\n' +
                                  link);
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // function สำหรับการแก้ไขข้อมูล
  Map<String, PreviewData> datas = {};

  @override
  Widget build(BuildContext context) {
    return checkAuth();
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
