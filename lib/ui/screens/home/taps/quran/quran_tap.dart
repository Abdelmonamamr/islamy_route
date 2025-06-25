import 'package:flutter/material.dart';
import 'package:islamy/ui/model/sura.dart';
import 'package:islamy/ui/screens/home/taps/quran/most_recent_sura.dart';
import 'package:islamy/ui/utils/app_assets.dart';
import 'package:islamy/ui/utils/app_colors.dart';
import 'package:islamy/ui/utils/app_routs.dart';
import 'package:islamy/ui/utils/app_text_style.dart';
import 'package:islamy/ui/utils/constants.dart';

class QuranTap extends StatefulWidget {
  const QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  List<Sura> filteredSuraList = Constants.suras;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(AppAssets.quranBG),
        fit: BoxFit.fill,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AppAssets.islamyLogo,
            width: 5,
          ),
          BuildSearchTextFiled(),
          SizedBox(
            height: 10,
          ),
          Text(
            'Most Recently',
            style: AppTextStyle.white16w700,
          ),
          MostRecentSura(),
          Text(
            'Sura List',
            style: AppTextStyle.white16w700,
          ),
          BuildSuraListView(),
        ],
      ),
    );
  }

  BuildSearchTextFiled() {
    var border = OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.gold,
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(16)));
    return TextField(
      decoration: InputDecoration(
          prefixIcon: ImageIcon(
            AssetImage(AppAssets.quran),
            color: AppColors.gold,
          ),
          border: border,
          disabledBorder: border,
          focusedBorder: border,
          enabledBorder: border,
          labelText: 'Sura Name',
          labelStyle: AppTextStyle.white16w700),
      onChanged: (query) {
        setState(() {
          filteredSuraList = Constants.suras.where((sura) {
            return sura.nameAr.contains(query) ||
                sura.nameEn.toLowerCase().contains(query.toLowerCase());
          }).toList();
        });
      },
      style: AppTextStyle.white16w700,
      cursorColor: AppColors.white,
    );
  }

  Widget BuildSuraListView() {
    return Expanded(
        child: ListView.separated(
      itemCount: filteredSuraList.length,
      itemBuilder: (context, index) => BulidSuraRow(context, index),
      separatorBuilder: (__, _) => Divider(
        thickness: 2,
        indent: 42,
        endIndent: 42,
      ),
    ));
  }

  Widget BulidSuraRow(BuildContext context, index) {
    var sura = filteredSuraList[index];
    return InkWell(
      onTap: () {
        Navigator.push(context, AppRouts.suraDetails(sura));
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppAssets.numberBackground),
              Text(
                '${sura.suraNum}',
                style: AppTextStyle.white14w700,
              ),
            ],
          ),
          SizedBox(
            width: 24,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${sura.nameEn}',
                  style: AppTextStyle.white20w700,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  '${sura.numVerses} Verses',
                  style: AppTextStyle.white14w700,
                ),
              ],
            ),
          ),
          Text(
            '${sura.nameAr}',
            style: AppTextStyle.white20w700,
          )
        ],
      ),
    );
  }
}
