import 'package:flutter/material.dart';

import '../../../controller/constants/api_constants.dart';
import '../../functions/util_function.dart';
import '../../screens/post_details.dart';

// ignore: must_be_immutable
class PostContainer extends StatelessWidget {
  int id;
  String title;
  String date;
  String image;
  String? categoryName;
  UtilFunction function = UtilFunction();

  PostContainer({
    super.key,
    required this.id,
    required this.title,
    required this.date,
    required this.image,
    this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(
          PostDetailsScreen.routeName,
          arguments: id),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 100,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width-172,
                  height: 40,
                  child: Text(
                    function.replaceTitle(title),
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
                    categoryName != null
                        ? Row(
                            children: [
                              Text(
                                categoryName!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              const SizedBox(width: 20),
                            ],
                          )
                        : Container(),
                    Text(
                      function.beforeTime(date),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: 130,
              height: 90,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(api + image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
