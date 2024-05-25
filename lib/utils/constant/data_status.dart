import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tour_destiny/Models/services/network_response/api_response.dart';
import 'package:tour_destiny/utils/constant/no_internet.dart';

import '../../Models/services/network_response/status.dart';

class CustomDataStatusWidget extends StatelessWidget {
  final DataStatus status;
  final Widget ?loadingStatus;
  final Widget successStatus;
  final Widget errorStatus;
  var checkResponse;

  CustomDataStatusWidget({
    required this.status, 
     this.loadingStatus,
    required this.successStatus,
    this.checkResponse,
    required this.errorStatus,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case DataStatus.Loading:
        return Center(child: loadingStatus);
      case DataStatus.Completed:
        return successStatus;
      case DataStatus.Error:
       if (checkResponse == '' || checkResponse == null) {
        return NoInternetScreen();
      }
        return errorStatus;
      default:
        return Container(); 
    }
  }
}
