import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tour_destiny/utils/constant/theme_container.dart';

import '../../../data/cart/cart_box.dart';
import '../../../data/cart/cart_details.dart';
import '../../../utils/constant/constant.dart';
import '../../../utils/constant/ui_helpers.dart';

@RoutePage()
class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        child: ValueListenableBuilder<Box<CartDetails>>(
          valueListenable: CartBoxes.getData().listenable(),
          builder: (context, value, _) {
            var data = value.values.toList().cast<CartDetails>();
            int totalPrice = data.fold(0, (previousValue, cart) {
              int priceInt = int.tryParse(cart.price!) ?? 0;
              return previousValue + (priceInt * (cart.quantity ?? 0));
            });

            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: kPadding(),
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        var cart = data[index];
                        print(cart.image);
                        print(cart.name);
                        print(cart);
                        
                        return Card(
                          child: Padding(
                            padding: kPadding(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: 50,
                                      width: 60,
                                      child: CachedNetworkImage(
                                        imageUrl: '$tours_url/${cart.image}' ??
                                            'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png',
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error_outline),
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                      ),
                                    ),
                                    sSizedBox(),
                                    Text(
                                      cart.name.toString(),
                                      style: kkBoldTextStyle(),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Text(
                                        cart.slug.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "\$ ${cart.total}",
                                          style: kBoldTextStyle(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        cart.delete();
                                      },
                                      child: Icon(Icons.delete),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (cart.quantity! > 1) {
                                              cart.updateQuantity(
                                                  cart.quantity! - 1);
                                            }
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            size: 12,
                                          ),
                                        ),
                                        Text(cart.quantity.toString()),
                                        InkWell(
                                          onTap: () {
                                            cart.updateQuantity(
                                                cart.quantity! + 1);
                                          },
                                          child: Icon(
                                            Icons.add,
                                            size: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SafeArea(
                  child: ThemeContainer(
                    padding: kPadding(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total :',
                              style: kkBoldTextStyle(),
                            ),
                            sSizedBox(),
                            Text(
                              totalPrice.toString(),
                              style: kkBoldTextStyle(),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColor,
                          ),
                          padding: sPadding,
                          child: Text(
                            'Proced to pay',
                            style: kkWhiteBoldTextStyle(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
