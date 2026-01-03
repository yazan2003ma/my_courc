import 'package:flutter/material.dart';
import 'package:flutter1/screens/read_only.dart';
import 'package:flutter1/widgets/screen_templet.dart';
import 'package:flutter1/widgets/main_buttonl.dart';
import 'package:share_plus/share_plus.dart';

class Final extends StatelessWidget {
  const Final({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Final",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 20),

            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("img/qr.jpg", height: 175, width: 175),
            ),

            const SizedBox(height: 50),

            MainButton(text: "Share", onPressed: () {}),

            const SizedBox(height: 40),

            MainButton(
              text: "Save",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ReadOnly(text: "Your text here"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
