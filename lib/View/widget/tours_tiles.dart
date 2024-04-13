import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tour_destiny/routes/routes_imports.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/constant/constant.dart';
import '../../utils/constant/ui_helpers.dart';

class ToursTiles extends StatelessWidget {
  // String? placeName;
  String? image;
  Widget? topRight;
  Widget? bottomLeft;
  double? height;
  double? width;
  Widget? bottomRight;
  Widget? topLeft;

  void Function()? onTap;

  ToursTiles({
    this.bottomLeft,
    this.height,
    this.width,
    this.image,
    this.bottomRight,
    this.topRight,
    this.onTap,
    this.topLeft,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: sPadding,
        height: height ?? 170,
        width: width ?? 130,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              image: CachedNetworkImageProvider(
                image!,
                errorListener: (p0) {
                  print('Failed to load image');
                },
              ),
              fit: BoxFit.cover,
              onError: (exception, stackTrace) {
                print('Failed to load image: $stackTrace');
              },
              opacity: 0.75),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: topLeft ?? SizedBox(),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: topRight ?? SizedBox(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: bottomLeft ?? SizedBox(),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: bottomRight ?? SizedBox(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
