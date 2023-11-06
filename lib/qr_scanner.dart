import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:mobile_scanner/mobile_scanner_web.dart';
import 'package:qr_code_project/resultscreen.dart';

const bgColor = Color(0xfffafafa);
class QRScanner extends StatefulWidget {
  const QRScanner({super.key});

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  bool isScanCompleted = false;
  void closeScanner() {
    isScanCompleted = false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("QR Scanner",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Place the QR code in the Area",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                     ),
                    ),
                    SizedBox(
                      height: 5
                    ),
                    Text("Scanning will be started automatically",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      )
                    ),
                  ]
                )
            ),
            Expanded(
              flex: 4,
              child: MobileScanner(
                onDetect: (capture){

                  if (!isScanCompleted) {
                    var barcode;
                    String code = barcode.rawValue ?? '---';
                    isScanCompleted = true;
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen(closeScreen: closeScanner, code: code,)));
                  }
                },
              ),
            ),
            Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: const Text("Developed by @devndesignayesha",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1,
                    ),
                  ),
                ),
            ),
          ],
        )
      ),
    );
  }
}
