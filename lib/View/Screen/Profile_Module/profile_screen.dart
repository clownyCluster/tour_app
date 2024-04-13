import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tour_destiny/Bloc/Theme_Bloc/theme_bloc.dart';
import 'package:tour_destiny/Bloc/language_bloc/language_bloc.dart';
import 'package:tour_destiny/routes/routes_imports.gr.dart';
import 'package:tour_destiny/utils/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_destiny/utils/constant/theme_container.dart';
import 'package:tour_destiny/utils/localization/app_constraints.dart';

import '../../../Bloc/Profile_Bloc/profile_bloc.dart';
import '../../../Bloc/Theme_Bloc/theme_state.dart';
import '../../../Models/services/local_storage_service/local_storage_service.dart';
import '../../../utils/localization/english_text.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void showLanguageSelectionModal(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return ThemeContainer(
            
            height: 200, // Set the desired height for the modal sheet
            padding: EdgeInsets.all(16.0), // Padding for the content
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Change Language',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 16), // Add space between title and options

                // Option for English language
                ListTile(
                  title: Text('🇺🇸  English'),
                  onTap: () {
                    // Change language to English
                    context
                        .read<LanguageBloc>()
                        .add(ChangeLanguage(locale: const Locale('en')));

                    // Close the modal sheet
                    Navigator.pop(context);
                  },
                ),
                // Option for Nepali language
                ListTile(
                  title: Text('🇳🇵 Nepali'),
                  onTap: () {
                    // Change language to Nepali
                    context
                        .read<LanguageBloc>()
                        .add(ChangeLanguage(locale: const Locale('ne')));

                    // Close the modal sheet
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Container(
        padding: kStandardPadding(),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return state.isLoading == true
                ? Center(child: CircularProgressIndicator.adaptive())
                : Column(
                    children: [
                      LSizedBox(),
                      LSizedBox(),
                      Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: CachedNetworkImageProvider(
                                  '$users_url/${state.userModel!.data.photo}'),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: CircleAvatar(
                                backgroundColor: whiteColor,
                                radius: 18,
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.edit,
                                    size: 20,
                                  ),
                                  radius: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(state.userModel!.data.name),
                      Text(state.userModel!.data.email),
                      BlocBuilder<ThemeBloc, ThemeState>(
                        builder: (context, state) {
                          print(state.isDark);

                          return ProfileTiles(
                            icon: LocalStorageService.getTheme() == 'light'
                                ? Icons.dark_mode_outlined
                                : Icons.light_mode_sharp,
                            title: LocalStorageService.getTheme() == 'light'
                                ? getTranslated('darkTheme', context)
                                : getTranslated('lightTheme', context),
                            trailing: Switch(
                              value: LocalStorageService.getTheme() == 'light'
                                  ? false
                                  : true,
                              onChanged: (value) {
                                context
                                    .read<ThemeBloc>()
                                    .add(OnToggleThemeEvent(isDark: value));
                              },
                            ),
                          );
                        },
                      ),
                      BlocBuilder<LanguageBloc, LanguageState>(
                        builder: (context, state) {
                          return ProfileTiles(
                            title: getTranslated('language', context),
                            icon: Icons.translate,
                            onTap: () {
                              showLanguageSelectionModal(context);
                            },
                            // trailing: Switch(
                            //   value: true,
                            //   onChanged: (value) {
                            //     if (value == true) {
                            //       context.read<LanguageBloc>().add(
                            //           ChangeLanguage(
                            //               locale: const Locale('ne')));
                            //     } else {
                            //       context.read<LanguageBloc>().add(
                            //           ChangeLanguage(
                            //               locale: const Locale('en')));
                            //     }
                            //   },
                            // ),
                          );
                        },
                      ),
                      ProfileTiles(
                        title: getTranslated('updateProfile', context) ,
                        icon: Icons.person,
                        onTap: () {},
                      ),
                      ProfileTiles(
                        title: getTranslated('accountSettings', context),
                        icon: Icons.settings,
                        onTap: () {},
                      ),
                      ProfileTiles(
                        title: getTranslated('orderHistory', context),
                        icon: Icons.history,
                        onTap: () {},
                      ),
                      ProfileTiles(
                        title: getTranslated('privacySettings', context),
                        icon: Icons.lock,
                        onTap: () {},
                      ),
                      ProfileTiles(
                        title: getTranslated('logout', context),
                        icon: Icons.logout,
                        onTap: () {
                          LocalStorageService.clear(
                              LocalStorageKeys.accessToken);
                          AutoRouter.of(context).pushAll([LoginScreenRoute()]);
                        },
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}

class ProfileTiles extends StatelessWidget {
  String? title;
  IconData? icon;
  void Function()? onTap;
  Widget? trailing;
  ProfileTiles({
    super.key,
    this.trailing,
    this.title,
    this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon!),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        dense: true,
        trailing: trailing,
        title: Text(
          title!,
          style: kkBoldTextStyle(),
        ),
      ),
    );
  }
}
