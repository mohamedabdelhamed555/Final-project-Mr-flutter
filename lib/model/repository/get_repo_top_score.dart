import 'dart:convert';
import 'package:final_project/model/data/topScore_data.dart';
import 'package:http/http.dart' as http;

class TopScorersRepo {
  Future<TopScorers?> getTopScorers(int leagueId) async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?&met=Topscorers&leagueId=Topscorers&APIkey=da248f5665aa5f3116c16ddc9a5e3a9841870cb50ff81537c8f4e970c678e876&leagueId=$leagueId"));
      var decodedResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        TopScorers topScorers = TopScorers.fromJson(decodedResponse);
        return topScorers;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
