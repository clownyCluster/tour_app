import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tour_destiny/Models/services/local_storage_service/local_storage_service.dart';
import 'package:tour_destiny/Models/services/network_response/app_exception.dart';
import 'package:tour_destiny/Models/services/toast_service.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  late String baseUrl;
  late String token;
  late Dio dio;

  NetworkApiServices({
    required this.baseUrl,
  }) {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
    token = LocalStorageService.read(LocalStorageKeys.accessToken) ?? '';
  }

  @override
  Future<dynamic> getApiResponseServices(String url) async {
    var token = LocalStorageService.read(LocalStorageKeys.accessToken);

    try {
      print('yo full url ho $baseUrl$url');
      final response = await dio.get(
        '$baseUrl$url',
        options: Options(
          headers: _getHeaders(token!),
        ),
      );
      return _returnResponse(response);
    } on SocketException {
      _handleSocketException();
    } on DioError catch (e) {
      _handleDioException(e);
    }
  }

  @override
  Future<dynamic> postApiResponseServices(String url, dynamic data) async {
    var token = await LocalStorageService.read(LocalStorageKeys.accessToken) ?? '';

    print('yo full url ho $baseUrl$url');
    print('yo token ho $token');
    print(data);
    try {
      final response = await dio.post(
        '$baseUrl$url',
        data: data,
        options: Options(
          headers: _getHeaders(token),
        ),
      );

      return _returnResponse(response);
    } on SocketException {
      _handleSocketException();
    } on DioError catch (e) {
      _handleDioException(e);
    }
  }

  @override
  Future<dynamic> deleteApiResponseServices(String url, dynamic data) async {
    var token = await LocalStorageService.read(LocalStorageKeys.accessToken) ?? '';

    try {
      final response = await dio.delete(
        '$baseUrl$url',
        data: data,
        options: Options(
          headers: _getHeaders(token),
        ),
      );
      return _returnResponse(response);
    } on SocketException {
      _handleSocketException();
    } on DioError catch (e) {
      _handleDioException(e);
    }
  }

  @override
  Future<dynamic> patchApiResponseServices(String url, dynamic data) async {
    var token = await LocalStorageService.read(LocalStorageKeys.accessToken) ?? '';

    try {
      final response = await dio.patch(
        '$baseUrl$url',
        data: data,
        options: Options(
          headers: _getHeaders(token),
        ),
      );
      return _returnResponse(response);
    } on SocketException {
      _handleSocketException();
    } on DioError catch (e) {
      _handleDioException(e);
    }
  }

  Map<String, String> _getHeaders(String headerToken) {
    return {
      'Authorization': 'Bearer $headerToken',
      "Content-Type": "application/json"
      // 'apikey': 'elab-ktmrush-api-v1-2023',
      // 'Accept':'application/json',
    };
  }

  dynamic _returnResponse(Response response) {
    print("Yo response ko data ho ${response.data}");
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw BadRequestException('Invalid URL');
      case 401:
        throw BadRequestException('Invalid Account Details');
      case 404:
        throw UnAuthorizedException('Invalid URL');
      default:
        throw Exception('Error communicating with server');
    }
  }

  void _handleDioException(DioError e) {
    print('Dio Error: ${e.message}');
    print('Response Status Code: ${e.response?.statusCode}');
    print('Response Data: ${e.response?.data}');

    if (e.response?.data != null && e.response?.data['message'] != null) {
      print('Error Message: ${e.response!.data['message']}');
      ToastService().e(e.response!.data['message']);
    } else {
      print(e.response);
      ToastService()
          .e(
            'No internet connection',
          )
          .timer;
      _handleSocketException();
    }
    throw AppException(FetchDataException, 'rrrr');
  }

  void _handleSocketException() {
    
    throw FetchDataException('No internet connection');
  }
}


// class NetworkApiServices extends BaseApiServices {
//   String baseUrl;
//   var token = LocalStorageService.read('accessToken');
//   NetworkApiServices({required this.baseUrl});

//   @override
//   Future<dynamic> getApiResponseServices(String url) async {
//     try {
//       print('yo full url ho $baseUrl$url');
//       final response = await http
//           .get(
//             Uri.parse('$baseUrl$url'),
//             // headers: _getHeaders(),
//           )
//           .timeout(Duration(minutes: 1));
//       return _returnResponse(response);
//     } on SocketException {
//       _handleSocketException();
//     }
//   }

//   @override
//   Future<dynamic> postApiResponseServices(String url, dynamic data) async {
//     print('yo full url ho $baseUrl$url');
//     print('yo token ho $token');
//     print(data);
//     try {
//       final response = await http.post(Uri.parse('$baseUrl$url'),
//           body: jsonEncode(data),
//           // headers: _getHeaders(),
//           headers: {'Content-Type': 'application/json'});
//       print('yo postgardako ${response.statusCode}');
//       print('yo post garda ko response ${response.body}');

//       return _returnResponse(response);
//     } on SocketException {
//       _handleSocketException();
//     }
//   }

//   @override
//   Future<dynamic> deleteApiResponseServices(String url, dynamic data) async {
//     try {
//       final response = await http.delete(
//         Uri.parse('$baseUrl$url'),
//         body: jsonEncode(data),
//         headers: _getHeaders(),
//       );
//       return _returnResponse(response);
//     } on SocketException {
//       _handleSocketException();
//     }
//   }

//   @override
//   Future<dynamic> patchApiResponseServices(String url, dynamic data) async {
//     try {
//       final response = await http.patch(
//         Uri.parse('$baseUrl$url'),
//         body: jsonEncode(data),
//         headers: _getHeaders(),
//       );
//       return _returnResponse(response);
//     } on SocketException {
//       _handleSocketException();
//     }
//   }

  // Map<String, String> _getHeaders() {
  //   return {
  //     // 'Authorization': 'Bearer $token',
  //     "Content-Type": "application/json"
  //     // 'apikey': 'elab-ktmrush-api-v1-2023',
  //     // 'Accept':'application/json',
  //   };
  // }

//   dynamic _returnResponse(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         return jsonDecode(response.body);
//       case 400:
//         throw BadRequestException('Invalid URL');
//       case 401:
//         throw BadRequestException('Invalid Account Details');
//       case 404:
//         throw UnAuthorizedException('Invalid URL');
//       default:
//         throw Exception('Error communicating with server');
//     }
//   }

//   void _handleSocketException() {
//     print('No internet connection');
//     throw FetchDataException('No internet connection');
//   }
// }
