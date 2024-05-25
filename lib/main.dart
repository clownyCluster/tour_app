import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tour_destiny/Bloc/Theme_Bloc/theme_bloc.dart';
import 'package:tour_destiny/Bloc/Theme_Bloc/theme_state.dart';
import 'package:tour_destiny/Bloc/home_display_bloc/home_display_bloc.dart';
import 'package:tour_destiny/Bloc/language_bloc/language_bloc.dart';
import 'package:tour_destiny/Models/services/Theme/light_theme.dart';
import 'package:tour_destiny/View/Screen/BottomNavbar/home_display_screen.dart';
import 'package:tour_destiny/routes/multi_bloc_provider.dart';
import 'package:tour_destiny/injection.dart';
import 'package:tour_destiny/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_destiny/utils/localization/app_localization.dart';

import 'Models/services/Theme/dark_theme.dart';
import 'package:oktoast/oktoast.dart';
import 'Models/services/local_storage_service/local_storage_service.dart';
import 'data/cart/cart_details.dart';
import 'routes/routes_imports.dart';
import 'package:tour_destiny/injection.dart' as di;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/adapters.dart';

import 'utils/constant/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var folder = await getApplicationDocumentsDirectory();
  await LocalStorageService.init();
  await di.init();
  await Hive.initFlutter();
  Hive.init(folder.path);
  Hive.registerAdapter(CartDetailsAdapter());
  await Hive.openBox<CartDetails>('cart');

  runApp(Destiny());
}

class Destiny extends StatelessWidget {
  const Destiny({super.key});

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();

    return MultiBlocProvider(
      providers: MultiProviderRoutes().multiProvider,
      child: OKToast(
        child: BlocProvider(
          create: (context) => LanguageBloc(),
          child: BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              return BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, themeState) {
                final String languageLocale =
                    LocalStorageService.read(LocalStorageKeys.language) ?? 'en';
                final themeMode =
                    AppConstants().appTheme ? ThemeMode.light : ThemeMode.dark;
                return MaterialApp.router(
                  locale: Locale(languageLocale),
                  supportedLocales: AppConstants.supportedLanguages,
                  localizationsDelegates: const [
                    AppLocalization.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  routerConfig: _appRouter.config(),
                  theme: lightTheme, // Default light theme
                  themeMode: themeMode,
                  darkTheme: darkTheme, // Default dark theme
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
