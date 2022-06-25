import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/model.dart';

Future<List<newsapi>> getNews() async {
  Uri uri = Uri.parse(
      "https://newsapi.org/v2/everything?q=tesla&from=2022-05-25&sortBy=publishedAt&apiKey=c400b48bfe4f411ca0886bbc8d12f34e");

  final response = await http.get(uri);
  final List<newsapi> newslist = [];
  
  print(response.body);
  var jsonData = jsonDecode(response.body);

  if (response.statusCode == 200) {
        jsonData["articles"].forEach((element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            newsapi article = newsapi(
              title: element['title'],
              description: element['description'],
              content: element["content"],
               imageUrl: element['urlToImage'],
            );
            newslist.add(article);
            return newslist;
          }
        });
        
  }
  return newslist;
}