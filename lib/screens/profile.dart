import 'package:flutter/material.dart';
import 'package:flutter1/model/qrmodel.dart';
import 'package:flutter1/screens/Editprofile.dart';
import 'package:flutter1/screens/home.dart';
import 'package:flutter1/screens/mycode.dart';
import 'package:flutter1/screens/start.dart';
import 'package:flutter1/widgets/screen_templet.dart';
import 'package:flutter1/widgets/main_buttonl.dart';

class Profile extends StatefulWidget {
  const Profile(this.info, {super.key});
  final Userqr info;

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Profile",
      child: Column(
        children: [
          const SizedBox(height: 10),
          CircleAvatar(
            radius: 55,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: AssetImage('img/orange.png'),
          ),

          const SizedBox(height: 25),

          Text(
            widget.info.fullName,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 40),

          MainButton(
            text: "My Codes",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mycode()),
              );
            },
          ),

          const SizedBox(height: 25),

          MainButton(
            text: "Home",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
          ),

          const SizedBox(height: 25),

          MainButton(
            text: "Edit Profile",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Editprofile()),
              );
            },
          ),

          const SizedBox(height: 25),

          MainButton(
            text: "Logout",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Start()),
              );
            },
          ),
        ],
      ),
    );
  }
}
