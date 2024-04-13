import 'package:auto_route/auto_route.dart';
import 'package:tour_destiny/Bloc/Splash_Cubit/splash_cubit.dart';
import 'package:tour_destiny/utils/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_destiny/utils/constant/painter.dart';
import 'package:tour_destiny/utils/localization/app_constraints.dart';
import 'package:tour_destiny/utils/localization/english_text.dart';

import '../../../Models/services/local_storage_service/local_storage_service.dart';
import '../../../utils/localization/app_localization.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(0.2),
      body: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          context.read<SplashCubit>().checkToken(context);
          return Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width:  double.infinity,
                  child: CustomPaint(
                painter: greyCustomPainter(),
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Image.asset('assets/images/appLogo.png', height: 100,)),
                  LSizedBox(),
                  Center(
                    child: Text(
                      getTranslated('appName', context),
                      style: kkWhiteBoldTextStyle(),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
