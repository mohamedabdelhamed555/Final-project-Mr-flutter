import 'package:final_project/core/utils/add_router.dart';

import 'package:final_project/model/cubit/countries/get_contry_cubit.dart';
import 'package:final_project/model/cubit/leagues/cubit/get_leagues_cubit.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';

flutterfire configure
void main()  {
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
        // BlocProvider(create: (context) => TeamsCubit()),
        // BlocProvider(create: (context) => TopScorersCubit()),
        // BlocProvider(create: (context) => PlayersCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,

    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Kprimarycolor,

      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
