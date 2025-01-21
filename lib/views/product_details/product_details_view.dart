
import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/viewmodels/login_viewmodel.dart';
import 'package:hackathon_mobile_app/viewmodels/product_details_viewmodel.dart';
import 'package:hackathon_mobile_app/views/base.view.dart';

class ProductDetailsView extends StatefulWidget {
  final String? brand;
  final String? productName;
  final String? imageUrl;

  const ProductDetailsView({
    super.key,
    required this.brand,
    required this.productName,
    required this.imageUrl
  });

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProductDetailsViewModel>(
      builder: (context, model, _) {
        return Scaffold(
          body: Column(
            children: [
              Text("${widget.brand}, ${widget.productName}, ${widget.imageUrl}")
            ],
          ),
        );
      }
    );
  }
}