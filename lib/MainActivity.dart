import 'package:flutter/material.dart';
import 'pages/center/SecondFragment.dart';
import 'pages/home/HomeFragment.dart';

import 'pages/mine/FourFragment.dart';
import 'pages/news/ThirdFragment.dart';

// Flutter就是一个框架，一个UI框架。谷歌官方就是将Ui框架搭建好了，然后开发者
// 将相关参数实例化之后，丢进这个框架就可以了。说白了官方就是想制定一个标准，
// Flutter就是一个UI标准，让开发者都按照标准来。而不是像java原生开发那样各搞各的。
// 其实Flutter能开发的东西原生也可以，只不过用的是不同语言，而且灵活度不一样。
// 原生灵活度更高，Flutter则是在更规范的框架中开发。

class MainActivity extends StatefulWidget {
  // StatefulWidget 有状态的widget
  const MainActivity({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MainActivity> {
  int currentPage = 0;
  final finalTab = <String>['微信', '通讯录', '发现', '我'];
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return getMainLayout(); // setContentView
  }

  Scaffold getMainLayout() {
    // getDecorView
    var scaffold = Scaffold(
        body: getPageView(), // ContentView ViewPager
        bottomNavigationBar: getNavigationBar(), //底部导航栏
        backgroundColor: Colors.grey);
    return scaffold;
  }

  /// ViewPager
  PageView getPageView() {
    // PageView
    var pages = [
      const HomeFragment(),
      const SecondFragment(),
      const ThirdFragment(),
      const FourFragment()
    ];
    var pageView = PageView(
        controller: pageController,
        onPageChanged: _onPageChange,
        children: pages);
    return pageView;
  }

  /// 底部导航栏
  BottomNavigationBar getNavigationBar() {
    var navigationItems = [
      BottomNavigationBarItem(
          icon: const Icon(Icons.alternate_email_rounded), label: finalTab[0]),
      BottomNavigationBarItem(
          icon: const Icon(Icons.add_photo_alternate_outlined),
          label: finalTab[1]),
      BottomNavigationBarItem(
          icon: const Icon(Icons.album_rounded), label: finalTab[2]),
      BottomNavigationBarItem(
          icon: const Icon(Icons.account_circle_sharp), label: finalTab[3])
    ];
    var myBottomNavigationBar = BottomNavigationBar(
      items: navigationItems,
      currentIndex: currentPage,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: _onItemSelect,
      type: BottomNavigationBarType.fixed,
    );
    return myBottomNavigationBar;
  }

  void _onPageChange(int index) {
    // PageView发生改变，更改NavigationBar
    setState(() {
      // 更新状态
      currentPage = index;
    });
    print(index);
  }

  void _onItemSelect(int index) {
    // NavigationBar发生改变，更改PageView
    setState(() {
      // 更新状态
      currentPage = index;
      pageController.jumpToPage(index);
    });
    print(index);
  }
}
