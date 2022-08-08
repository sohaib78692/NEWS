import 'dart:convert';

class newsapi{
  String title, imageUrl, content,description,date,source;

  newsapi(
    {
      required this.title,
      required this.description,
      required this.content,
      required this.imageUrl, 
      required this.date, 
      required this.source,
    }
  );

  factory newsapi.fromJson(Map<String, dynamic>jsonData){
    return newsapi(
      date: jsonData["date"],
      source: jsonData['source'],
      title: jsonData["title"],
       description: jsonData["description"],
        content: jsonData["content"],
         imageUrl: jsonData["urltoimage"]);
  }
}