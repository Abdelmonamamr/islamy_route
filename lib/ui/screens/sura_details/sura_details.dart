import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/ui/model/sura.dart';
import 'package:islamy/ui/utils/app_assets.dart';
import 'package:islamy/ui/utils/app_colors.dart';
import 'package:islamy/ui/utils/app_text_style.dart';

class SuraDetails extends StatefulWidget {
  final Sura sura;

  SuraDetails({super.key, required this.sura});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String fileContent = '';

  @override
  void initState() {
    super.initState();
    readSuraFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: AppColors.gold,
        ),
        title: Text(
          '${widget.sura.nameEn}',
          style: AppTextStyle.gold20w700,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(child: Image.asset(AppAssets.liftSuraDetails)),
              Expanded(
                child: Text(
                  '${widget.sura.nameAr}',
                  style: AppTextStyle.gold20w700,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Image.asset(
                  AppAssets.rightSuraDetails,
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                fileContent,
                style: AppTextStyle.gold20w700,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Image.asset(
            AppAssets.downSuraDetails,
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }

  Future<void> readSuraFile() async {
    fileContent =
        await rootBundle.loadString('assets/files/${widget.sura.suraNum}.txt');
    List<String> fileLine = fileContent.split('\n');
    for (int i = 0; i < fileLine.length; i++) {
      fileLine[i] = fileLine[i].trim();
      fileLine[i] += ' [${i + 1}] ';
    }
    fileContent = fileLine.join();
    setState(() {});
  }
}
