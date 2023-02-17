import 'package:flutter/widgets.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanWidget extends StatelessWidget {
  const ScanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: MobileScannerController(
        facing: CameraFacing.back,
      ),
      onDetect: (capture) async {
        final List<Barcode> barcodes = capture.barcodes;
        if (barcodes.isNotEmpty &&
            barcodes.first.format == BarcodeFormat.qrCode &&
            barcodes.first.type == BarcodeType.text &&
            barcodes.first.rawValue != null) {
          final Barcode barcode = barcodes.first;
          await _checkBarcode(barcode.rawValue!);
        }
      },
    );
  }
}

Future<bool> _checkBarcode(String barcodeValue) async {
  return false;
}
