import 'package:flutter/material.dart';
import 'package:islami_c12/model/sura_details_args.dart';
import 'package:islami_c12/ui/screens/sura_details/sura_details.dart';
import 'package:islami_c12/ui/utils/app_assets.dart';
import 'package:islami_c12/ui/utils/app_colors.dart';
import 'package:islami_c12/ui/utils/app_constants.dart';
import 'package:islami_c12/ui/utils/app_styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildTopImage(),
        const SizedBox(
          height: 8,
        ),
        buildContent(),
      ],
    );
  }

  Widget buildContent() {
    return Expanded(
      flex: 7,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              buildDivider(),
              buildTitles(),
              buildDivider(),
              buildSurasList()
            ],
          ),
          const VerticalDivider(
            color: AppColors.primary,
            thickness: 2,
          ),
        ],
      ),
    );
  }

  Expanded buildSurasList() => Expanded(
      child: ListView.builder(
          itemCount: Constants.suraNames.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SuraDetails.routeName,
                      arguments: SuraDetailsArgs(
                          suraName: Constants.suraNames[index],
                          fileName: "${index + 1}.txt"));
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        Constants.suraNames[index],
                        style: AppStyles.regularAccent,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                        child: Text(
                      Constants.versesNumber[index].toString(),
                      style: AppStyles.regularAccent,
                      textAlign: TextAlign.center,
                    ))
                  ],
                ),
              )));

  Widget buildDivider() => const Divider(
        height: 2,
        color: AppColors.primary,
        thickness: 2,
      );

  Expanded buildTopImage() => Expanded(
        flex: 3,
        child: Image.asset(AppAssets.quranTabLogo),
      );

  buildTitles() => Row(
        children: [
          Expanded(
            child: Text(
              "Name",
              style: AppStyles.semiBoldAccent,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              child: Text(
            "Verses",
            style: AppStyles.semiBoldAccent,
            textAlign: TextAlign.center,
          ))
        ],
      );
}
