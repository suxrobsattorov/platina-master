import 'package:flutter/material.dart';
import 'package:platina/controller/providers/posts.dart';
import 'package:platina/model/post.dart';
import 'package:platina/view/widgets/home/post_container.dart';
import 'package:provider/provider.dart';

class TapeScreen extends StatelessWidget {
  const TapeScreen({super.key});

  static const routeName = '/tape-screen';

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
                child: PostContainer(
                  id: post.results[index].id,
                  title: post.results[index].title,
                  date: post.results[index].publish.toString(),
                  image: post.results[index].imageSmall,
                  categoryName: post.results[index].category.name,
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
