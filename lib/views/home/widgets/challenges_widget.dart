import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/theme/colors.dart';
import 'package:hackathon_mobile_app/theme/sizes.dart';
import 'package:hackathon_mobile_app/views/common/buttons.dart';

class ChallengesWidget extends StatelessWidget {
const ChallengesWidget({ super.key });

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Défis quotidiens",
          style: TextStyle(fontSize: FontSizes.bodyMedium, color: Colors.black)
        ),
        const SizedBox(height: Spacing.medium),
        SizedBox(
          width: 350,
          height: 160,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 3,
            itemBuilder: (context, index) {
              return CustomFilledButton(
                onPressed: (){},
                style: FilledButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.small),
                  backgroundColor: AppColors.blue,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(Radii.large)))),
                child: Text("$index. Scannez ${index + 2} articles"),
                );
            }
          ),
        )
      ]
    );
  }
}