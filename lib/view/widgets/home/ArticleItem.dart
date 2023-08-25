import 'package:flutter/material.dart';

import '../../../controller/constants/api_constants.dart';
import '../../functions/util_function.dart';

// ignore: must_be_immutable
class ArticleItem extends StatelessWidget {
  String image;
  String title;
  UtilFunction function = UtilFunction();

  ArticleItem({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(api + image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          function.replaceTitle(title),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
