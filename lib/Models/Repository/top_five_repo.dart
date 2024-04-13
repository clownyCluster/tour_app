import 'package:tour_destiny/Models/services/network_response/api_response.dart';
import 'package:tour_destiny/Models/services/network_service/base_api_services.dart';

import '../API_Models/top5_tour_model/top_five_tours.dart';

class TopFiveRepository {
  BaseApiServices apiServices;
  TopFiveRepository({required this.apiServices});

  Future<TopFiveModel> getTopFive() async {
    try {
      var response =
          await apiServices.getApiResponseServices('/tours/top-five-cheap');
      TopFiveModel topFiveModel = TopFiveModel.fromJson(response);
      return topFiveModel;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
