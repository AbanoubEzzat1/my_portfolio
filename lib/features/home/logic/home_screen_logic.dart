import 'package:flutter/material.dart';

class HomeScreenLogic {
  HomeScreenLogic._();
  static void scrollToAboutMe(
      {required GlobalKey aboutMeKey,
      required ScrollController scrollController}) {
    final RenderObject? renderObject =
        aboutMeKey.currentContext!.findRenderObject();
    if (renderObject is RenderBox) {
      final offset = renderObject.localToGlobal(Offset.zero);
      scrollController.animateTo(
        offset.dy, // Scroll to the y-coordinate of the target widget
        duration: const Duration(
            milliseconds: 500), // Set the duration of the animation
        curve: Curves.easeInOut, // Apply easing curve to the animation
      );
    }
  }

  static void scrollToProjects(
      {required GlobalKey projectsKey,
      required ScrollController scrollController}) {
    final RenderObject? renderObject =
        projectsKey.currentContext!.findRenderObject();
    if (renderObject is RenderBox) {
      final offset = renderObject.localToGlobal(Offset.zero);
      scrollController.animateTo(
        offset.dy,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  static void scrollToSkills(
      {required GlobalKey skillsKey,
      required ScrollController scrollController}) {
    final RenderObject? renderObject =
        skillsKey.currentContext!.findRenderObject();
    if (renderObject is RenderBox) {
      final offset = renderObject.localToGlobal(Offset.zero);
      scrollController.animateTo(
        offset.dy,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  static void scrollToContact(
      {required GlobalKey contactKey,
      required ScrollController scrollController}) {
    final RenderObject? renderObject =
        contactKey.currentContext!.findRenderObject();
    if (renderObject is RenderBox) {
      final offset = renderObject.localToGlobal(Offset.zero);
      scrollController.animateTo(
        offset.dy,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }
}

  // void _scrollToAboutMe({required GlobalKey aboutMeKey}) {
  //   // Scroll to the specified widget with animation
  //   Scrollable.ensureVisible(
  //     aboutMeKey.currentContext!,
  //   );
  // }