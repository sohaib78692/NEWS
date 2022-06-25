
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news/model.dart';
import 'package:shimmer/shimmer.dart';

import 'app_colors.dart';

class readingnews extends StatelessWidget {
  final newsapi model;
  const readingnews({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
        return SafeArea(
          child: Scaffold(
              body: Container(
                color: Color.fromARGB(255, 50, 163, 255),
          height: size.height,
          width: size.width,
          child:  SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment : Alignment.centerLeft,
                  child: IconButton(
                    onPressed: ()=> Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  width: size.width/1.05,
                  child: Text(
                    model.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                    ),
                  )
                ),

                Container(
                  height: size.height/4,
                  width: size.width/1.05,
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
                  width: size.width/1.05,
                  child: Text(
                    model.content,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            )
             ),
              ),
            ),
        );
    
  }
}