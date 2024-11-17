import 'package:flutter/material.dart';
import 'package:contact_app/demo.dart';

void main() {
  //to avoid any crash
  //add ensureInitialized() before runApp()
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacts Flutter SQFLite',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        // scaffoldBackgroundColor: Colors.blue,
      ),
      //create a new class for this
      home: Demo(),
    );
  }
}
