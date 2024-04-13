import 'dart:convert';

import 'package:tour_destiny/Models/services/network_response/api_response.dart';
import 'package:tour_destiny/Models/services/network_service/base_api_services.dart';
import 'package:tour_destiny/Models/services/network_service/network_api_services.dart';

class AuthRepository {
  final BaseApiServices? apiServices;

  AuthRepository({this.apiServices});

  Future<dynamic> loginUser(String email, String password) async {
    final data = {"email": email, 'password': password};
    print(email);
    print(password);
    try {
      final response =
          await apiServices!.postApiResponseServices('/users/login', data);
      print('you repo ko status ho $response');
      return response;
    } catch (e) {
      print('you repo ko status ho $e');

      rethrow;
    }
  }
}
