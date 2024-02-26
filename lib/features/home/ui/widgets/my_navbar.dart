import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helpers/assets_manger.dart';
import 'package:my_portfolio/core/helpers/links_manger.dart';
import 'package:my_portfolio/core/helpers/strings_manager.dart';
import 'package:my_portfolio/core/helpers/url_luncher.dart';
import 'package:my_portfolio/core/theming/styles.dart';
import 'package:my_portfolio/core/widgets/text_button.dart';
import 'package:my_portfolio/features/home/logic/home_screen_logic.dart';

class MyNavbar extends StatelessWidget {
  final ScrollController scrollController;
  final GlobalKey aboutKey;
  final GlobalKey projectsKey;
  final GlobalKey skillsKey;
  final GlobalKey contactKey;
  const MyNavbar({
    super.key,
    required this.scrollController,
    required this.aboutKey,
    required this.projectsKey,
    required this.skillsKey,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AssetsManager.flutterDev),
        const Spacer(),
        _buildNavbarItems(),
      ],
    );
  }

  Widget _buildNavbarItems() {
    return Row(
      children: [
        AppTextButton(
            text: StringsManger.aboutMe,
            style: TextStyles.font14BlackMedium,
            onPressed: () {
              HomeScreenLogic.scrollToAboutMe(
                  aboutMeKey: aboutKey, scrollController: scrollController);
            }),
        AppTextButton(
            text: StringsManger.projects,
            style: TextStyles.font14BlackMedium,
            onPressed: () {
              HomeScreenLogic.scrollToProjects(
                  projectsKey: projectsKey, scrollController: scrollController);
            }),
        AppTextButton(
            text: StringsManger.skills,
            style: TextStyles.font14BlackMedium,
            onPressed: () {
              HomeScreenLogic.scrollToSkills(
                  skillsKey: skillsKey, scrollController: scrollController);
            }),
        AppTextButton(
          text: StringsManger.contact,
          style: TextStyles.font14BlackMedium,
          onPressed: () {
            HomeScreenLogic.scrollToContact(
                contactKey: contactKey, scrollController: scrollController);
          },
        ),
        AppTextButton(
          text: StringsManger.cv,
          style: TextStyles.font14BlackMedium,
          onPressed: () {
            NavigateToUrl.urlLuncher(url: Uri.parse(LinksManger.cv));
          },
        ),
      ],
    );
  }
}
