
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
          appBar: AppBar(
            toolbarHeight: 80,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bonjour,',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
                Text(
                  'Utilisateur X!',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BarcodeScannerSimple(),
                    ),
                  ),
                  icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
                ),
              ),
            ],
          ),
          body: ListView.separated(
            padding: const EdgeInsets.all(Spacing.medium),
            itemCount: 3, // Challenges, Recommendations, Leaderboard
            separatorBuilder: (context, index) => const SizedBox(height: Spacing.xLarge),
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return _buildSection(
                    title: 'Quêtes quotidiennes',
                    child: const ChallengesWidget(),
                  );
                case 1:
                  return _buildSection(
                    title: 'Nos suggestions',
                    child: const RecommendationsWidget(),
                  );
                case 2:
                  return _buildSection(
                    title: 'Classement',
                    child: const LeaderboardWidget(),
                  );
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: Spacing.medium),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(Spacing.medium),
            child: child,
          ),
        ),
      ],
    );
  }
}

class RecommendationsWidget extends StatelessWidget {
  const RecommendationsWidget({ super.key });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(width: Spacing.medium),
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[100],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.eco, size: 40, color: Colors.green[700]),
                const SizedBox(height: Spacing.small),
                const Text(
                  'Alternatives',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}