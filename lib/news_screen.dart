import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/homescreen.dart';
import 'package:news/model.dart';

class readingnews extends StatelessWidget {
  final newsapi model;
  const readingnews({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          ClipRRect(
            child: Image.network(
              model.imageUrl,
              height: size.height,
              width: size.width,
              fit: BoxFit.fill,
            ),
          ),
          Container(
              height: size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.4),Colors.black]
                ),
              )),
          Container(
            padding: EdgeInsets.only(left: 2, top: 2),
            margin: EdgeInsets.only(left: 5, top: 5),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.black.withOpacity(0.2)),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back),
              iconSize: 42,
              color: Colors.white,
            ),
          ),
          
          Container(
            padding: EdgeInsets.only(top:size.height / 2 ),
            margin: EdgeInsets.only(left: 24, right: 24),
            child: ListView(
              children: [
                
                Text(
                  model.title,
                  style: TextStyle(
                    color: Color(0xfff2f2f2),
                    fontSize: 29,
                    fontFamily: "RobotoSlab_Bold",
                  ),
                ),
                SizedBox(
                  height: 64,
                ),
                Row(
                  children: [
                    Text(model.source,
                        style:
                            TextStyle(color: Color(0xfff2f2f2), fontSize: 20)),
                    Spacer(),
                    Text(model.date.substring(0, 10),
                        style:
                            TextStyle(color: Color(0xfff2f2f2), fontSize: 20))
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  model.content,
                  style: TextStyle(
                      color: Color(0xffbababa),
                      fontFamily: "RobotoSlab_Regular",
                      fontSize: 14),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
