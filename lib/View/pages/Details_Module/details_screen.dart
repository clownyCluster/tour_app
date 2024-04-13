import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tour_destiny/View/widget/details_app_bar.dart';
import 'package:tour_destiny/View/widget/details_bottom_bar.dart';
import 'package:tour_destiny/utils/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailsScreen extends StatelessWidget {
  String? name;
  String? des;
  String? image;
  String? price;
  String? ratings;
  List<String>? imageList;

  DetailsScreen({
    super.key,
    this.des,
    this.imageList,
    this.image,
    this.ratings,
    this.name,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Color.fromARGB(255, 0, 0, 0),
        image: DecorationImage(
          image: CachedNetworkImageProvider('$tours_url/$image'),
          fit: BoxFit.cover,
          opacity: 0.7,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 68),
          child: DetailsAppBar(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: CarouselSlider(
              items: imageList!.map((e) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // boxShadow: [
                      //   BoxShadow(
                      //     blurRadius: 2,
                      //     // // color: Colors.transparent,
                      //     offset: Offset(2, 3),
                      //     blurStyle: BlurStyle.outer,
                      //   )
                      // ],
                      image: DecorationImage(
                        image: CachedNetworkImageProvider('$tours_url/$e'),
                        fit: BoxFit.cover,
                      )),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                );
              }).toList(),
              options: CarouselOptions(
                height: 250,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                // onPageChanged: callbackFunction,
                scrollDirection: Axis.horizontal,
              )),
        ),
        
        bottomNavigationBar: DetailsBottomBar(
          des: des!,
          name: name!,
          price: price!,
          imageList: imageList!,
          ratings: ratings!,
        ),
      ),
    );
  }
}
