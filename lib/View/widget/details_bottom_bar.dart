import 'package:tour_destiny/utils/constant/theme_container.dart';
import 'package:tour_destiny/View/widget/tours_tiles.dart';
import 'package:tour_destiny/utils/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsBottomBar extends StatelessWidget {
  String? name;
  String? des;
  String? price;
  String? ratings;
  List? imageList;
  DetailsBottomBar({
    super.key,
    this.des,
    this.name,
    this.imageList,
    this.price,
    this.ratings,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeContainer(
      padding: kStandardPadding(),
      height: MediaQuery.of(context).size.height * 0.55,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(
          20,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LSizedBox(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$name 😊',
                        style: kkBoldTextStyle(),
                      ),
                      Row(
                        children: [
                          Text(
                            ratings!,
                            style: kkBoldTextStyle(),
                          ),
                          Icon(
                            Icons.star,
                            // // color: yellowColor,
                          )
                        ],
                      )
                    ],
                  ),
                  kSizedBox(),
                  Text(
                    des!,
                    // 'The Amalfi Coast is a stunning stretch of coastline along the southern edge of Italys Sorrentine Peninsula, in the Campania region. Known for its breathtaking landscapes, picturesque towns, and azure waters, the Amalfi Coast is a UNESCO World Heritage Site and one of the most sought-after destinations in Italy.',
                    style: kkTextStyle(),
                    textAlign: TextAlign.justify,
                  ),
                  sSizedBox(),
                  Text(
                    'Recommended : ',
                    style: kkBoldTextStyle().copyWith(fontSize: 18),
                    textAlign: TextAlign.start,
                  ),
                  kSizedBox(),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageList!.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            ToursTiles(
                              image: '$tours_url/${imageList![index]}',
                            ),
                            maxWidthSpan()
                          ],
                        );
                      },
                    ),
                  ),
                  sSizedBox(),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total',
                    style: kkBoldTextStyle(),
                  ),
                  Text(
                    '\$$price',
                    style: kkBoldTextStyle(),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: whiteColor,
                    ),
                    maxWidthSpan(),
                    Text(
                      'Add to cart',
                      style: kkWhiteBoldTextStyle(),
                    )
                  ],
                ),
              )
            ],
          ),
          sSizedBox(),
        ],
      ),
    );
  }
}
