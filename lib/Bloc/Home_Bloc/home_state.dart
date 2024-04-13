part of 'home_bloc.dart';

class HomeState extends Equatable {
  String selectedIndex;
  ToursModel? tourModel;
  // ApiResponse<ToursModel> apiResponse;
  ApiResponse<ToursModel> apiResponse = ApiResponse.loading();
  ApiResponse<TopFiveModel> topFiveResponse;
  

  HomeState({
    this.selectedIndex = 'Top Pick',
    this.tourModel,
    required this.apiResponse,
    required this.topFiveResponse,
  });

  HomeState copyWith({
    String? selectedIndex,
    ToursModel? tourModel,
    ApiResponse<ToursModel>? apiResponse,
    ApiResponse<TopFiveModel>? topFiveResponse,
  TopFiveModel? topFiveModel,
  }) {
    return HomeState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        tourModel: tourModel ?? this.tourModel,
        apiResponse: apiResponse ?? this.apiResponse,
        topFiveResponse: topFiveResponse ?? this.topFiveResponse);
  }

  @override
  List<Object?> get props => [
        selectedIndex,
        tourModel,
        apiResponse,
        topFiveResponse
      ];
}
