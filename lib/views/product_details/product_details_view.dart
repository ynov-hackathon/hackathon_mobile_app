
import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/theme/colors.dart';
import 'package:hackathon_mobile_app/viewmodels/login_viewmodel.dart';
import 'package:hackathon_mobile_app/viewmodels/product_details_viewmodel.dart';
import 'package:hackathon_mobile_app/views/base.view.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class ProductDetailsView extends StatefulWidget {
  final Product? product;

  const ProductDetailsView({
    super.key,
    required this.product
  });

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  Color _getBinColor() {

    final weight = widget.product!.quantity!.split(' ').firstOrNull;
    if (weight != null && double.tryParse(weight)! > 500) {
      return AppColors.yellowBin;
    }
    return AppColors.blueBin;
  }

  Widget _buildInfoSection(String title, Widget content) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildNutritionRow(String label, double? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value != null ? '${value.toStringAsFixed(2)}g' : 'N/A'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    
    return BaseView<ProductDetailsViewModel>(
      builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text('Détails du produit'),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                AspectRatio(
                  aspectRatio: 16/9,
                  child: Container(
                    decoration: BoxDecoration(
                      image: widget.product!.imageFrontUrl != null 
                          ? DecorationImage(
                              image: NetworkImage(widget.product!.imageFrontUrl!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                  ),
                ),

                // Product Name and Brand
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product!.productName ?? 'Produit inconnu',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.product!.brands ?? 'Marque inconnue',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),

                // Recycling Information
                _buildInfoSection(
                  'Recyclage',
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: _getBinColor().withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: _getBinColor()),
                        const SizedBox(width: 8),
                        Text(
                          'Poubelle ${_getBinColor() == Colors.blue ? 'Bleue' 
                            : _getBinColor() == Colors.green ? 'Verte' 
                            : 'Jaune'}',
                          style: TextStyle(
                            color: _getBinColor(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Quantity
                _buildInfoSection(
                  'Quantité',
                  Text(product?.quantity ?? 'N/A'),
                ),

                // Nutritional Information
                _buildInfoSection(
                  'Valeurs nutritionnelles (pour 100g)',
                  Column(
                    children: [
                      _buildNutritionRow(
                        'Sel',
                        product?.nutriments?.getValue(Nutrient.salt, PerSize.oneHundredGrams),
                      ),
                      _buildNutritionRow(
                        'Sucre',
                        product?.nutriments?.getValue(Nutrient.sugars, PerSize.oneHundredGrams),
                      ),
                      _buildNutritionRow(
                        'Matières grasses',
                        product?.nutriments?.getValue(Nutrient.fat, PerSize.oneHundredGrams),
                      ),
                    ],
                  ),
                ),

                // Additives
                _buildInfoSection(
                  'Additifs',
                  Wrap(
                    spacing: 8,
                    children: (product?.additives?.names ?? [])
                        .map((additive) => Chip(
                              label: Text(additive),
                              backgroundColor: Colors.orange[100],
                            ))
                        .toList(),
                  ),
                ),

                // Allergens
                _buildInfoSection(
                  'Allergènes',
                  Wrap(
                    spacing: 8,
                    children: (product?.allergens?.names ?? [])
                        .map((allergen) => Chip(
                              label: Text(allergen),
                              backgroundColor: Colors.red[100],
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}