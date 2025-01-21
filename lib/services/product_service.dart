import 'package:hackathon_mobile_app/app_locator.dart';
import 'package:hackathon_mobile_app/services/base.service.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

/// A service class for fetching product information using a barcode.
/// 
/// This class interacts with the OpenFoodFacts API to retrieve product details
/// based on a provided barcode.
class ProductService extends BaseService {
  ProductService() {
    OpenFoodAPIConfiguration.userAgent = UserAgent(name: 'Recycly');
  }

  /// Fetches product information using a barcode.
  /// 
  /// [barcode]: The barcode of the product to fetch.
  /// 
  /// Returns a [Product] object containing the product details.
  /// 
  /// Throws an [Exception] if the product is not found or if the API request fails.
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
