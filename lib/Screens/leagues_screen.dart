import 'package:final_project/Screens/teams_screen.dart';
import 'package:final_project/Widget/Side_Menu.dart';
import 'package:final_project/model/cubit/leagues/cubit/get_leagues_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaguesScreen extends StatelessWidget {
  final String countryName;
  final int countryId;

  LeaguesScreen({
    required this.countryName,
    required this.countryId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      backgroundColor: Color(0xff14142B),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Image.asset('assets/images/tv.png'),
            onPressed: () {},
          ),
        ],
        title: Text('Leagues of $countryName'),
        backgroundColor: Color(0xff14142B),
      ),
      body: BlocBuilder<GetLeaguesCubit, GetLeaguesState>(
        builder: (context, state) {
          if (state is LeaguesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is LeaguesSuccess) {
            return ListView.builder(
              itemCount: state.response.result!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.network(
                        state.response.result![index].leagueLogo ??
                            "https://e7.pngegg.com/pngimages/555/717/png-clipart-anonymous-art-anonymous-logo-anonymity-anonymous-user-tor.png",
                        width: 65,
                        height: 65,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  TeamsScreenViewBody(
                                leagueId: state
                                    .response.result![index].leagueKey as int,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          state.response.result![index].leagueName as String,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: const Text(
                "something went wrong",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
