import 'package:flutter/material.dart';
import 'package:islami_c12/model/hadeth.dart';
import 'package:islami_c12/ui/utils/app_assets.dart';
import 'package:islami_c12/ui/utils/app_colors.dart';
import 'package:islami_c12/ui/utils/app_styles.dart';
import 'package:islami_c12/ui/widgets/app_bar.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = "hadeth_details";

  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.mainBackground))),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: buildAppBar(hadeth.name),
        body: SingleChildScrollView(
          child: Text(
            hadeth.content,
            textDirection: TextDirection.rtl,
            style: AppStyles.semiBoldAccent,
          ),
        ),
      ),
    );
  }

  Center buildLoader() => Center(child: CircularProgressIndicator());
}
