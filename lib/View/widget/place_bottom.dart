import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/Home_Bloc/home_bloc.dart';
import '../../utils/constant/constant.dart';
import '../../utils/constant/ui_helpers.dart';

class PlaceBottom extends StatelessWidget {
  String? name;
  void Function()? onTap;
  int? selectedIndex;
  PlaceBottom({
    this.name,
    this.onTap,
    this.selectedIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              height: 40,
              padding: EdgeInsets.only(right: 10,left: 10,top: 5,bottom: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                      name == state.selectedIndex ? primaryColor : Colors.black12,
                  // boxShadow: [
                  //   BoxShadow(
                  //       blurRadius: 2,
                  //       color: greyColor,
                  //       offset: Offset(2, 2),
                  //       spreadRadius: 2),
                  // ],
                  ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://imgs.search.brave.com/Pljy0ZZfSVWcA-e6JDVI1x0cKvjt5Bc-Y1TScbYii-4/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9oaXBz/LmhlYXJzdGFwcHMu/Y29tL2htZy1wcm9k/L2ltYWdlcy9jaXR5/LWluLXRoZS12YWxs/ZXktYmVhdXRpZnVs/LXdpdGgtbGlnaHQt/Y29taW5nLXJveWFs/dHktZnJlZS1pbWFn/ZS0xNjkzNDE5NTEz/LmpwZz9jcm9wPTAu/NDQ3eHc6MS4wMHho/OzAuMDg1MHh3LDAm/cmVzaXplPTk4MDoq'),
                  ),
                  maxWidthSpan(),
                  Text(
                    name!,
                    style: name == state.selectedIndex
                        ? kkBoldTextStyle().copyWith(color: whiteColor)
                        : kkBoldTextStyle(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
