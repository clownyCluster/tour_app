import 'package:tour_destiny/utils/constant/k_text_form_field.dart';
import 'package:tour_destiny/utils/constant/ui_helpers.dart';
import 'package:tour_destiny/utils/icons_data.dart';
import 'package:tour_destiny/utils/localization/app_constraints.dart';
import 'package:tour_destiny/utils/localization/english_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/constant/constant.dart';
import '../../utils/constant/theme_container.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: ThemeContainer(child: Icon(Icons.menu)),
                ),
                Expanded(
                  child: Container(
                    height: 48,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: KTextFormField(
                      prefixIcon: appIcon().serchIcon,
                      hint: getTranslated('search', context),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: ThemeContainer(
                    padding: sPadding,
                    child: Icon(Icons.filter_alt_outlined),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
