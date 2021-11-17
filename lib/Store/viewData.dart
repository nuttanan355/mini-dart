// ignore_for_file: prefer_adjacent_string_concatenation, avoid_print, file_names, sized_box_for_whitespace, avoid_unnecessary_containers, non_constant_identifier_names

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Store/EditData.dart';
import 'package:myapp/graphic/color.dart';

class ViewData extends StatefulWidget {
  const ViewData({Key? key}) : super(key: key);

  @override
  _ViewdataState createState() => _ViewdataState();
}

class _ViewdataState extends State<ViewData> {
  //ประกาศตัวแปรเพื่ออ้างอิงไปยัง Child ที่ต้องการ
  final dbfirebase = FirebaseDatabase.instance.reference().child('Stories');

  // function สำหรับการแก้ไขข้อมูล

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FirebaseAnimatedList(
        query: dbfirebase,
        itemBuilder: (context, snapshot, animation, index) {
          return Container(
            height: 300,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: Column(
                  children: [
                    Icon(Icons.food_bank_outlined),
                    Text('${snapshot.value['Title']}'),
                    Text('${snapshot.value['Channel']}'),
                    Row(
                      children: [
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              print('ลบข้อมูล');
                              dbfirebase.child(snapshot.key!).remove();
                            },
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              var id = snapshot.key!;
                              var title = snapshot.value['Title'];
                              var channel = snapshot.value['Channel'];
                              var link = snapshot.value['Link'];
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditData(
                                            id: id,
                                            title: title,
                                            channel: channel,
                                            link: link,
                                          )));
                              print('แก้ไขข้อมูล');
                              print(id +
                                  '\n' +
                                  title +
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

                // subtitle: Row(
                //   children: [

                //     Text(" Link " + '${snapshot.value['Link']}'),
                //   ],
                // ),
                // trailing: Column(
                //   children: [],
                // ),
              ),
            ),
          );
        },
      ),
    );
  }
}
