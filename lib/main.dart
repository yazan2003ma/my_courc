import 'package:flutter/material.dart';
import 'package:flutter1/model/qrdatabase.dart';
import 'package:flutter1/screens/final.dart';
import 'package:flutter1/screens/finish.dart';
import 'package:flutter1/screens/home.dart';
import 'package:flutter1/screens/login.dart';
import 'package:flutter1/screens/mycode.dart';
import 'package:flutter1/screens/newcode.dart';
import 'package:flutter1/screens/profile.dart';
import 'package:flutter1/screens/read_only.dart';
import 'package:flutter1/screens/signup.dart';
import 'package:flutter1/screens/start.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDatabase.initialize();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppDatabase(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Start()),
    ),
  );
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Signup());
  }
}
