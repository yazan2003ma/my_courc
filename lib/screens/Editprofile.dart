import 'package:flutter/material.dart';
import 'package:flutter1/model/qrdatabase.dart';
import 'package:flutter1/widgets/screen_templet.dart';
import 'package:flutter1/widgets/main_buttonl.dart';
import 'package:flutter1/widgets/text_field_custom.dart';
import 'package:provider/provider.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void saveChanges() async {
    if (!_formKey.currentState!.validate()) return;

    final db = context.read<AppDatabase>();

    // ⚠️ مؤقتاً (لحد ما تعمل session / currentUser)
    final user = db.allUsers.first;

    if (emailController.text.isNotEmpty) {
      user.email = emailController.text.trim();
    }

    if (passwordController.text.isNotEmpty) {
      user.password = passwordController.text.trim();
    }

    await db.updateUser(user);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profile updated successfully"),
        backgroundColor: Colors.green,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Edit Profile",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 90),

              CustomTextField(
                hint: "New Email",
                controller: emailController,
                Errormsg: null,
                validator: (value) {
                  if (value == null || value.isEmpty) return null;
                  if (!value.contains('@')) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              CustomTextField(
                hint: "New Password",
                controller: passwordController,
                Errormsg: null,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) return null;
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 50),

              MainButton(text: "Save Changes", onPressed: saveChanges),
            ],
          ),
        ),
      ),
    );
  }
}
