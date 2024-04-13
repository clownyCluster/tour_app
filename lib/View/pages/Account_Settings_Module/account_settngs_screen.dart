import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tour_destiny/utils/constant/constant.dart';
@RoutePage()
class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar('Account Settings') ,
      body: Container(
        padding: kStandardPadding(),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}