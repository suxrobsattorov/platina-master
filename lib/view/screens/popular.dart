import 'package:flutter/material.dart';
import 'package:platina/view/screens/post_details.dart';
import 'package:platina/view/widgets/home/ArticleItem.dart';
import 'package:provider/provider.dart';

import '../../controller/providers/posts.dart';
import '../../model/post.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  static const routeName = '/popular-screen';

  @override
  Widget build(BuildContext context) {
    Post post = Provider.of<Posts>(context).response;
    return Scaffold(
      backgroundColor: Colors.white,
      body: post.results.isNotEmpty
          ? ListView.builder(
              itemCount: post.results.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(16),
                child: InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                      PostDetailsScreen.routeName,
                      arguments:  post.results[index].id),
                  child: ArticleItem(
                      image: post.results[index].image,
                      title: post.results[index].title),
                ),
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
            ),
    );
  }
}
