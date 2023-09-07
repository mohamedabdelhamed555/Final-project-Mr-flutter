import 'package:bloc/bloc.dart';
import 'package:final_project/model/data/leagues_data.dart';
import 'package:final_project/model/repository/get_repo_leagues.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'get_leagues_state.dart';

class GetLeaguesCubit extends Cubit<GetLeaguesState> {
  GetLeaguesCubit() : super(GetLeaguesInitial());

  void getAllLeagues(int countryId) {
    emit(LeaguesLoading());
    LeaguesRepo().getAllLeagues(countryId).then((value) {
      if (value != null) {
        emit(LeaguesSuccess(response: value));
      } else {
        emit(LeaguesFailure());
        debugPrint("request failed");
      }
    });
  }
}
