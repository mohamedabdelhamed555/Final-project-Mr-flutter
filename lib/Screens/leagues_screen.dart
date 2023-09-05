// import 'package:final_project/Widget/teams_screen_view_body.dart';
// import 'package:final_project/model/cubit/leagues/cubit/get_leagues_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class LeaguesScreen extends StatelessWidget {
//   final String countryName;
//   final String logo;
//   final String countryId;

//   LeaguesScreen({
//     required this.countryName,
//     required this.logo,
//     required this.countryId,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff14142B),
//       appBar: AppBar(
//         title: Text('Leagues of $countryName'),
//         backgroundColor: Color(0xff14142B),
//       ),
//       body: BlocBuilder<GetLeaguesCubit, GetLeaguesState>(
//         builder: (context, state) {
//           if (state is LeaguesLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is LeaguesSuccess) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Image.network(logo),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute<void>(
//                           builder: (BuildContext context) =>
//                               const TeamsScreenViewBody(),
//                         ),
//                       );
//                     },
//                     child: Text(
//                       'Display leagues of $countryName',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             return Center(
//               child: ElevatedButton(
//                   onPressed: () {
//                     context.read<GetLeaguesCubit>().getAllLeagues(countryId);
//                   },
//                   child: const Text("Show leagues")),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:final_project/Widget/teams_screen_view_body.dart';
import 'package:flutter/material.dart';

class LeaguesScreen extends StatelessWidget {
  final String country;
  // final String countryName;
  // final String logo;
  // final String countryId;

  LeaguesScreen({
    required this.country,
    // required this.countryName,
    // required this.logo,
    // required this.countryId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff14142B),
      appBar: AppBar(
        title: Text('Leagues of $country'),
        backgroundColor: Color(0xff14142B),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const TeamsScreenViewBody(),
              ),
            );
          },
          child: Text(
            'Display leagues of $country',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
