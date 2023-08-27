import 'package:flutter/material.dart';
import 'package:platina/controller/providers/posts.dart';
import 'package:provider/provider.dart';
import '../widgets/details.dart';

class PostDetailsScreen extends StatelessWidget {
  PostDetailsScreen({super.key});

  static const routeName = '/post-details';

  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context)!.settings.arguments;
    final post =
        Provider.of<Posts>(context, listen: false).findById(postId as int)!;

    return Details(item: post);
  }
}
