import 'package:final_project/Widget/players.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class playersScreen extends StatelessWidget {
  const playersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff14142B),
        body: ListView.builder(
            itemCount: itemss.length,
            itemBuilder: (context, index) {
              final item = itemss[index];
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
                                      item.name,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.2,
                                            child: Image.asset(item.image),
                                          ),
                                          Text(
                                            "number : ${item.Number}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            "country : ${item.Country}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            "position :${item.position}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            "age :${item.Age}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            "yellow Cards : ${item.yellow_cards} ",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            "red Cards : ${item.red_cards}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            "goals :${item.Goals}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            "assists :${item.Assists}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          // Text("positions :${positions[i]}"),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          IconButton(
                                            onPressed: () async {
                                              String data =
                                                  "Name : ${item.name} \nClub : ${item.club}";
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
                                  color: Color.fromARGB(255, 145, 166, 184)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Column(
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    backgroundColor:
                                                        Color(0xff14142B),
                                                    title: Text(
                                                      item.name,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    content:
                                                        SingleChildScrollView(
                                                      child: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.5,
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.2,
                                                              child: Image
                                                                  .asset(item
                                                                      .image),
                                                            ),
                                                            Text(
                                                              "number : ${item.Number}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              "country : ${item.Country}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              "position :${item.position}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              "age :${item.Age}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              "yellow Cards : ${item.yellow_cards} ",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              "red Cards : ${item.red_cards}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              "goals :${item.Goals}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              "assists :${item.Assists}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Text(
                                            item.name,
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Text(
                                          item.position,
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
                                    child: Image.asset(
                                      item.image,
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
            }));
  }
}
