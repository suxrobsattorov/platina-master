import 'package:flutter/material.dart';
import 'package:platina/view/constants/colors.dart';
import 'package:platina/view/constants/icons.dart';
import 'package:platina/view/screens/article.dart';
import 'package:platina/view/screens/home.dart';
import 'package:platina/view/screens/popular.dart';
import 'package:platina/view/screens/tape.dart';
import 'package:platina/view/screens/video.dart';
import 'package:platina/view/widgets/app_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = 0;

  List<Widget> pages = [
    const HomeScreen(),
    const TapeScreen(),
    const PopularScreen(),
    const ArticleScreen(),
    const VideoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: AppColors.mainColor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        centerTitle: true,
        title: Image.asset(
          AssetsIcons.platinaTitle,
          color: AppColors.mainColor,
          width: 110,
          height: 110,
        ),
        actions: [
          Image.asset(
            AssetsIcons.search,
            color: AppColors.mainColor,
            width: 55,
            height: 55,
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: SafeArea(child: pages[currentPage]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetsIcons.home,
              width: 30,
              height: 30,
              color: currentPage == 0 ? AppColors.mainColor : Colors.grey,
            ),
            label: 'Asosiy',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetsIcons.tape,
              width: 30,
              height: 30,
              color: currentPage == 1 ? AppColors.mainColor : Colors.grey,
            ),
            label: 'Lenta',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetsIcons.popular,
              width: 30,
              height: 30,
              color: currentPage == 2 ? AppColors.mainColor : Colors.grey,
            ),
            label: 'Ommabop',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetsIcons.article,
              width: 30,
              height: 30,
              color: currentPage == 3 ? AppColors.mainColor : Colors.grey,
            ),
            label: 'Maqola',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              AssetsIcons.video,
              width: 30,
              height: 30,
              color: currentPage == 4 ? AppColors.mainColor : Colors.grey,
            ),
            label: 'Video',
          ),
        ],
      ),
    );
  }
}
