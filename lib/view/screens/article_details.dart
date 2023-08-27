import 'package:flutter/material.dart';
import 'package:platina/controller/providers/articles.dart';
import 'package:platina/view/widgets/details.dart';
import 'package:provider/provider.dart';

class ArticleDetailsScreen extends StatelessWidget {
  ArticleDetailsScreen({super.key});

  static const routeName = '/article-details';

  @override
  Widget build(BuildContext context) {
    final articleId = ModalRoute.of(context)!.settings.arguments;
    final article = Provider.of<Articles>(context, listen: false)
        .findById(articleId as int)!;

    return Details(item: article);
  }
}
