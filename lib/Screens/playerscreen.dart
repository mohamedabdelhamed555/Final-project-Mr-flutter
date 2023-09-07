import 'package:final_project/Widget/Side_Menu.dart';
import 'package:final_project/Widget/players.dart';
import 'package:final_project/model/cubit/players/cubit/get_players_cubit.dart';
import 'package:final_project/model/data/players_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

class playersScreen extends StatefulWidget {
  final String teamName;
  final int teamId;

  const playersScreen(
      {super.key, required this.teamName, required this.teamId});

  @override
  State<playersScreen> createState() => _playersScreenState();
}

class _playersScreenState extends State<playersScreen> {
  TextEditingController searchController = TextEditingController();
  late List<Result>? filteredList;
  void searchItems(List<Result>? playersList, String value) {
    filteredList = playersList!
        .where((element) =>
            element.playerName!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    context.read<GetPlayersCubit>().getTeamPlayer(widget.teamId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Center(child: Text('players of ${widget.teamName}')),
          backgroundColor: Color(0xff14142B),
          actions: [
            IconButton(
              icon: Image.asset('assets/images/tv.png'),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Color(0xff14142B),
        body: BlocBuilder<GetPlayersCubit, GetPlayersState>(
          builder: (context, state) {
            if (state is PlayersLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PlayersSuccess) {
              return ListView.builder(
                  itemCount: state.respose.result!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          backgroundColor: Color(0xff14142B),
                                          title: Text(
                                            state.respose.result![index]
                                                .playerName as String,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.2,
                                                  child: Image.network(state
                                                      .respose
                                                      .result![index]
                                                      .playerImage),
                                                ),
                                                Text(
                                                  "number : ${state.respose.result![index].playerNumber}",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  "country : ${state.respose.result![index].playerCountry}",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  "position :${state.respose.result![index].playerType}",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  "age :${state.respose.result![index].playerAge}",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  "yellow Cards : ${state.respose.result![index].playerYellowCards} ",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  "red Cards : ${state.respose.result![index].playerRedCards}",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  "goals :${state.respose.result![index].playerGoals}",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  "assists :${state.respose.result![index].playerAssists}",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                // Text("positions :${positions[i]}"),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                IconButton(
                                                  onPressed: () async {
                                                    String data =
                                                        "Name : ${state.respose.result![index].playerName as String} \nClub : ${state.respose.result![index].teamName}";
                                                    await Share.share(data);
                                                  },
                                                  icon: Icon(
                                                    Icons.share,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(65),
                                        color:
                                            Color.fromARGB(255, 145, 166, 184)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Column(
                                            children: [
                                              Text(
                                                state.respose.result![index]
                                                    .playerName as String,
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                state.respose.result![index]
                                                    .playerType as String,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromARGB(
                                                        255, 84, 82, 82)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: 70,
                                          backgroundColor: Colors.transparent,
                                          child: Image.network(
                                            state.respose.result![index]
                                                .playerImage,
                                            width: 80,
                                            height: 100,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ]),
                    );
                  });
            } else {
              return Center(
                child: const Text(
                  "something went wrong",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
          },
        ));
  }
}
