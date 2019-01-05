import 'package:flutter/material.dart';
import 'package:january2_navigation_bar_challenge/widget/rounded_navigation_bar.dart';
import 'package:january2_navigation_bar_challenge/widget/rounded_navigation_bar_helpers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appTitle = 'NavigationBarChallenge';
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primaryColor: Colors.deepOrange,
          indicatorColor: Colors.red,
        ),
        home: MainPage(appTitle: appTitle),
      );
}

class MainPage extends StatefulWidget {
  final String appTitle;

  const MainPage({this.appTitle});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> with TickerProviderStateMixin {
  PageController pageController;
  TabController tabController;

  static const List<Color> colors = [Colors.red, Colors.blue, Colors.green];
  static const List<Tab> tabs = [
    Tab(icon: Icon(Icons.person_outline)),
    Tab(icon: Icon(Icons.person_outline)),
    Tab(icon: Icon(Icons.person_outline)),
  ];

  @override
  void initState() {
    super.initState();

    pageController = PageController(viewportFraction: 0.8);
    tabController = TabController(length: tabs.length, vsync: this);

    combineController(
        controller: tabController, pageController: pageController);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.appTitle),
        ),
        body: Center(
          child: SizedBox(
            height: 320.0,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: pageController,
              itemCount: colors.length,
              itemBuilder: (BuildContext context, int index) => Container(
                    color: colors[index],
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
            ),
          ),
        ),
        bottomNavigationBar: RoundedNavigationBar(
          tabs: tabs,
          controller: tabController,
        ),
      );
}
