import 'dart:convert';
import 'package:final_project/model/data/leagues_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LeaguesRepo {
  Future<leagues?> getAllLeagues(String countryId) async {
    try {
      http.Response response = await http.get(Uri.parse(""));

      Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        leagues responseleagues = leagues.fromJson(data);
        return responseleagues;
      } else {
        print("request failed");
        return null;
      }
    } catch (error) {
      debugPrint("error : $error");
      return null;
    }
  }
}
