import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Videolar mavjud emas',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
