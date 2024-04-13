import 'package:tour_destiny/Bloc/Bookings_Bloc/bookings_bloc.dart';
import 'package:tour_destiny/Bloc/Login_cubit/login_cubit.dart';
import 'package:tour_destiny/Bloc/Profile_Bloc/profile_bloc.dart';
import 'package:tour_destiny/Bloc/Splash_Cubit/splash_cubit.dart';
import 'package:tour_destiny/Bloc/language_bloc/language_bloc.dart';
import 'package:tour_destiny/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/Home_Bloc/home_bloc.dart';
import '../Bloc/Theme_Bloc/theme_bloc.dart';
import '../Bloc/home_display_bloc/home_display_bloc.dart';
import 'package:provider/single_child_widget.dart';

class MultiProviderRoutes {
  List<SingleChildWidget> multiProvider = [
    BlocProvider(
      create: (_) => di.sl<HomeDisplayBloc>(),
    ),
    BlocProvider(
      create: (_) => di.sl<LoginCubit>(),
    ),
    BlocProvider(create: (_) => BookingsBloc()),
    BlocProvider(create: (_) => SplashCubit()),
    BlocProvider(create: (_) => di.sl<HomeBloc>()),
    BlocProvider(create: (_) => di.sl<ProfileBloc>()),
    BlocProvider(
      create: (_) => di.sl<ThemeBloc>(),
    ),
    BlocProvider(create: (_)=> LanguageBloc())
  ];
}
