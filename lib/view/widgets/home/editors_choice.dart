import 'package:flutter/material.dart';

import '../../../controller/constants/api_constants.dart';
import '../../../model/post.dart';
import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../functions/util_function.dart';
import '../../screens/post_details.dart';

// ignore: must_be_immutable
class EditorsChoice extends StatelessWidget {
  List<Result> postList;
  UtilFunction function = UtilFunction();

  EditorsChoice({super.key, required this.postList});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
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
                      'Muxarrir tanlovi',
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
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 380,
            child: ListView.builder(
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: postList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                      PostDetailsScreen.routeName,
                      arguments: postList[index].id),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        Container(
                          width: 300,
                          height: 240,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(api + postList[index].image),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 75,
                          width: 300,
                          child: Text(
                            function.replaceTitle(postList[index].title),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Text(
                              postList[index].category.name,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.deepOrange,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              function.beforeTime(
                                          postList[index].publish.toString()) ==
                                      ''
                                  ? ''
                                  : function.beforeTime(
                                      postList[index].publish.toString()),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
