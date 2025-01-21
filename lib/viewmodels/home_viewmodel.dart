// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:hackathon_mobile_app/viewmodels/base.viewmodel.dart';

class HomeViewModel extends BaseViewModel {
  late String scanResult;

  // Future<void> scanCode() async {
  //   String barcodeScanRes;
    
  //   try {
  //     barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
  //       "#ff6666",
  //       "Annuler",
  //       true,
  //       ScanMode.BARCODE
  //     );
  //   } on PlatformException {
  //     barcodeScanRes = "Failed to get platform version";
  //   }
    
  //   debugPrint(barcodeScanRes);
  //   if (!context.mounted) return;
  //   scanResult = barcodeScanRes;
  //   notifyListeners();
  // }
}