import 'package:final_project/Screens/countries_screen.dart';
import 'package:final_project/Screens/on_boarding_view.dart';
import 'package:final_project/core/utils/add_router.dart';
import 'package:final_project/model/cubit/countries/get_contry_cubit.dart';
import 'package:final_project/model/cubit/leagues/cubit/get_leagues_cubit.dart';
import 'package:final_project/model/cubit/players/cubit/get_players_cubit.dart';
import 'package:final_project/model/cubit/teams/get_teams_cubit.dart';
import 'package:final_project/model/cubit/top_score/get_top_scores_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';

void main() {
  runApp(const FinalProject()); // Use the correct class name
}

class FinalProject extends StatelessWidget {
  const FinalProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetContryCubit()),
        BlocProvider(create: (context) => GetLeaguesCubit()),
        BlocProvider(create: (context) => GetTeamsCubit()),
        BlocProvider(create: (context) => GetTopScoresCubit()),
        BlocProvider(create: (context) => GetPlayersCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: Kprimarycolor,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
