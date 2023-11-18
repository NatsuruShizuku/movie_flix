import 'package:flutter/material.dart';
import '../models/movies.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key,required this.movies});

  final Movies movies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(movies.title),
            ),
            Text(movies.overview),
          ],
        ),
      ),

    );
  }

}
