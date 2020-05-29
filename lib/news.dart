import 'package:http/http.dart' as http;
import 'article.dart';
import 'dart:convert';

class News {
  List<Article> news = [];
  String apiKey = '35b8b2a30f464f11b1e9efd3eb90a966';
  String headLines = 'top-headlines';

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/${headLines}?q=bitcoin&apiKey=${apiKey}';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData.forEach((element) {
        Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: element['publishedAt'],
            content: element['content']);

        news.add(article);
      });

      print(news);
    }
  }
}
