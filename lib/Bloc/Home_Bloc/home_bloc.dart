import 'package:bloc/bloc.dart';
import 'package:tour_destiny/Models/API_Models/top5_tour_model/top_five_tours.dart';
import 'package:tour_destiny/Models/Repository/get_tours_repositoy.dart';
import 'package:tour_destiny/Models/Repository/top_five_repo.dart';
import 'package:tour_destiny/Models/Repository/tours_list.dart';
import 'package:tour_destiny/Models/services/network_response/api_response.dart';
import 'package:tour_destiny/Models/services/network_response/status.dart';
import 'package:equatable/equatable.dart';

import '../../Models/API_Models/tours_models/tours_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetToursRepository getToursRepository;
  final TopFiveRepository topFiveRepository;

  HomeBloc({
    required this.getToursRepository,
    required this.topFiveRepository,
  }) : super(HomeState(
          apiResponse: ApiResponse.loading(),
          topFiveResponse: ApiResponse.loading(),
        )) {
    on<OnSelectedIndexEvent>(_onSelectedIndexEvent);
    _getTours();
  }

  void _onSelectedIndexEvent(
    OnSelectedIndexEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(selectedIndex: event.selectedIndex));
  }

  // Retrieve tours and handle success and error cases
  Future<void> _getTours() async {
    try {
      final tours = await getToursRepository.getTours();
      setTourResponse(ApiResponse.completed(tours));
      _getTopFive();
    } catch (error) {
      setTourResponse(ApiResponse.error(error.toString()));
      print(error); // Consider using a logging package instead
    }
  }

  // Update the apiResponse state with the provided response
  void setTourResponse(ApiResponse<ToursModel> response) {
    emit(state.copyWith(apiResponse: response));
  }

  // Retrieve top five tours and handle success and error cases
  Future<void> _getTopFive() async {
    try {
      final topFiveTours = await topFiveRepository.getTopFive();
      setTopFiveTours(ApiResponse.completed(topFiveTours));
    } catch (error) {
      setTopFiveTours(ApiResponse.error(error.toString()));
      print(error); // Consider using a logging package instead
    }
  }

  // Update the topFiveResponse state with the provided response
  void setTopFiveTours(ApiResponse<TopFiveModel> response) {
    emit(state.copyWith(topFiveResponse: response));
  }
}
