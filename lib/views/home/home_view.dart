
import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/theme/sizes.dart';
import 'package:hackathon_mobile_app/viewmodels/home_viewmodel.dart';
import 'package:hackathon_mobile_app/viewmodels/login_viewmodel.dart';
import 'package:hackathon_mobile_app/views/base.view.dart';
import 'package:hackathon_mobile_app/views/common/buttons.dart';
import 'package:hackathon_mobile_app/views/home/widgets/barcode_scanner_simple.dart';
import 'package:hackathon_mobile_app/views/home/widgets/challenges_widget.dart';
import 'package:hackathon_mobile_app/views/home/widgets/leaderboard_widget.dart';
import 'package:hackathon_mobile_app/views/home/widgets/qr_code_widget.dart';

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
        return Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: Spacing.large, horizontal: Spacing.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const BarcodeScannerSimple(),
                        ),
                      ),
                      icon: const Icon(Icons.qr_code_scanner_sharp)
                    ),
                  ],
                ),
                
                const SizedBox(height: Spacing.medium),
                const ChallengesWidget(),
                const SizedBox(height: Spacing.medium),
                const LeaderboardWidget()                            
              ],
            )
          ),
        );
      }
    );
  }
}