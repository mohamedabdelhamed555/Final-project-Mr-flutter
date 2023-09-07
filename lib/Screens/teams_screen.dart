import 'package:final_project/Screens/playerscreen.dart';
import 'package:final_project/Widget/Side_Menu.dart';
import 'package:final_project/Widget/custom_grid_item.dart';
import 'package:final_project/Widget/custom_search_text_feild.dart';
import 'package:final_project/model/cubit/players/cubit/get_players_cubit.dart';
import 'package:final_project/model/cubit/teams/get_teams_cubit.dart';
import 'package:final_project/model/cubit/top_score/get_top_scores_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants.dart';

class TeamsScreenViewBody extends StatefulWidget {
  final int leagueId;
  const TeamsScreenViewBody({Key? key, required this.leagueId})
      : super(key: key);

  @override
  _TeamsScreenViewBodyState createState() => _TeamsScreenViewBodyState();
}

class _TeamsScreenViewBodyState extends State<TeamsScreenViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetTeamsCubit()..getAllTeams(widget.leagueId),
        ),
        BlocProvider(
            create: (context) =>
                GetTopScoresCubit()..getTopScorers(widget.leagueId)),
      ],
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Kprimarycolor,
          title: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TabBar(
              dividerColor: Colors.white,
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.white,
              controller: _tabController,
              tabs: [
                Tab(
                  text: 'specific team',
                ),
                Tab(text: 'top scorers'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            BlocBuilder<GetTeamsCubit, GetTeamsState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .7 / 8,
                          width: double.infinity,
                          child: CustomSearchTextField()),
                      ...BlocProvider.of<GetTeamsCubit>(context).teams.map(
                            (e) => GestureDetector(
                              onTap: () {
                                context
                                    .read<GetPlayersCubit>()
                                    .getTeamPlayer(e.teamKey as int);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        playersScreen(
                                      teamId: e.teamKey as int,
                                      teamName: e.teamName as String,
                                    ),
                                  ),
                                );
                              },
                              child: GridItemTeams(
                                imageUrl: e.teamLogo ?? "",
                                text: e.teamName ?? "",
                              ),
                            ),
                          )
                    ],
                  ),
                );
              },
            ),
            BlocBuilder<GetTopScoresCubit, GetTopScoresState>(
              builder: (context, state) {
                return ListView(
                  children: [
                    ...BlocProvider.of<GetTopScoresCubit>(context).topScore.map(
                          (e) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              child: Column(children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        e.playerName as String,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
