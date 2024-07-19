import 'package:get/get.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/utils/app_constants.dart';
import 'package:news_app/utils/network_dio/network_dio.dart';

class HomeController extends GetxController {
  final NetworkDioHttp networkDioHttp = NetworkDioHttp();
  RxList<Article> news = <Article>[].obs;
  RxBool loading = false.obs;

  // Get News Api Function
  Future<void> getNews() async {
    loading.value = true;
    var response = await networkDioHttp.getRequest(
      url: '${ApiAppConstants.baseUrl}top-headlines?sources=techcrunch&apiKey=${ApiAppConstants.apiKey}',
      name: 'GetNews',
    );
    loading.value = false;
    if (response.data != null && response.statusCode == 200) {
      // Parse the JSON response
      NewsModel newsModel = NewsModel.fromJson(response.data);
      news.value = newsModel.articles!;
    }
  }
}
