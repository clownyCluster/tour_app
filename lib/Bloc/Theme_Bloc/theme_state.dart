import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../Models/services/local_storage_service/local_storage_service.dart';

class ThemeState extends Equatable {
  final bool isDark;

  ThemeState({this.isDark = false});

  ThemeState copyWith({bool? isDark}) {
    return ThemeState(isDark: isDark ?? this.isDark);
  }

  @override
  List<Object?> get props => [isDark];
}
