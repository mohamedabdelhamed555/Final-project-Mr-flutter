import 'package:final_project/Screens/leagues_screen.dart';
import 'package:final_project/Widget/Side_Menu.dart';
import 'package:final_project/model/cubit/countries/get_contry_cubit.dart';
import 'package:final_project/model/cubit/leagues/cubit/get_leagues_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Countries extends StatefulWidget {
  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Center(child: Text("Sports App")),
        backgroundColor: Color(0xff14142B),
        actions: [
          IconButton(
            icon: Image.asset('assets/images/tv.png'),
            onPressed: () {
              // Add your desired functionality here
            },
          ),
        ],
      ),
      backgroundColor: Color(0xff14142B),
      body: BlocBuilder<GetContryCubit, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is CountriesSuccess) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: state.response.result.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, index) {
                  return GridTile(
                    child: GestureDetector(
                      onTap: () {
                        state.response.result[index].countryKey;
                        context.read<GetLeaguesCubit>().getAllLeagues(
                            state.response.result[index].countryKey);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LeaguesScreen(
                              countryId:
                                  state.response.result[index].countryKey,
                              countryName:
                                  state.response.result[index].countryName,
                            ),
                          ),
                        );
                      },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              state.response.result[index].countryLogo ??
                                  'https://sc01.alicdn.com/kf/HTB1jgtqKFXXXXbkXpXXq6xXFXXXG/V-for-Vendetta-Anonymous-Guy-Fawkes-The.jpg',
                              width: 50,
                              height: 50,
                            ),
                            Text(
                              state.response.result[index].countryName,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
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
