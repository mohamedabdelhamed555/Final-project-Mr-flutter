import 'package:flutter/material.dart';

import '../Widget/getItem_players.dart';
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff14142B),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              for(int i = 0 ; i <names.length ; i ++)
                InkWell(
                  onTap: (){
                    showDialog(context: context,
                        builder: (context){
                          return AlertDialog(
                            backgroundColor: Color(0xff14142B),
                            title:Text(names[i], style: TextStyle(color: Colors.white),),
                            content: SingleChildScrollView(
                              child: Container(
                                height:MediaQuery.of(context).size.height * 0.5,
                                // width:MediaQuery.of(context).size.width * 0.6,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.2,
                                      child: Image.asset(imagess[i] ),
                                    ),
                                    Text("number : ${numbers[i]}", style: TextStyle(color: Colors.white),),
                                    Text("country : ${country[i]}", style: TextStyle(color: Colors.white),),
                                    Text("position :${positions[i]}", style: TextStyle(color: Colors.white),),
                                    Text("ages :${ages[i]}", style: TextStyle(color: Colors.white),),
                                    Text("yellow Cards : ${yellowCards[i]} ", style: TextStyle(color: Colors.white),),
                                    Text("red Cards : ${redCards[i]}", style: TextStyle(color: Colors.white),),
                                    Text("goals :${goals[i]}", style: TextStyle(color: Colors.white),),
                                    Text("assists :${assists[i]}", style: TextStyle(color: Colors.white),),
                                    // Text("positions :${positions[i]}"),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    );
                  },
                  child:
                  Text(names[i],
                    style: TextStyle(fontSize: 25 , color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ) ,
    );
  }
}