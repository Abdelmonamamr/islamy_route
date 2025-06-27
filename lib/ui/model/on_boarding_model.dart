import 'package:islamy/ui/utils/app_assets.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String? supTitle;

  OnBoardingModel({
    required this.image,
    required this.title,
    this.supTitle,
  });

  static List<OnBoardingModel> onBoardingContent = [
    OnBoardingModel(image: AppAssets.on1, title: 'Welcome To Islmi App'),
    OnBoardingModel(
        image: AppAssets.on2,
        title: 'Welcome To Islami',
        supTitle: 'We Are Very Excited To Have You In Our Community'),
    OnBoardingModel(
        image: AppAssets.on3,
        title: 'Reading the Quran',
        supTitle: 'Read, and your Lord is the Most Generous'),
    OnBoardingModel(
        image: AppAssets.on4,
        title: 'Bearish',
        supTitle: 'Praise the name of your Lord, the Most High'),
    OnBoardingModel(
        image: AppAssets.on5,
        title: 'Holy Quran Radio',
        supTitle:
        'You can listen to the Holy Quran Radio through the application for free and easily'),
  ];
}
