import 'dart:convert';
import 'package:final_project/model/data/leagues_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LeaguesRepo {
  Future<Leagues?> getAllLeagues(String countryId) async {
    try {
      var response = await http.get(Uri.parse(
          "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=da248f5665aa5f3116c16ddc9a5e3a9841870cb50ff81537c8f4e970c678e876"));

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
