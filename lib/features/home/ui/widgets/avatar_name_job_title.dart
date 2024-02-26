import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helpers/assets_manger.dart';
import 'package:my_portfolio/core/helpers/spacing.dart';
import 'package:my_portfolio/core/helpers/strings_manager.dart';
import 'package:my_portfolio/core/theming/styles.dart';

class AvatarNameAndJobTitle extends StatelessWidget {
  const AvatarNameAndJobTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        const CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(AssetsManager.me),
        ),
        verticalSpace(10),
        Text(StringsManger.me, style: TextStyles.font18BlackBold),
        Text(StringsManger.flutterDev, style: TextStyles.font16GrayRegular),
      ]),
    );
  }
}
