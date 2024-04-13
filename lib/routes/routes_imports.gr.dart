// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/cupertino.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:tour_destiny/View/Auth/Login_Screen_Module/login_screen.dart'
    as _i5;
import 'package:tour_destiny/View/Auth/Splash_Module/splash_Screen.dart' as _i7;
import 'package:tour_destiny/View/pages/Details_Module/details_screen.dart'
    as _i2;
import 'package:tour_destiny/View/Screen/Booking_Module/booking_screen.dart'
    as _i1;
import 'package:tour_destiny/View/Screen/BottomNavbar/home_display_screen.dart'
    as _i3;
import 'package:tour_destiny/View/Screen/Home_Screen_Module/home_screen.dart'
    as _i4;
import 'package:tour_destiny/View/Screen/Profile_Module/profile_screen.dart'
    as _i6;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    BookingScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BookingScreen(),
      );
    },
    DetailsScreenRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsScreenRouteArgs>(
          orElse: () => const DetailsScreenRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DetailsScreen(
          key: args.key,
          des: args.des,
          imageList: args.imageList,
          image: args.image,
          ratings: args.ratings,
          name: args.name,
          price: args.price,
        ),
      );
    },
    HomeDisplayScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeDisplayScreenRouteArgs>(
          orElse: () => const HomeDisplayScreenRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.HomeDisplayScreen(key: args.key),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomeScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LoginScreenRouteArgs>(
          orElse: () => const LoginScreenRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.LoginScreen(key: args.key),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProfileScreen(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.BookingScreen]
class BookingScreenRoute extends _i8.PageRouteInfo<void> {
  const BookingScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          BookingScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookingScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DetailsScreen]
class DetailsScreenRoute extends _i8.PageRouteInfo<DetailsScreenRouteArgs> {
  DetailsScreenRoute({
    _i9.Key? key,
    String? des,
    List<String>? imageList,
    String? image,
    String? ratings,
    String? name,
    String? price,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          DetailsScreenRoute.name,
          args: DetailsScreenRouteArgs(
            key: key,
            des: des,
            imageList: imageList,
            image: image,
            ratings: ratings,
            name: name,
            price: price,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsScreenRoute';

  static const _i8.PageInfo<DetailsScreenRouteArgs> page =
      _i8.PageInfo<DetailsScreenRouteArgs>(name);
}

class DetailsScreenRouteArgs {
  const DetailsScreenRouteArgs({
    this.key,
    this.des,
    this.imageList,
    this.image,
    this.ratings,
    this.name,
    this.price,
  });

  final _i9.Key? key;

  final String? des;

  final List<String>? imageList;

  final String? image;

  final String? ratings;

  final String? name;

  final String? price;

  @override
  String toString() {
    return 'DetailsScreenRouteArgs{key: $key, des: $des, imageList: $imageList, image: $image, ratings: $ratings, name: $name, price: $price}';
  }
}

/// generated route for
/// [_i3.HomeDisplayScreen]
class HomeDisplayScreenRoute
    extends _i8.PageRouteInfo<HomeDisplayScreenRouteArgs> {
  HomeDisplayScreenRoute({
    _i10.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          HomeDisplayScreenRoute.name,
          args: HomeDisplayScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeDisplayScreenRoute';

  static const _i8.PageInfo<HomeDisplayScreenRouteArgs> page =
      _i8.PageInfo<HomeDisplayScreenRouteArgs>(name);
}

class HomeDisplayScreenRouteArgs {
  const HomeDisplayScreenRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'HomeDisplayScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreenRoute extends _i8.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginScreen]
class LoginScreenRoute extends _i8.PageRouteInfo<LoginScreenRouteArgs> {
  LoginScreenRoute({
    _i10.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          LoginScreenRoute.name,
          args: LoginScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginScreenRoute';

  static const _i8.PageInfo<LoginScreenRouteArgs> page =
      _i8.PageInfo<LoginScreenRouteArgs>(name);
}

class LoginScreenRouteArgs {
  const LoginScreenRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'LoginScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileScreenRoute extends _i8.PageRouteInfo<void> {
  const ProfileScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          ProfileScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashScreen]
class SplashScreenRoute extends _i8.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
