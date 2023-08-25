import 'package:flutter/material.dart';
import 'package:platina/controller/providers/currencies.dart';
import 'package:platina/controller/providers/menus.dart';
import 'package:platina/controller/providers/posts.dart';
import 'package:platina/controller/providers/weathers.dart';
import 'package:platina/view/widgets/home/home_option.dart';
import 'package:provider/provider.dart';

import '../../controller/providers/articles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future _postsFuture;

  Future _getPostsFuture() {
    Provider.of<Articles>(context, listen: false).getArticleFromApi();
    Provider.of<Currencies>(context, listen: false).getCurrencyFromApi();
    Provider.of<Menus>(context, listen: false).getMenuFromApi();
    Provider.of<Weathers>(context, listen: false).getWeatherFromApi();
    return Provider.of<Posts>(context, listen: false).getPostFromApi();
  }

  @override
  void initState() {
    _postsFuture = _getPostsFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FF),
      body: FutureBuilder(
        future: _postsFuture,
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error == null) {
              return Consumer<Posts>(
                builder: (c, posts, child) {
                  final ps = posts.response.results;
                  return ps.isNotEmpty
                      ? HomeOption(
                          postList: ps,
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
              );
            } else {
              // .. xatolik
              return const Center(
                child: Text(
                  'Xatolik sodir bo\'ldi.',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
