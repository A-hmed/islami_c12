import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c12/model/sura_details_args.dart';
import 'package:islami_c12/ui/utils/app_assets.dart';
import 'package:islami_c12/ui/utils/app_colors.dart';
import 'package:islami_c12/ui/utils/app_styles.dart';
import 'package:islami_c12/ui/widgets/app_bar.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura_details";

  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String suraContent = "";

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (suraContent.isEmpty) {
      readFileContent(args.fileName);
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.mainBackground))),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: buildAppBar(),
        body: suraContent.isEmpty
            ? buildLoader()
            : SingleChildScrollView(
                child: Text(
                  suraContent,
                  textDirection: TextDirection.rtl,
                  style: AppStyles.semiBoldAccent,
                ),
              ),
      ),
    );
  }

  Center buildLoader() => Center(child: CircularProgressIndicator());

  void readFileContent(String fileName) async {
    suraContent = await rootBundle.loadString("assets/files/$fileName");
    List<String> suraLines = suraContent.split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      if (suraLines[i].isNotEmpty) suraLines[i] += "{${i + 1}}";
    }
    suraContent = suraLines.join();
    setState(() {});
  }
}
