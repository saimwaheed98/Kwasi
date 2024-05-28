// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:kwasi/pages/choose_type/presentation/ui/choose_type_page.dart'
    as _i9;
import 'package:kwasi/pages/create_profile/presentation/ui/create_profile.dart'
    as _i2;
import 'package:kwasi/pages/home/presentation/ui/home_page.dart' as _i3;
import 'package:kwasi/pages/language/presentation/ui/select_language.dart'
    as _i8;
import 'package:kwasi/pages/learn_lang/ui/learn_lang_page.dart' as _i4;
import 'package:kwasi/pages/learning_words/ui/learnings_words_page.dart' as _i5;
import 'package:kwasi/pages/navBar/ui/bottom_nav_bar.dart' as _i1;
import 'package:kwasi/pages/onBoarding/presentation/ui/on_boarding_page.dart'
    as _i6;
import 'package:kwasi/pages/profile/ui/profile_page.dart' as _i7;
import 'package:kwasi/pages/splash/splash_page.dart' as _i10;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    BottomNavBarRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BottomNavBar(),
      );
    },
    CreateProfileRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CreateProfile(),
      );
    },
    HomePageRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    LearnLangPageRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LearnLangPage(),
      );
    },
    LearningWordsPageRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LearningWordsPage(),
      );
    },
    OnBoardingPageRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.OnBoardingPage(),
      );
    },
    ProfilePageRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProfilePage(),
      );
    },
    SelectLanguagePageRoute.name: (routeData) {
      final args = routeData.argsAs<SelectLanguagePageRouteArgs>(
          orElse: () => const SelectLanguagePageRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.SelectLanguagePage(key: args.key),
      );
    },
    SelectQuizPageRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SelectQuizPage(),
      );
    },
    SplashPageRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BottomNavBar]
class BottomNavBarRoute extends _i11.PageRouteInfo<void> {
  const BottomNavBarRoute({List<_i11.PageRouteInfo>? children})
      : super(
          BottomNavBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavBarRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CreateProfile]
class CreateProfileRoute extends _i11.PageRouteInfo<void> {
  const CreateProfileRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CreateProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateProfileRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomePageRoute extends _i11.PageRouteInfo<void> {
  const HomePageRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LearnLangPage]
class LearnLangPageRoute extends _i11.PageRouteInfo<void> {
  const LearnLangPageRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LearnLangPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LearnLangPageRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LearningWordsPage]
class LearningWordsPageRoute extends _i11.PageRouteInfo<void> {
  const LearningWordsPageRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LearningWordsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LearningWordsPageRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OnBoardingPage]
class OnBoardingPageRoute extends _i11.PageRouteInfo<void> {
  const OnBoardingPageRoute({List<_i11.PageRouteInfo>? children})
      : super(
          OnBoardingPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingPageRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ProfilePage]
class ProfilePageRoute extends _i11.PageRouteInfo<void> {
  const ProfilePageRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ProfilePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePageRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SelectLanguagePage]
class SelectLanguagePageRoute
    extends _i11.PageRouteInfo<SelectLanguagePageRouteArgs> {
  SelectLanguagePageRoute({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          SelectLanguagePageRoute.name,
          args: SelectLanguagePageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SelectLanguagePageRoute';

  static const _i11.PageInfo<SelectLanguagePageRouteArgs> page =
      _i11.PageInfo<SelectLanguagePageRouteArgs>(name);
}

class SelectLanguagePageRouteArgs {
  const SelectLanguagePageRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'SelectLanguagePageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.SelectQuizPage]
class SelectQuizPageRoute extends _i11.PageRouteInfo<void> {
  const SelectQuizPageRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SelectQuizPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectQuizPageRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SplashPage]
class SplashPageRoute extends _i11.PageRouteInfo<void> {
  const SplashPageRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashPageRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
