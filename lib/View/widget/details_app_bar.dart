import 'package:auto_route/auto_route.dart';
import 'package:tour_destiny/utils/constant/theme_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constant/constant.dart';
import '../../utils/constant/ui_helpers.dart';

class DetailsAppBar extends StatelessWidget {
  const DetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                AutoRouter.of(context).pop();
              },
              child: ThemeContainer(
                  padding: sPadding, child: Icon(Icons.arrow_back_ios)),
            ),
            GestureDetector(
              onTap: () {},
              child: ThemeContainer(
                padding: sPadding,
                child: Icon(Icons.bookmark_outline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
