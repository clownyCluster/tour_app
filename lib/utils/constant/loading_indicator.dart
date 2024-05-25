import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CostomLoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoActivityIndicator();
    } else {
      return CircularProgressIndicator();
    }
  }
}