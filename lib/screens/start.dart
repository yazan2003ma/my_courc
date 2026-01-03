import 'package:flutter/material.dart';
import 'package:flutter1/screens/login.dart';
import 'package:flutter1/screens/qr.dart';
import 'package:flutter1/screens/signup.dart';
import 'package:flutter1/widgets/BottomAuthText.dart';
import 'package:flutter1/screens/qr.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 60),

          // 📸 Camera Scanner Button
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ScanQr()),
              );
            },
            child: Container(
              height: 360,
              width: 270,
              decoration: BoxDecoration(
                color: const Color.fromARGB(118, 0, 0, 0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.08),
                    spreadRadius: 6,
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Center(
                child: Icon(Icons.camera_alt, size: 100, color: Colors.white),
              ),
            ),
          ),

          const SizedBox(height: 80),

          // 🔐 Login / Signup Card
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

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
        ],
      ),
    );
  }
}
