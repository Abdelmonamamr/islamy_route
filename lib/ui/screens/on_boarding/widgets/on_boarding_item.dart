import 'package:flutter/material.dart';
import 'package:islamy/ui/model/on_boarding_model.dart';
import 'package:islamy/ui/utils/app_colors.dart';
import 'package:islamy/ui/utils/app_text_style.dart';

class OnBoardingItem extends StatelessWidget {
  OnBoardingModel model;

  OnBoardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              model.image,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  model.title,
                  style: AppTextStyle.gold24w700,
                  textAlign: TextAlign.center,
                ),
                if (model.supTitle != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    model.supTitle!,
                    style: AppTextStyle.gold16w400,
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
