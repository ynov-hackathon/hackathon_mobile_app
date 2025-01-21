
import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/viewmodels/login_viewmodel.dart';
import 'package:hackathon_mobile_app/viewmodels/product_details_viewmodel.dart';
import 'package:hackathon_mobile_app/views/base.view.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({ super.key });

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProductDetailsViewModel>(
      builder: (context, model, _) {
        return const Placeholder();
      }
    );
  }
}