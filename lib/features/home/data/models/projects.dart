import 'package:my_portfolio/core/helpers/assets_manger.dart';
import 'package:my_portfolio/core/helpers/links_manger.dart';
import 'package:my_portfolio/core/helpers/strings_manager.dart';

class Projects {
  final String name;
  final String description;
  final String image;
  final String link;
  Projects({
    required this.name,
    required this.description,
    required this.image,
    required this.link,
  });

  static final List<Projects> myProjectsList = [
    Projects(
      name: StringsManger.fitSnap,
      description: StringsManger.fitSnapDescription,
      image: AssetsManager.fitSnap,
      link: LinksManger.fitSnap,
    ),
    Projects(
      name: StringsManger.habitUp,
      description: StringsManger.habitUpDescription,
      image: AssetsManager.habitUp,
      link: LinksManger.habitUp,
    ),
    Projects(
      name: StringsManger.randomize,
      description: StringsManger.randomizeDescription,
      image: AssetsManager.randomize,
      link: LinksManger.randomize,
    ),
  ];
}
