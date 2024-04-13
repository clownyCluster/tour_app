import 'package:tour_destiny/Models/API_Models/top5_tour_model/top_five_tours.dart';
import 'package:tour_destiny/Models/services/network_service/base_api_services.dart';

import '../API_Models/tours_models/tours_model.dart';

class GetToursRepository {
  BaseApiServices apiServices;
  GetToursRepository({required this.apiServices});

  Future getTours() async {
    try {
      var response = await apiServices.getApiResponseServices('/tours');
      ToursModel toursModel = ToursModel.fromJson(response);
      return toursModel;
    } catch (e) {
      rethrow;
    }
  }

  Future getTopFive() async {
    try {
      var response =
          await apiServices.getApiResponseServices('/tours/top-five-cheap');
      TopFiveModel topFiveModel = TopFiveModel.fromJson(response);
      return topFiveModel;
    } catch (e) {
      rethrow;
    }
  }
}
