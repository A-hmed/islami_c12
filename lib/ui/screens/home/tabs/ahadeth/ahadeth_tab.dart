import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c12/model/hadeth.dart';
import 'package:islami_c12/ui/screens/hadeth_details/hadeth_details.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_styles.dart';

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      readHadethFile();
    }
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

  Future<void> readHadethFile() async {
    String ahadethFile =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> ahadethList = ahadethFile.split("#\r\n");
    for (int i = 0; i < ahadethList.length; i++) {
      List<String> hadethLines = ahadethList[i].split("\n");
      String hadethName = hadethLines[0];
      hadethLines.removeAt(0);
      String hadethContent = hadethLines.join();
      ahadeth.add(Hadeth(hadethName, hadethContent));
    }
    setState(() {});
  }

  Widget buildContent() {
    return Expanded(
      flex: 7,
      child: Column(
        children: [
          buildDivider(),
          buildTitles(),
          buildDivider(),
          buildAhadethList()
        ],
      ),
    );
  }

  Expanded buildAhadethList() => Expanded(
      child: ListView.builder(
          itemCount: ahadeth.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.pushNamed(context, HadethDetails.routeName,
                      arguments: ahadeth[index]);
                },
                child: Text(
                  ahadeth[index].name,
                  style: AppStyles.regularAccent,
                  textAlign: TextAlign.center,
                ),
              )));

  Widget buildDivider() => const Divider(
        height: 2,
        color: AppColors.primary,
        thickness: 2,
      );

  Expanded buildTopImage() => Expanded(
        flex: 3,
        child: Image.asset(
          AppAssets.ahadethTabLogo,
          fit: BoxFit.fitHeight,
        ),
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
        ],
      );
}
