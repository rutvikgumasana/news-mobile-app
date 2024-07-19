import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:news_app/components/network_image.dart';
import 'package:news_app/controllers/home_controller.dart';
import 'package:news_app/models/news_model.dart';

class NewsDetailsScreen extends StatefulWidget {
  final Article article;

  const NewsDetailsScreen({super.key, required this.article});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text(widget.article.source?.name ?? 'News Details')),
        body: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: CustomCachedImage(imageUrl: widget.article.urlToImage ?? '', fit: BoxFit.fill),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                // Article Title
                Text(
                  widget.article.title ?? '',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                // Article Description
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    '\$${widget.article.description ?? ''}',
                    style: const TextStyle(fontSize: 20),
                  ),
                )
              ]))
        ])));
  }
}
