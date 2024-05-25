import 'package:tour_destiny/Bloc/Bookings_Bloc/bookings_bloc.dart';
import 'package:tour_destiny/Bloc/Home_Bloc/home_bloc.dart';
import 'package:tour_destiny/Bloc/Login_cubit/login_cubit.dart';
import 'package:tour_destiny/Bloc/Profile_Bloc/profile_bloc.dart';
import 'package:tour_destiny/Bloc/Theme_Bloc/theme_bloc.dart';
import 'package:tour_destiny/Bloc/language_bloc/language_bloc.dart';
import 'package:tour_destiny/Models/Repository/auth_repository.dart';
import 'package:tour_destiny/Models/Repository/get_tours_repositoy.dart';
import 'package:tour_destiny/Models/Repository/top_five_repo.dart';
import 'package:tour_destiny/Models/Repository/user_repository.dart';
import 'package:tour_destiny/Models/services/network_service/network_api_services.dart';
import 'package:tour_destiny/utils/constant/constant.dart';
import 'package:get_it/get_it.dart';

import 'package:tour_destiny/Bloc/home_display_bloc/home_display_bloc.dart';

import 'Models/services/network_service/base_api_services.dart';

final sl = GetIt.instance;
Future<void> init() async {
// core
  sl.registerLazySingleton<BaseApiServices>(() => NetworkApiServices(
        baseUrl: base_url,
      ));
  // Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepository(apiServices: sl()));
  sl.registerLazySingleton<GetToursRepository>(
      () => GetToursRepository(apiServices: sl()));
  sl.registerLazySingleton(() => UserRepositoy(apiServices: sl()));
  sl.registerLazySingleton(() => TopFiveRepository(apiServices: sl()));



// bloc

  sl.registerLazySingleton<HomeDisplayBloc>(() => HomeDisplayBloc());
  sl.registerFactory<HomeBloc>(
      () => HomeBloc(getToursRepository: sl(), topFiveRepository: sl()));
  sl.registerFactory(() => ThemeBloc());
  sl.registerFactory(() => ProfileBloc(userRepositoy: sl()));
  sl.registerFactory(() => BookingsBloc());
  sl.registerFactory(() => LanguageBloc());


  sl.registerFactory(() => LoginCubit(
        authRepository: sl(),
      ));
}
