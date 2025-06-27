import 'package:flutter/material.dart';
import 'package:islamy/ui/model/on_boarding_model.dart';
import 'package:islamy/ui/screens/home/home.dart';
import 'package:islamy/ui/screens/on_boarding/widgets/on_boarding_item.dart';
import 'package:islamy/ui/utils/app_assets.dart';
import 'package:islamy/ui/utils/app_colors.dart';
import 'package:islamy/ui/utils/app_text_style.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              AppAssets.logo,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) =>
                    OnBoardingItem(
                        model: OnBoardingModel.onBoardingContent[index]),
                itemCount: OnBoardingModel.onBoardingContent.length,
              ),
            ),
            // Navigation buttons
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (_currentPage > 0)
                    TextButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text(
                        'Previous',
                        style: AppTextStyle.gold16w700,
                      ),
                    )
                  else
                    const SizedBox(width: 80),
                  // Page indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      OnBoardingModel.onBoardingContent.length,
                          (index) =>
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index
                                  ? AppColors.gold
                                  : AppColors.gold.withOpacity(0.3),
                            ),
                          ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_currentPage <
                          OnBoardingModel.onBoardingContent.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (
                            context) => const Home()));
                      }
                    },
                    child: Text(
                      _currentPage <
                          OnBoardingModel.onBoardingContent.length - 1
                          ? 'Next'
                          : 'Finish',
                      style: AppTextStyle.gold16w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
