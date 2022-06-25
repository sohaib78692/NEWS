class newsapi{
  String title, imageUrl, content,description;

  newsapi(
    {
      required this.title,
      required this.description,
      required this.content,
      required this.imageUrl,
    }
  );

  factory newsapi.fromJson(Map<String, dynamic>jsonData){
    return newsapi(
      title: jsonData["title"],
       description: jsonData["description"],
        content: jsonData["content"],
         imageUrl: jsonData["urltoimage"]);
  }
}