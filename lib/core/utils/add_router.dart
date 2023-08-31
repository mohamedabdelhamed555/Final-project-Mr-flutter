import 'package:final_project/Screens/teams_screen.dart';
import 'package:go_router/go_router.dart';

import '../../Screens/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kSearchView = '/SearchView';
  static const kBookDetailsView = '/BookDetailsViewBody';
  static const kTeamsScreenView = '/TeamsScreenView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kTeamsScreenView,
        builder: (context, state) => const TeamsScreenView(),
      ),
      // GoRoute(
      //   path: kHomeView,
      //   builder: (context, state) => const HomeView(),
      // ),
      // GoRoute(
      //   path: kSearchView,
      //   builder: (context, state) => const SearchView(),
      // ),
      // GoRoute(
      //   path: kBookDetailsView,
      //   builder: (context, state) => const BookDetailsView(),
      // ),
    ],
  );
}
