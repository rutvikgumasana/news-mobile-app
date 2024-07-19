import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:news_app/components/network_image.dart';
import 'package:news_app/controllers/home_controller.dart';
import 'package:news_app/screens/news_details_screen/news_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    //Call News Api
    homeController.getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('News App'), centerTitle: true),
        body: Obx(() => homeController.loading.value
            ? const Center(child: CircularProgressIndicator())
            : GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                itemCount: homeController.news.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: 2 / 2.2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Get.to(() => NewsDetailsScreen(article: homeController.news[index]));
                      },
                      child: Column(children: [
                        // Article Image
                        SizedBox(height: 120, width: double.infinity, child: CustomCachedImage(imageUrl: homeController.news[index].urlToImage ?? '', fit: BoxFit.fill, radius: 10)),
                        // Article Title
                        Text(homeController.news[index].title ?? '', style: const TextStyle(fontSize: 15, color: Colors.black), maxLines: 3, overflow: TextOverflow.ellipsis)
                      ]));
                })));
  }
}
