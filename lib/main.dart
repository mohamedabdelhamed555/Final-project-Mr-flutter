import 'package:final_project/Screens/countries_screen.dart';
import 'package:final_project/Screens/on_boarding_view.dart';
import 'package:final_project/Screens/home_screen.dart';
import 'package:final_project/core/utils/add_router.dart';
import 'package:final_project/model/cubit/cubit/get_contry_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  runApp(final_project());
}

class final_project extends StatelessWidget {
  const final_project({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
