import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/model/news_model.dart';

class NewsRepository {
  final apiUrl ='https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c14a5d1f415d452abe126b8d25a26969';

  Future<List<NewsModel>> getAllNews() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        print('rs data type: ${response.body}');
        print('reso data: ${response.body}');
        final jsonData = jsonDecode(response.body);
        if (jsonData['status'] == 'ok') {
          final allArticles = jsonData['articles'];
          print('all article: $allArticles');
          final newsModelList = allArticles
              .map((e) {
                return NewsModel.fromJson(e);
              })
              .toList()
              .cast<NewsModel>();
          return newsModelList;
        } else {
          throw 'Error in get all news.';
        }
      } else {
        throw 'Error in get all news.';
      }
    } catch (e) {
      print('error in get all news: $e');
    }
    return [];
  }
}
