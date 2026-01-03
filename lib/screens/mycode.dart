import 'package:flutter/material.dart';
import 'package:flutter1/model/qrmodel.dart';
import 'package:flutter1/screens/profile.dart';
import 'package:flutter1/widgets/screen_templet.dart';

class Mycode extends StatefulWidget {
  const Mycode({super.key});

  @override
  State<Mycode> createState() => _MycodeState();
}

class _MycodeState extends State<Mycode> {
  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "My Code",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile(Userqr())),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.arrow_back,
                  size: 22,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("img/qr.jpg", height: 100, width: 90),
                const SizedBox(width: 15),
                Image.asset("img/qr.jpg", height: 100, width: 90),
              ],
            ),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("img/qr.jpg", height: 100, width: 90),
                const SizedBox(width: 15),
                Image.asset("img/qr.jpg", height: 100, width: 90),
              ],
            ),

            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset("img/qr.jpg", height: 100, width: 90),
                const SizedBox(width: 15),
                Image.asset("img/qr.jpg", height: 100, width: 90),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
