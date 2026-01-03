import 'package:flutter/material.dart';
import 'package:flutter1/model/qrdatabase.dart';
import 'package:flutter1/model/qrmodel.dart';
import 'package:flutter1/screens/login.dart';
import 'package:flutter1/screens/profile.dart';
import 'package:flutter1/widgets/BottomAuthText.dart';
import 'package:flutter1/widgets/main_buttonl.dart';

import 'package:flutter1/widgets/screen_templet.dart';
import 'package:flutter1/widgets/text_field_custom.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool ok = false;

  void add() {
    setState(() {
      ok = true;
      if (fullNameController.text.length >= 20 ||
          fullNameController.text.isEmpty) {
        ok = false;
        fullNameErrorMsg = 'name must be 20 characters';
      }
      if (userNameController.text.length >= 6 ||
          userNameController.text.isEmpty) {
        ok = false;
        userNameErrorMsg = 'name must be 6 characters';
      }
      if (emailController.text.isEmpty ||
          !emailController.text.contains('@') ||
          !emailController.text.contains('.')) {
        ok = false;
        emailErrorMsg = ' you should put @ ';
        emailErrorMsg = ' you should put @ , .';
      }
      if (passController.text.length < 6) {
        ok = false;
        passErrorMsg = 'password must be more than 6';
      }

      if (ok) {
        context.read<AppDatabase>().addUser(
          newFullName: fullNameController.text,
          newEmail: emailController.text,
          newPassword: passController.text,
          newuserName: userNameController.text,
        );
        Navigator.pop(context);
      }
    });
  }

  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String fullNameErrorMsg = '';
  String emailErrorMsg = '';
  String passErrorMsg = '';
  String userNameErrorMsg = '';

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Sign up",
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 40),

            CustomTextField(
              hint: "Full Name",
              controller: fullNameController,
              Errormsg: fullNameErrorMsg,
            ),
            const SizedBox(height: 20),

            CustomTextField(
              hint: "User Name",
              controller: userNameController,
              Errormsg: userNameErrorMsg,
            ),
            const SizedBox(height: 20),

            CustomTextField(
              hint: "Email",
              controller: emailController,
              Errormsg: emailErrorMsg,
            ),
            const SizedBox(height: 20),

            CustomTextField(
              hint: "Password",
              controller: passController,
              isPassword: true,
              Errormsg: passErrorMsg,
            ),

            const SizedBox(height: 45),

            MainButton(text: "Sign up", onPressed: add),

            const SizedBox(height: 20),

            ButtomAuthText(
              text: "You have account?",
              actionText: "Login",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
