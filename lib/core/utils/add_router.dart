import 'package:final_project/Screens/on_boarding_view.dart';

import 'package:final_project/Screens/teams_screen.dart';
import 'package:go_router/go_router.dart';

<<<<<<< HEAD
import '../../Screens/login_screen.dart';
import '../../Screens/players_screen.dart';
=======
>>>>>>> 6d746d0a7bdbd2f1999ba89957b61695c81f8799
import '../../Screens/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kOnBoardingView = '/OnBoardingView';
  static const kSearchView = '/SearchView';
  static const kLoginScreen = '/LoginScreen';
  static const kBookDetailsView = '/BookDetailsViewBody';
  static const kTeamsScreenView = '/TeamsScreenView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: kTeamsScreenView,
        builder: (context, state) => const TeamsScreenView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kLoginScreen,
        builder: (context, state) =>  LoginScreen(),
      ),
      // GoRoute(
      //   path: kBookDetailsView,
      //   builder: (context, state) => const BookDetailsView(),
      // ),
    ],
  );
}
