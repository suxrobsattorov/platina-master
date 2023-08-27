import 'package:flutter/material.dart';
import 'package:platina/controller/providers/articles.dart';
import 'package:platina/view/screens/article_details.dart';
import 'package:platina/view/screens/post_details.dart';
import 'package:platina/view/widgets/home/ArticleItem.dart';
import 'package:provider/provider.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  static const routeName = '/article-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<Articles>(
        builder: (c, articles, child) {
          final as = articles.response.results;
          return as.isNotEmpty
              ? ListView.builder(
                  itemCount: as.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: InkWell(
                        onTap: () => Navigator.of(context).pushNamed(
                            ArticleDetailsScreen.routeName,
                            arguments: as[index].id),
                        child: ArticleItem(
                            image: as[index].image, title: as[index].title),
                      ),
                    );
                  },
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
        },
      ),
    );
  }
}
