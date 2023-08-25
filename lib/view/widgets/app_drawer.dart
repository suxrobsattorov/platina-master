import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:platina/controller/providers/menus.dart';
import 'package:provider/provider.dart';

import '../../model/menu.dart';
import '../constants/colors.dart';
import '../constants/icons.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Widget language(String text, bool isCheck) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCheck ? Color(0xFFF8F8FF) : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: AppColors.mainColor,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget socialNetwork(String icon, String text, double padding) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 7 + padding),
      decoration: BoxDecoration(
        color: Color(0xFFF8F8FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            height: 30,
            width: 30,
            color: AppColors.mainColor,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.mainColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Menu> menuList = Provider.of<Menus>(context).response;
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppBar(
              elevation: 0,
              centerTitle: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title: Image.asset(
                AssetsIcons.platinaTitle,
                color: AppColors.mainColor,
                width: 110,
                height: 110,
              ),
            ),
            Column(
              children: [
                ListView.builder(
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  itemCount: menuList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Image.asset(
                          AssetsIcons.item,
                          color: AppColors.mainColor,
                          width: 7,
                          height: 7,
                        ),
                        SizedBox(width: 10),
                        Text(
                          menuList[index].name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    language('Узб', false),
                    language('O\'zb', true),
                    language('Рус', false),
                    language('Eng', false),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(height: 15),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        socialNetwork(AssetsIcons.telegram, 'platinauzb', 0),
                        socialNetwork(AssetsIcons.instagram, 'platinauzb', 0),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        socialNetwork(AssetsIcons.facebook, 'platinauz', 5),
                        socialNetwork(AssetsIcons.youtube, 'platinauz', 5),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        socialNetwork(AssetsIcons.twitter, 'platinauz', 5),
                        socialNetwork(AssetsIcons.tiktok, 'platinauz', 5),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
