import 'dart:convert';
import 'package:final_project/model/data/leagues_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LeaguesRepo {
  Future<Leagues?> getAllLeagues(int countryId) async {
    try {
      var response = await http.get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?met=Leagues&countryId=$countryId&APIkey=9819e7462cfeeb44124fd5f716823bdf526bfc2f97353aa89ec3ff0441895eb3"));
      var decodedResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Leagues leagues = Leagues.fromJson(decodedResponse);
        return leagues;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }
}
