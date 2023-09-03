import 'package:final_project/core/utils/add_router.dart';
<<<<<<< HEAD
import 'package:final_project/Screens/players_screen.dart';
=======
import 'package:final_project/model/cubit/cubit/get_contry_cubit.dart';
>>>>>>> 6d746d0a7bdbd2f1999ba89957b61695c81f8799
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';

void main() {
  runApp(final_project());
}

class final_project extends StatelessWidget {
  const final_project({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Kprimarycolor,
=======
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetContryCubit>(
          create: (BuildContext context) => GetContryCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData(
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
>>>>>>> 6d746d0a7bdbd2f1999ba89957b61695c81f8799
      ),

      debugShowCheckedModeBanner: false,

    );
  }
}
