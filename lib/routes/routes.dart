part of 'routes_imports.dart';

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<CustomRoute> get routes => [
        CustomRoute(
            page: SplashPageRoute.page,
            initial: true,
            path: '/',
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            page: OnBoardingPageRoute.page,
            durationInMilliseconds: 300,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            page: CreateProfileRoute.page,
            durationInMilliseconds: 300,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            page: SelectLanguagePageRoute.page,
            durationInMilliseconds: 300,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            page: LearnLangPageRoute.page,
            durationInMilliseconds: 300,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            page: SelectQuizPageRoute.page,
            durationInMilliseconds: 300,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            page: HomePageRoute.page,
            durationInMilliseconds: 300,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            page: BottomNavBarRoute.page,
            durationInMilliseconds: 300,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            page: LearnLangPageRoute.page,
            durationInMilliseconds: 300,
            transitionsBuilder: TransitionsBuilders.fadeIn),
        CustomRoute(
            page: ProfilePageRoute.page,
            durationInMilliseconds: 300,
            transitionsBuilder: TransitionsBuilders.fadeIn),
      ];
}
