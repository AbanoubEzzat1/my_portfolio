import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helpers/spacing.dart';
import 'package:my_portfolio/core/theming/colors.dart';
import 'package:my_portfolio/features/home/ui/widgets/about_me.dart';
import 'package:my_portfolio/features/home/ui/widgets/avatar_name_job_title.dart';
import 'package:my_portfolio/features/home/ui/widgets/my_contacts.dart';
import 'package:my_portfolio/features/home/ui/widgets/my_navbar.dart';
import 'package:my_portfolio/features/home/ui/widgets/my_skills.dart';
import 'package:my_portfolio/features/home/ui/widgets/my_projects.dart';

class HomeScreen extends StatelessWidget {
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
          MyNavbar(
            scrollController: scrollController,
            aboutKey: aboutKey,
            projectsKey: projectsKey,
            skillsKey: skillsKey,
            contactKey: contactKey,
          ),
          const Divider(),
          verticalSpace(30),
          const AvatarNameAndJobTitle(),
          verticalSpace(30),
          AboutMe(aboutKey: aboutKey),
          verticalSpace(30),
          MyProjects(projectKey: projectsKey),
          verticalSpace(30),
          MySkills(skillsKey: skillsKey),
          verticalSpace(30),
          MyContacts(contactKey: contactKey),
        ],
      ),
    );
  }
}
