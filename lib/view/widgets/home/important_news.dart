import 'package:flutter/material.dart';
import 'package:platina/controller/constants/api_constants.dart';
import 'package:platina/view/constants/colors.dart';
import 'package:platina/view/constants/icons.dart';
import 'package:platina/view/functions/util_function.dart';
import 'package:platina/view/widgets/home/post_container.dart';

import '../../../model/post.dart';
import '../../screens/post_details.dart';

// ignore: must_be_immutable
class ImportantNews extends StatelessWidget {
  List<Result> postList;
  UtilFunction function = UtilFunction();

  ImportantNews({super.key, required this.postList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetsIcons.item,
                    color: AppColors.mainColor,
                    width: 10,
                    height: 10,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Muhim yangiliklar',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
              Image.asset(
                AssetsIcons.right,
                color: AppColors.mainColor,
                width: 24,
                height: 24,
              ),
            ],
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(
                PostDetailsScreen.routeName,
                arguments: postList[0].id),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 240,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(api + postList[0].image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  function.replaceTitle(postList[0].title),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  postList[0]
                      .shortDescription
                      .replaceAll('</p>', '')
                      .replaceAll('<p>', '')
                      .replaceAll('&nbsp', '')
                      .replaceAll(';', '')
                      .trimRight(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'davomini o\'qish',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      postList[0].category.name,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.deepOrange,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      function.beforeTime(postList[0].publish.toString()) == ''
                          ? ''
                          : function.beforeTime(postList[0].publish.toString()),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
          const SizedBox(height: 15),
          PostContainer(
            id: postList[1].id,
            title: postList[1].title,
            date: postList[1].publish.toString() == ''
                ? ''
                : postList[1].publish.toString(),
            image: postList[1].imageSmall,
            categoryName: postList[1].category.name,
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
          const SizedBox(height: 15),
          PostContainer(
            id: postList[2].id,
            title: postList[2].title,
            date: postList[2].publish.toString() == ''
                ? ''
                : postList[2].publish.toString(),
            image: postList[2].imageSmall,
            categoryName: postList[2].category.name,
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
          const SizedBox(height: 15),
          PostContainer(
            id: postList[3].id,
            title: postList[3].title,
            date: postList[3].publish.toString() == ''
                ? ''
                : postList[3].publish.toString(),
            image: postList[3].imageSmall,
            categoryName: postList[3].category.name,
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
          const SizedBox(height: 15),
          PostContainer(
            id: postList[4].id,
            title: postList[4].title,
            date: postList[4].publish.toString() == ''
                ? ''
                : postList[4].publish.toString(),
            image: postList[4].imageSmall,
            categoryName: postList[4].category.name,
          ),
        ],
      ),
    );
  }
}
