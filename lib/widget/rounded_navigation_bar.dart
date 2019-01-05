import 'package:flutter/material.dart';

class RoundedNavigationBar extends StatelessWidget {
  final List<Tab> tabs;
  final TabController controller;
  final Color selectedColor;
  final Color unselectedColor;

  static const BorderRadius radius =
      BorderRadius.vertical(top: Radius.circular(16.0));

  const RoundedNavigationBar({
    @required this.tabs,
    @required this.controller,
    this.selectedColor,
    this.unselectedColor,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedColor =
        this.selectedColor ?? Theme.of(context).indicatorColor;
    final unselectedColor = this.unselectedColor ??
        Theme.of(context).textTheme.caption.color.withOpacity(0.35);

    return _hideInkWell(
      child: topBorder(
        radius: radius,
        child: TabBar(
          controller: controller,
          tabs: tabs,
          labelColor: selectedColor,
          unselectedLabelColor: unselectedColor,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: UnderlineTabIndicator(
            insets: EdgeInsets.only(bottom: 44.0),
            borderSide: BorderSide(color: selectedColor, width: 4.0),
          ),
        ),
      ),
    );
  }

  Widget _hideInkWell({Widget child}) => Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: child,
      );

  Widget topBorder({@required Widget child, BorderRadius radius}) => Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          boxShadow: [BoxShadow(color: Colors.grey[400], blurRadius: 4.0)],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: radius,
            boxShadow: [BoxShadow(color: Colors.grey[400])],
          ),
          child: child,
        ),
      );
}
