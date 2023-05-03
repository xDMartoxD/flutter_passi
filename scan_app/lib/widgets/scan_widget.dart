import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scan_app/screens/answer_screen.dart';

class ScanWidget extends StatelessWidget {
  const ScanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: MobileScannerController(
        facing: CameraFacing.back,
        detectionSpeed: DetectionSpeed.normal,
        torchEnabled: true,
        detectionTimeoutMs: 1000,
      ),
      onDetect: (capture) {
        final List<Barcode> barcodes = capture.barcodes;
        if (barcodes.isNotEmpty &&
            barcodes.first.format == BarcodeFormat.qrCode &&
            barcodes.first.type == BarcodeType.text &&
            barcodes.first.rawValue != null) {
          final Barcode barcode = barcodes.first;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              settings: const RouteSettings(name: "/answer"),
              builder: (context) {
                return AnswerScreen(value: barcode.rawValue!);
              },
            ),
          );
          // ignore: use_build_context_synchronously
        }
      },
    );
  }
}
