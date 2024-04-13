import 'package:flutter/material.dart';
import 'package:tour_destiny/Models/Repository/language_model.dart';

import '../Models/services/local_storage_service/local_storage_service.dart';

class AppConstants {
  String theme = 'theme';
  var appTheme = LocalStorageService.getTheme() == 'light';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: '',
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
    LanguageModel(
        imageUrl: '',
        languageName: 'Nepali',
        countryCode: 'NP',
        languageCode: 'ne'),
  ];

  static const List<Locale> supportedLanguages = [
    Locale('en', 'US'), // English
    Locale('ne', 'NP'), // Nepali
  ];
}
