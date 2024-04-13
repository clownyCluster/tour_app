import 'package:tour_destiny/Models/API_Models/Get_User_Models/get_user_model.dart';
import 'package:tour_destiny/Models/services/network_service/base_api_services.dart';
import 'package:tour_destiny/Models/services/network_service/network_api_services.dart';

class UserRepositoy {
  BaseApiServices apiServices;
  UserRepositoy({required this.apiServices});

  Future getUser() async {
    try {
      var response = await apiServices.getApiResponseServices('/users/me');
      UserModel userModel = UserModel.fromJson(response);
      return userModel;
    } catch (e) {
      rethrow;
    }
  }
}
