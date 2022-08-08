import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/model.dart';

Future<List<newsapi>> getNews() async {
  Uri uri = Uri.parse(
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=381bd92597574b3ea222823404a7f027");

  final response = await http.get(uri);
  final List<newsapi> newslist = [];
  var jsonData = jsonDecode(response.body);

  if (response.statusCode == 200) {
        jsonData["articles"].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            newsapi article = newsapi(
              title: element['title'],
              description: element['description'],
              content: element["content"],
               imageUrl: element['urlToImage'],
               date:element['publishedAt'],
               source:element['source']['name']
            );
            newslist.add(article);
            return newslist;
          }
        });
        
  }
  return newslist;
}