import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/theme/sizes.dart';
import 'package:hackathon_mobile_app/views/common/buttons.dart';

class LeaderboardWidget extends StatelessWidget {
const LeaderboardWidget({ super.key });

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Classement",
          style: TextStyle(fontSize: FontSizes.bodyMedium, color: Colors.black)
        ),
        const SizedBox(height: Spacing.medium),
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Radii.large),
              border: Border.all(color: Colors.black, width: 0.6)
            ),
            width: MediaQuery.sizeOf(context).width * 0.8,
            height: 180,
            padding: const EdgeInsets.symmetric(vertical: Spacing.small, horizontal: Spacing.large),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: Spacing.medium),
                      child: Text(
                        "${index + 1}. Utilisateur A",
                        style: const TextStyle(fontSize: FontSizes.bodyLarge)
                      ),
                    ),

                    Text("${3-index}/3")
                  ],
                );
              }
            )
          ),
        )
      ]
    );
  }
}