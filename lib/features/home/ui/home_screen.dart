import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helpers/assets_manger.dart';
import 'package:my_portfolio/core/helpers/links_manger.dart';
import 'package:my_portfolio/core/helpers/spacing.dart';
import 'package:my_portfolio/core/helpers/strings_manager.dart';
import 'package:my_portfolio/core/theming/colors.dart';
import 'package:my_portfolio/core/theming/styles.dart';
import 'package:my_portfolio/core/widgets/text_button.dart';
import 'package:my_portfolio/features/home/data/models/skills.dart';
import 'package:my_portfolio/features/home/logic/home_screen_logic.dart';
import 'package:my_portfolio/features/home/ui/widgets/projects.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  // Define scroll controllers and keys for each section to navigate to
  final ScrollController scrollController = ScrollController();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
          child: SingleChildScrollView(
        controller: scrollController,
        child: _buildHomeScreen(),
      )),
    );
  }

  Widget _buildHomeScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNavbar(),
          const Divider(),
          verticalSpace(30),
          _buildAvatarNamePosition(),
          _buildAboutMe(aboutMeKey: aboutKey),
          verticalSpace(30),
          _buildMyProjects(projectKey: projectsKey),
          verticalSpace(30),
          _mySkillsWidget(skillsKey: skillsKey),
          verticalSpace(30),
          _buildMyContacts(contactKey: contactKey),
        ],
      ),
    );
  }

  Widget _buildMyContacts({required GlobalKey contactKey}) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        key: contactKey,
        children: [
          Text(
            StringsManger.contact,
            style: TextStyles.font18BlackBold,
          ),
          verticalSpace(10),
          _myContacts(
            image: AssetsManager.email,
            text: StringsManger.email,
            urlText: StringsManger.myEmail,
            url: LinksManger.emileUrl,
          ),
          _myContacts(
            image: AssetsManager.phone,
            text: StringsManger.phone,
            urlText: StringsManger.myPhone,
            url: LinksManger.phoneUrl,
          ),
          _myContacts(
            image: AssetsManager.linkedIn,
            text: StringsManger.linkedIn,
            urlText: StringsManger.mylinkedIn,
            url: LinksManger.linkedInUrl,
          ),
          _myContacts(
            image: AssetsManager.github,
            text: StringsManger.github,
            urlText: StringsManger.myGithub,
            url: LinksManger.gitHubUrl,
          ),
        ]);
  }

  Future<void> _launchUrl({required Uri url}) async {
    if (await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _myContacts(
      {required String image,
      required String text,
      required String urlText,
      String? url}) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: ColorsManager.lightBlue,
      onTap: () {
        if (url != null) {
          _launchUrl(url: Uri.parse(url));
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(children: [
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
                urlText,
                style: TextStyles.font14GrayRegular,
              ),
            ])
          ])
        ]),
      ),
    );
  }

  Column _mySkillsWidget({required GlobalKey skillsKey}) {
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

  Widget _buildAboutMe({required GlobalKey aboutMeKey}) {
    return Column(
      key: aboutMeKey,
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

  Widget _buildMyProjects({required GlobalKey projectKey}) {
    return Container(key: projectKey, child: const MyProjects());
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
      ],
    );
  }
}
