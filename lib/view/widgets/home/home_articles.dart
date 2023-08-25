import 'package:flutter/material.dart';
import 'package:platina/view/widgets/home/ArticleItem.dart';
import 'package:provider/provider.dart';

import '../../../controller/providers/articles.dart';
import '../../constants/colors.dart';
import '../../constants/icons.dart';

class HomeArticles extends StatelessWidget {
  const HomeArticles({super.key});

  @override
  Widget build(BuildContext context) {
    Articles articles = Provider.of<Articles>(context);
    List<dynamic> as = articles.response.results;
    return as.isNotEmpty
        ? Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
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
                          'Maqolalar',
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
                ArticleItem(
                  image: as[0].image,
                  title: as[0].title,
                ),
                const SizedBox(height: 10),
                ArticleItem(
                  image: as[1].image,
                  title: as[1].title,
                ),
                const SizedBox(height: 10),
                ArticleItem(
                  image: as[2].image,
                  title: as[2].title,
                ),
                const SizedBox(height: 10),
                ArticleItem(
                  image: as[3].image,
                  title: as[3].title,
                ),
              ],
            ),
          )
        : const Center(
            child: Text(
              'Ma\'lumotlar mavjud emas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          );
  }
}
