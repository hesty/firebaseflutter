import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  String a;
  Future<void> veriOku() async {
    //tum dokumankar
    await FirebaseFirestore.instance
        .collection("notlar")
        .get()
        .then((snapchpt) {
      snapchpt.docs.forEach((doc) {
        debugPrint(" ${doc.data()}");
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // veriEkle();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    veriOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("firebase superknowa"),
      ),
      body: Center(
        child: Text("merhaba"),
      ),
    );
  }
}
