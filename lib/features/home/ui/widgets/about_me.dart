import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helpers/spacing.dart';
import 'package:my_portfolio/core/helpers/strings_manager.dart';
import 'package:my_portfolio/core/theming/styles.dart';

class AboutMe extends StatelessWidget {
  final GlobalKey aboutKey;
  const AboutMe({super.key, required this.aboutKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: aboutKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsManger.aboutMe,
          style: TextStyles.font18BlackBold,
        ),
        verticalSpace(10),
        Text(
          StringsManger.aboutmeDescription,
          style: TextStyles.font16BlackRegular,
        ),
      ],
    );
  }
}
