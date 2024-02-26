import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helpers/assets_manger.dart';
import 'package:my_portfolio/core/helpers/spacing.dart';
import 'package:my_portfolio/core/helpers/strings_manager.dart';
import 'package:my_portfolio/core/theming/colors.dart';
import 'package:my_portfolio/core/theming/styles.dart';

class MyProjects extends StatelessWidget {
  const MyProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsManger.projects,
          style: TextStyles.font18BlackBold,
        ),
        verticalSpace(10),
        SizedBox(
          width: 1000,
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.3,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.5,
            ),
            itemBuilder: (context, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsManager.lighterGray,
                  ),
                  child: Image.asset(
                    AssetsManager.test,
                    fit: BoxFit.cover,
                    // height: 99,
                    // width: 176,
                  ),
                ),
                Text("Randomize", style: TextStyles.font16BlackRegular),
                Text(
                  "A collection of daily UI \ndesign challenges",
                  style: TextStyles.font14GrayRegular,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
