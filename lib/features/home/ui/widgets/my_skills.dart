import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helpers/spacing.dart';
import 'package:my_portfolio/core/helpers/strings_manager.dart';
import 'package:my_portfolio/core/theming/colors.dart';
import 'package:my_portfolio/core/theming/styles.dart';
import 'package:my_portfolio/features/home/data/models/skills.dart';

class MySkills extends StatelessWidget {
  final GlobalKey skillsKey;
  const MySkills({super.key, required this.skillsKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: skillsKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsManger.skills,
          style: TextStyles.font18BlackBold,
        ),
        verticalSpace(10),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: mySkills.map((e) {
            return _buildMysSkills(label: e);
          }).toList(),
        ),
      ],
    );
  }

  Chip _buildMysSkills({required String label}) {
    return Chip(
      backgroundColor: ColorsManager.lightGray,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      label: Text(label, style: TextStyles.font14BlackMedium),
    );
  }
}
