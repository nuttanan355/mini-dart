
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  final dbfirebase = FirebaseDatabase.instance.reference().child('Stories');

  Widget checkAuth(context) {
    if (FirebaseAuth.instance.currentUser == null) {
      return drawerAppBarNotLogin(context);
    } else {
      // Navigator.pushReplacement();
      return drawerAppBarLogin(context,);
    }
  }

  Widget drawerAppBarNotLogin(context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Ebiwayo'),
            accountEmail: Text('ebiwayo@ebiwayo.com'),
            currentAccountPicture:  CircleAvatar(
              child:  Icon(FontAwesomeIcons.user),
              backgroundColor: Colors.white,
            ),
          ),
          Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SignInButton(Buttons.Google,
                  text: "Sign up with Google",
                  onPressed: () => signInwithGoogle(context)),
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerAppBarLogin(context) {
  final user = FirebaseAuth.instance.currentUser!;
     final String _user = user.displayName!;
     var _email = user.email!;
     var _urlPhone = user.photoURL!;

    return Drawer(
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        
        children: <Widget>[
           UserAccountsDrawerHeader(
              accountName:  Text(_user),
              accountEmail: Text(_email),

              currentAccountPicture: Image.network(_urlPhone)
              ),
           ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.logout,color: Colors.red,),
            onTap: () {
              print(_user);
              print(_email);
              // signOutFromGoogle(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Ghost Stories'),
        backgroundColor: pdColor,
      ),
      body: ViewData(),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.yellow),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'AddData');
          },
          child: const Icon(Icons.add),
        ),
      ),
      drawer: checkAuth(context),
    );
  }
}

Future<String?> signInwithGoogle(context) async {
  try {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  } on FirebaseAuthException catch (e) {
    print("Exception Firebase Auth");
    print(e.message);
    throw e;
  }
}

Future<void> signOutFromGoogle(context) async {
  await GoogleSignIn().signOut();
  await FirebaseAuth.instance.signOut();
}

// https://youtu.be/_oLY4dD1Fog ห้อง.512 หนูมานอนที่นี่ทำไม | วังวน ไดอารี่
// https://youtu.be/irvtVw5duoU เจ้าสาวที่ถูกลืม x ลองของโรงงานร้าง | วังวน ไดอารี่
// https://youtu.be/xLx6SlUNuzY พยาบาลตรวจการ | วังวน ไดอารี่
// https://youtu.be/t5ks4b50g5g ใครคือผี x ไม้แหย่ผี | วังวน ไดอารี่
// https://youtu.be/ujxR631qkds หิวบุญกันนักรึ | วังวน ไดอารี่
// https://youtu.be/Ez9FaWJiY5g คนหาปลากับมหาเศรษฐี x เสื้อวัด | วังวน ไดอารี่