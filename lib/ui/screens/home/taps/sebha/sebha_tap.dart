import 'package:flutter/material.dart';
import 'package:islamy/ui/utils/app_assets.dart';
import 'package:islamy/ui/utils/app_text_style.dart';

class SebhaTap extends StatefulWidget {
  const SebhaTap({super.key});

  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  double angle = 0;
  List<String> sebhaText = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
  ];

  int index = 0;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      // padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.sephaBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        spacing: 16,
        children: [
          Image.asset(
            AppAssets.logo,
          ),
          Text(
            'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
            style: AppTextStyle.white32w700,
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                const Row(),
                Image.asset(
                  AppAssets.sephaHead,
                  width: width * 0.5,
                ),
                Positioned(
                    top: MediaQuery.sizeOf(context).height * 0.12,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _toSebhaClick();
                          },
                          child: Transform.rotate(
                              angle: angle,
                              child: Image.asset(
                                AppAssets.sephaBody,
                                width: width * 0.8,
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(sebhaText[index],
                                style: AppTextStyle.white32w700),
                            SizedBox(
                              height: 16,
                            ),
                            Text(count.toString(),
                                style: AppTextStyle.white32w700),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toSebhaClick() {
    angle += 16;
    count++;
    if (count == 33) {
      count = 0;
      index++;
      if (index == sebhaText.length) {
        index = 0;
      }
    }
    setState(() {});
  }
}
