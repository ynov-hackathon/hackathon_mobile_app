
import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/viewmodels/home_view.dart';
import 'package:hackathon_mobile_app/viewmodels/login_viewmodel.dart';
import 'package:hackathon_mobile_app/views/base.view.dart';

class HomeView extends StatefulWidget {
  const HomeView({ super.key });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      builder: (context, model, _) {
        return const Placeholder();
      }
    );
  }
}