import 'package:flutter/material.dart';
import 'package:flutter1/screens/final.dart';
import 'package:flutter1/widgets/screen_templet.dart';
import 'package:flutter1/widgets/text_field_custom.dart';
import 'package:flutter1/widgets/main_buttonl.dart';

class Finish extends StatefulWidget {
  const Finish({super.key});

  @override
  State<Finish> createState() => _FinishState();
}

class _FinishState extends State<Finish> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool canEdit = false;

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Finish",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            CustomTextField(
              hint: "Title of code",
              controller: titleController,
              Errormsg: "",
            ),

            const SizedBox(height: 30),
            CustomTextField(
              hint: "Password",
              controller: passwordController,
              isPassword: true,
              Errormsg: "",
            ),

            const SizedBox(height: 30),

            // Permission
            const Text(
              "Permission ?(Can Edit)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 16),

            //Permission
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        canEdit = true;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: canEdit ? Colors.black : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          "Yes",
                          style: TextStyle(
                            color: canEdit ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        canEdit = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: !canEdit ? Colors.black : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          "No",
                          style: TextStyle(
                            color: !canEdit ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),
            Center(
              child: MainButton(
                text: "Create code",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Final()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
