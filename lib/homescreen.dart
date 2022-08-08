
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
        appBar: AppBar(
          title: Center(
          child:Text("HEADLINES",
          style: TextStyle(color: Color(0xffffffff),fontSize: 29,fontFamily: "RobotoSlab-Bold",fontWeight: FontWeight.w400),)),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Color(0xff464646),
        body: Container(
          height: size.height,
          width: size.width,
          child: Column(children: [
            isloading?
            Container(
              height: size.height/20,
              width: size.height/20,
              child: CircularProgressIndicator(),
            )
             : Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
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
    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
    child:  GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => readingnews(
        model: model,
      ))),
      child: Stack(
            children: <Widget>[
              ClipRRect(child: Image.network(model.imageUrl,
            height: 220,
            width: 500,
            fit:BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(10),),
            Container(
              height:220,
              decoration:BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withOpacity(0.1),Colors.black]
                ),
              borderRadius: BorderRadius.circular(10))
            ),
            Container(
              padding: EdgeInsets.only(left: 10,right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                SizedBox(height: 85,),
                Text(model.title,
                style: TextStyle(
                  color: Color(0xfff2f2f2),
                fontSize: 20),
                ),
                SizedBox(height:24 ,),
                Row(
                  children: [
                    Text(model.source,
                    style: TextStyle(color: Color(0xffbababa),
                    fontSize: 12,
                    fontWeight: FontWeight.w800
                    ),
                    ),
                     SizedBox(width: 10,),
                    Text(model.date.substring(0,10),
                style: TextStyle(color: Color(0xffbababa),
                fontSize: 12
                ),
                )
                  ],
                ),
                
              ],),
            )
            ]),
            
    ),
    )
  ;
}
