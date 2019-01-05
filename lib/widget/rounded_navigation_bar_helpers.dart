import 'package:flutter/material.dart';

void combineController({
  @required TabController controller,
  @required PageController pageController,
}) {
  final VoidCallback controlListener = () async {
    await pageController.animateToPage(controller.index,
        duration: Duration(milliseconds: 400), curve: Curves.decelerate);

    // jump to exact page because animation finished not completed like expected
    pageController.jumpToPage(pageController.page.round());
  };

  final VoidCallback pageControlListener = () {
    final double offset = pageController.page - controller.index;

    print(offset);

    void animateTo(int index) =>
        controller.animateTo(index, duration: Duration(milliseconds: 0));

    if (!controller.indexIsChanging) {
      if (offset >= 0.99) {
        animateTo(controller.index + 1);
      } else if (offset <= -0.99) {
        animateTo(controller.index - 1);
      } else {
        controller.offset = offset;
      }
    }
  };

  controller.addListener(controlListener);
  pageController.addListener(pageControlListener);
}
