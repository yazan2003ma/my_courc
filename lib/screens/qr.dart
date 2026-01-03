import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanQr extends StatelessWidget {
  const ScanQr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MobileScanner(
        onDetect: (barcodeCapture) {
          final String? code = barcodeCapture.barcodes.first.rawValue;

          if (code != null) {
            Navigator.pop(context);
            print("Scanned Code: $code");
          }
        },
      ),
    );
  }
}
