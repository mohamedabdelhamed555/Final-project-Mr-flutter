import 'package:final_project/Screens/playerscreen.dart';
import 'package:final_project/Widget/custom_search_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';
import 'custom_grid_item.dart';

class TeamsScreenViewBody extends StatefulWidget {
  const TeamsScreenViewBody({Key? key}) : super(key: key);

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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * .7 / 8,
                    width: double.infinity,
                    child: CustomSearchTextField()),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 6 / 8,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const playersScreen(),
                        ),
                      );
                    },
                    child: GridItemTeams(
                      imageUrl:
                          'https://upload.wikimedia.org/wikipedia/ar/4/4c/%D8%B4%D8%B9%D8%A7%D8%B1_%D9%86%D8%A7%D8%AF%D9%8A_%D8%A7%D9%84%D8%B2%D9%85%D8%A7%D9%84%D9%83_%D8%A7%D9%84%D9%85%D8%B5%D8%B1%D9%8A.png',
                      text: 'Zamalek',
                    ),
                  ),
                ),
              ],
            ),
          ),
          GridView.count(
            crossAxisCount: 4,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/salah.png',
                    height: 180,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                  Text('Salah'),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Image.network(
                    'https://alamphoto.com/wp-content/uploads/2021/04/%D8%B5%D9%88%D8%B1-%D9%85%D8%AD%D9%85%D8%AF-%D8%B5%D9%84%D8%A7%D8%AD-%D8%A8%D8%AC%D9%88%D8%AF%D8%A9-%D8%B9%D8%A7%D9%84%D9%8A%D8%A9-2022.jpg',
                    height: 180,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                  Text('Salah'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
