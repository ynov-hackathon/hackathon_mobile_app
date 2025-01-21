import 'package:hackathon_mobile_app/app_locator.dart';
import 'package:hackathon_mobile_app/services/base.service.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class ProductService extends BaseService {
  ProductService();

  Future<Product> getProductInfos({
    required String barcode
  }) async {
    final ProductQueryConfiguration configuration = ProductQueryConfiguration(
      barcode,
      language: OpenFoodFactsLanguage.GERMAN,
      fields: [ProductField.ALL],
      version: ProductQueryVersion.v3,
    );
    final ProductResultV3 result = await OpenFoodAPIClient.getProductV3(configuration);
  
    if (result.status == ProductResultV3.statusSuccess) {
      return result.product!;
    } else {
      throw Exception('Produit introuvable !');
    }
  }
}
