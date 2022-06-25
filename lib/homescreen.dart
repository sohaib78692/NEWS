
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model.dart';
import 'package:news/news_api.dart';
import 'package:news/news_screen.dart';
import 'package:shimmer/shimmer.dart';

import 'app_colors.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<newsapi>?newslist;
  bool isloading = true;
  @override
  void initState() {
    super.initState();
    getNews().then((value) => 
    setState((){
      if (value.isNotEmpty){
        newslist=value;
        isloading=false;
      }
      else{
        print("Error");
      }
    })
    );
  }
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 50, 163, 255),
        body: Container(
          height: size.height,
          width: size.width,
          child: Column(children: [
            Container(
              height: size.height / 12,
              width: size.width / 1.1,
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: size.width / 4,
                  ),
                  Text(
                    "News App",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            isloading?
            Container(
              height: size.height/20,
              width: size.height/20,
              child: CircularProgressIndicator(),
            )
             : Expanded(
                child: ListView.builder(
                    itemCount: newslist!.length,
                    itemBuilder: (context, index) => ListItems(size,context,newslist![index])
                ))
          ]),
        ),
      ),
    );
  }
}

Widget ListItems(Size size, BuildContext context, newsapi model) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
    child:  GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => readingnews(
        model: model,
      ))),
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: size.width / 1.15,
          decoration:
              BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.black)),
          child: Column(children: [
            Container(
              height: size.height / 4,
              width: size.width / 1.05,
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.black, width: 1))),
              alignment: Alignment.center,
              child: CachedNetworkImage(
                        imageUrl:model.imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (ctx, url) => Shimmer.fromColors(
                          baseColor: AppColors.shimmerBaseColor,
                          highlightColor: AppColors.shimmerHighlightColor,
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            color: AppColors.white,
                          ),
                        ),
                        errorWidget: (context, url, error) {
                          return Container();
                        },
                      ),
            ),
            Container(
              width: size.width / 1.1,
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                model.title,
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.w500,),
              ),
            ),
            Container(
              width: size.width / 1.1,
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                model.description,
                style: TextStyle(fontSize: 16,
                ),
              ),
            )
          ]),
        ),
    ),
    )
  ;
}
