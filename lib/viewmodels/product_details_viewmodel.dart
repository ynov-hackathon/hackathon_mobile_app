import 'package:hackathon_mobile_app/app_locator.dart';
import 'package:hackathon_mobile_app/services/product_service.dart';
import 'package:hackathon_mobile_app/viewmodels/base.viewmodel.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class ProductDetailsViewModel extends BaseViewModel {
  Future<Product> getProductDetails(String barcode) async {
    return await locator<ProductService>().getProductInfos(barcode: barcode);    
  }
}