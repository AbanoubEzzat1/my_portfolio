import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helpers/assets_manger.dart';
import 'package:my_portfolio/core/helpers/spacing.dart';
import 'package:my_portfolio/core/helpers/strings_manager.dart';
import 'package:my_portfolio/core/theming/colors.dart';
import 'package:my_portfolio/core/theming/styles.dart';
import 'package:my_portfolio/core/widgets/text_button.dart';
import 'package:my_portfolio/features/home/ui/widgets/projects.dart';

class HomeScreen extends StatelessWidget {
  final List<String> mySkills = ["Flutter", "Dart", "Firebase", "API"];
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNavbar(),
              const Divider(),
              verticalSpace(30),
              _buildAvatarNamePosition(),
              _buildAboutMe(),
              verticalSpace(30),
              const MyProjects(),
              verticalSpace(30),
              _mySkillsWidget(),
              verticalSpace(30),
              Text(
                StringsManger.contact,
                style: TextStyles.font18BlackBold,
              ),
              verticalSpace(10),
              _buildMyContacts(),
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildMyContacts() {
    return Column(children: [
      _myContacts(
        image: AssetsManager.email,
        text: StringsManger.email,
        url: StringsManger.myEmail,
      ),
      _myContacts(
        image: AssetsManager.linkedIn,
        text: StringsManger.linkedIn,
        url: StringsManger.mylinkedIn,
      ),
      _myContacts(
        image: AssetsManager.linkedIn,
        text: StringsManger.github,
        url: StringsManger.myGithub,
      ),
    ]);
  }

  Column _myContacts(
      {required String image, required String text, required String url}) {
    return Column(children: [
      Row(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsManager.lighterGray),
          child: Image.asset(image),
        ),
        horizontalSpace(20),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            text,
            style: TextStyles.font16BlackMedium,
          ),
          Text(
            url,
            style: TextStyles.font14GrayRegular,
          ),
        ])
      ])
    ]);
  }

  Column _mySkillsWidget() {
    return Column(
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
      label: Text(label, style: TextStyles.font14BlackMedium),
    );
  }

  Widget _buildAboutMe() {
    return Column(
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

  Widget _buildAvatarNamePosition() {
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

  Row _buildNavbar() {
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
        ),
        AppTextButton(
          text: StringsManger.projects,
          style: TextStyles.font14BlackMedium,
        ),
        AppTextButton(
          text: StringsManger.skills,
          style: TextStyles.font14BlackMedium,
        ),
        AppTextButton(
          text: StringsManger.contact,
          style: TextStyles.font14BlackMedium,
        ),
      ],
    );
  }
}
