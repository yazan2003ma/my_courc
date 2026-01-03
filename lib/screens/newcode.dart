import 'package:flutter/material.dart';
import 'package:flutter1/screens/finish.dart';
import 'package:flutter1/widgets/screen_templet.dart';

class NewCode extends StatefulWidget {
  const NewCode({super.key});

  @override
  State<NewCode> createState() => _NewCodeState();
}

class _NewCodeState extends State<NewCode> {
  final TextEditingController _controller = TextEditingController();
  void _onSave() {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please write something before saving.')),
      );
      return;
    }
    print('Saved text: $text');
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Saved')));
  }

  //  --------------------------   ------------------------------
  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "New code",
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // IconButton(
              //   tooltip: 'Save',
              //   icon: const Icon(Icons.save),
              //   onPressed: _onSave,
              // ),
            ],
          ),

          const SizedBox(height: 4),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(
                      255,
                      14,
                      14,
                      14,
                    ).withOpacity(0.25),
                    blurRadius: 6,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.multiline,
                maxLines: 500,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                decoration: const InputDecoration(
                  hintText: 'Tap to start writing...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                mini: true,
                onPressed: () {
                  // _controller.text += '\n';

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Finish();
                      },
                    ),
                  );
                },
                backgroundColor: Colors.white,
                child: Icon(Icons.add, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
