import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helpers/spacing.dart';
import 'package:my_portfolio/core/helpers/strings_manager.dart';
import 'package:my_portfolio/core/helpers/url_luncher.dart';
import 'package:my_portfolio/core/theming/colors.dart';
import 'package:my_portfolio/core/theming/styles.dart';
import 'package:my_portfolio/core/widgets/responsive.dart';
import 'package:my_portfolio/features/home/data/models/projects.dart';

class MyProjects extends StatelessWidget {
  final GlobalKey projectKey;
  const MyProjects({super.key, required this.projectKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: projectKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsManger.projects,
          style: TextStyles.font18BlackBold,
        ),
        verticalSpace(10),
        Responsive(
          desktop: buildGridView(
            itemCount: Projects.myProjectsList.length,
            crossAxisCount: 3,
            childAspectRatio: 1.3,
            itemBuilder: (context, index) => buildMyProjectsWidget(index),
          ),
          mobile: buildGridView(
            itemCount: Projects.myProjectsList.length,
            crossAxisCount: 1,
            childAspectRatio: 0.6,
            itemBuilder: (context, index) => buildMyProjectsWidget(index),
          ),
          tablet: buildGridView(
            itemCount: Projects.myProjectsList.length,
            crossAxisCount: MediaQuery.of(context).size.width < 900 ? 2 : 3,
            childAspectRatio: 1.1,
            itemBuilder: (context, index) => buildMyProjectsWidget(index),
          ),
          mobileLarge: buildGridView(
            itemCount: Projects.myProjectsList.length,
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            itemBuilder: (context, index) => buildMyProjectsWidget(index),
          ),
          mobileFold: buildGridView(
            itemCount: Projects.myProjectsList.length,
            crossAxisCount: 1,
            childAspectRatio: 0.2,
            itemBuilder: (context, index) => buildMyProjectsWidget(index),
          ),
        ),
      ],
    );
  }

  GridView buildGridView({
    required int itemCount,
    required int crossAxisCount,
    required double childAspectRatio,
    required IndexedWidgetBuilder itemBuilder,
  }) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: Projects.myProjectsList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
      ),
      itemBuilder: itemBuilder,
    );
  }

  InkWell buildMyProjectsWidget(int index) {
    return InkWell(
      splashColor: ColorsManager.mainBlue,
      hoverColor: ColorsManager.white,
      onTap: () {
        NavigateToUrl.urlLuncher(
            url: Uri.parse(
          Projects.myProjectsList[index].link,
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsManager.lighterGray,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  Projects.myProjectsList[index].image,
                  fit: BoxFit.contain,
                  height: 100,
                  width: 200,
                ),
              ),
            ),
            verticalSpace(10),
            Text(
              Projects.myProjectsList[index].name,
              style: TextStyles.font16BlackRegular,
            ),
            Text(
              Projects.myProjectsList[index].description,
              style: TextStyles.font14GrayRegular,
            ),
          ],
        ),
      ),
    );
  }
}
