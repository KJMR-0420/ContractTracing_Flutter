import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  bool _lighton = false;
  bool _fcam = false;
  final GlobalKey _qrKey = GlobalKey();
  QRViewController _controller;

  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller.pauseCamera();
    } else if (Platform.isIOS) {
      _controller.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRView(
            key: _qrKey,
            overlay: QrScannerOverlayShape(borderColor: Colors.white),
            onQRViewCreated: (QRViewController controller) {
              this._controller = controller;
              controller.scannedDataStream.listen((val) {
                if (mounted) {
                  _controller.dispose();
                  Navigator.pop(context, val);
                }
              });
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 60),
              child: Text(
                'Scanner',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  color: Colors.white,
                  icon: Icon(_lighton ? Icons.flash_on : Icons.flash_off),
                  onPressed: () {
                    setState(() {
                      _lighton = !_lighton;
                    });
                    _controller.toggleFlash();
                  },
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(_fcam ? Icons.camera_front : Icons.camera_rear),
                  onPressed: () {
                    setState(() {
                      _fcam = !_fcam;
                    });
                    _controller.flipCamera();
                  },
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
