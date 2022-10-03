import 'dart:html';

import 'package:flutter/material.dart';
import 'package:meet3/model/article.dart';

class DetailNewsScreen extends StatelessWidget {
  static const routeName='/article_detail';
  final Article article;

  const DetailNewsScreen({Key? key, required this.article}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(article.urlToImage),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.description),
                  Divider(color: Colors.grey,),
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  Divider(color: Colors.grey,),
                  Text(article.content),
                  const SizedBox(height: 10,),
                  ElevatedButton(onPressed: () {}, child: const Text('More...')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}