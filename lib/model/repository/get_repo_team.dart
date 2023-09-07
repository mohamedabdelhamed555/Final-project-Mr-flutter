import 'dart:convert';
import 'package:final_project/model/data/country_data.dart';
import 'package:final_project/model/data/teams_data.dart';
import 'package:http/http.dart' as http;

class TeamsRepo {
  Future<Teams?> getAllTeams(int leagueId) async {
    print(leagueId);

    try {
      var response = await http.get(
        Uri.parse(
            "https://apiv2.allsportsapi.com/football/?&met=Teams&APIkey=da248f5665aa5f3116c16ddc9a5e3a9841870cb50ff81537c8f4e970c678e876&leagueId=$leagueId"),
      );
      var jsonResponse = json.decode(response.body) as Map<String, dynamic>;
      // var decodedResponse = jsonDecode(response.body);
      print(jsonResponse);
      if (response.statusCode == 200) {
        Teams teams = Teams.fromJson(jsonResponse);
        return teams;
      } else {
        return null;
      }
    } catch (error) {
      print(error);
      return null;
    }
  }
}
