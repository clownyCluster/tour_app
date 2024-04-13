
import 'package:flutter/material.dart';

class Utils {
  static  fieldFocusNode(
      BuildContext context, FocusNode nextFocues, FocusNode currentFocues) {
    currentFocues.unfocus();
    FocusScope.of(context).requestFocus(nextFocues);
  }
}
