import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../controller/constants/api_constants.dart';
import '../constants/colors.dart';
import '../constants/icons.dart';
import '../functions/util_function.dart';

// ignore: must_be_immutable
class Details extends StatelessWidget {
  UtilFunction function = UtilFunction();
  final item;

  Details({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        title: Image.asset(
          AssetsIcons.platinaTitle,
          color: Colors.white,
          width: 110,
          height: 110,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(api + item.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    '\t\t${function.replaceTitle(item.title)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.category.name,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.deepOrange,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        function.beforeTime(item.publish.toString()) == ''
                            ? ''
                            : function.beforeTime(item.publish.toString()),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Html(
                    data: '\t\t\t\t${function.replaceTitle(item.description)}',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
