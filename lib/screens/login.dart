import 'package:flutter/material.dart';
import 'package:flutter1/model/qrdatabase.dart';
import 'package:flutter1/screens/profile.dart';
import 'package:flutter1/screens/signup.dart';
import 'package:flutter1/widgets/BottomAuthText.dart';
import 'package:flutter1/widgets/main_buttonl.dart';
import 'package:flutter1/widgets/screen_templet.dart';
import 'package:flutter1/widgets/text_field_custom.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void login() async {
    final email = emailController.text.trim();
    final password = passController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter email and password")),
      );
      return;
    }

    final db = context.read<AppDatabase>();
    final user = await db.fetchByEmail(email);

    if (user == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("User not found")));
    } else if (user.password != password) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Incorrect password")));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile(user)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Login",
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 30),

            // QR logo
            Icon(Icons.qr_code_2, size: 150, color: Colors.white),

            const SizedBox(height: 30),

            CustomTextField(
              hint: "Email",
              controller: emailController,
              Errormsg: emailController.text,
            ),
            const SizedBox(height: 15),

            CustomTextField(
              hint: "Password",
              controller: passController,
              isPassword: true,
              Errormsg: passController.text,
            ),

            const SizedBox(height: 30),

            MainButton(text: "Login", onPressed: login),

            const SizedBox(height: 40),

            ButtomAuthText(
              text: "Don't have account?",
              actionText: "Sign up",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
