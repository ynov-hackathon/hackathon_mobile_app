import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/viewmodels/startup_viewmodel.dart';
import 'package:hackathon_mobile_app/views/base.view.dart';

class StartupView extends StatefulWidget {
  const StartupView({ super.key });

  @override
  _StartupViewState createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<StartupViewModel>(
      builder: (context, model, _) {
        return const Placeholder();
      }
    );
  }
}