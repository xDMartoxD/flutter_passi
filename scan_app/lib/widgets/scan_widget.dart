import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:scan_app/providers/event_provider.dart';
import 'package:scan_app/services/validate_ticket_service.dart';

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
          String ans = await validateTicket(
              ticketId: barcode.rawValue!,
              eventId: context.read<EventState>().event);
          if (!context.mounted) {
            return;
          }
          _processResult(ans, context);
        }
      },
    );
  }

  void _processResult(String ans, BuildContext context) {
    if (ans == "ERROR") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Error validating ticket'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text('Ticket is valid $ans'),
        ),
      );
    }
  }
}
