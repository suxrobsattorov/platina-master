import 'package:flutter/material.dart';
import 'package:platina/view/widgets/home/currency_and_weather_list.dart';
import 'package:platina/view/widgets/home/editors_choice.dart';
import 'package:platina/view/widgets/home/home_articles.dart';
import 'package:platina/view/widgets/home/home_footer.dart';
import 'package:platina/view/widgets/home/important_news.dart';

import '../../../model/post.dart';

// ignore: must_be_immutable
class HomeOption extends StatelessWidget {
  List<Result> postList;

  HomeOption({Key? key, required this.postList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CurrencyAndWeatherList(),
          ImportantNews(postList: postList),
          const SizedBox(height: 15),
          EditorsChoice(postList: postList),
          const SizedBox(height: 15),
          const HomeArticles(),
          const SizedBox(height: 15),
          HomeFooter(),
        ],
      ),
    );
  }
}
