import 'package:flutter/material.dart';
import 'package:my_portfolio/core/helpers/assets_manger.dart';
import 'package:my_portfolio/core/helpers/links_manger.dart';
import 'package:my_portfolio/core/helpers/spacing.dart';
import 'package:my_portfolio/core/helpers/strings_manager.dart';
import 'package:my_portfolio/core/helpers/url_luncher.dart';
import 'package:my_portfolio/core/theming/colors.dart';
import 'package:my_portfolio/core/theming/styles.dart';

class MyContacts extends StatelessWidget {
  final GlobalKey contactKey;
  const MyContacts({super.key, required this.contactKey});

  @override
  Widget build(BuildContext context) {
    return _buildMyContacts();
  }

  Column _buildMyContacts() {
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
      ],
    );
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
          NavigateToUrl.urlLuncher(url: Uri.parse(url));
        }
      },
      child: buildContactData(image, text, urlText),
    );
  }

  Padding buildContactData(String image, String text, String urlText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(children: [
        Row(children: [
          contactIcon(image),
          horizontalSpace(20),
          contactTitleAndLink(text, urlText)
        ])
      ]),
    );
  }

  Container contactIcon(String image) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorsManager.lighterGray),
      child: Image.asset(image),
    );
  }

  Column contactTitleAndLink(String text, String urlText) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        text,
        style: TextStyles.font16BlackMedium,
      ),
      Text(
        urlText,
        style: TextStyles.font14GrayRegular,
      ),
    ]);
  }
}
