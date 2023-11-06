import 'package:flutter/material.dart';
import 'package:qr_code_project/qr_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ResultScreen extends StatelessWidget {
  final String code;
  final Function closeScreen;

  const ResultScreen({super.key, required this.closeScreen, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          closeScreen();
          Navigator.pop(context);
        },
            icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black54,
            )),
        centerTitle: true,
        title: const Text("QR Scanner",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            //show QR Code
            Expanded(
              child: QrImageView(
                data: code,
                size: 150,
                version: QrVersions.auto,
              ),
              // child: QrImage(
              //   data: '',
              //   size: 150,
              //   version: QrVersions.auto,
              // ),
            ),

            const Text("Scanned Result",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("$code",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width-100,
              height: 48,
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                  child: const Text("Copy",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),),
            )
          ],
        ),
      )
    );
  }
}
