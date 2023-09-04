import 'package:bloc/bloc.dart';
import 'package:final_project/model/data/teams_data.dart';
import 'package:final_project/model/repository/get_repo_team.dart';
import 'package:meta/meta.dart';

part 'get_teams_state.dart';

class GetTeamsCubit extends Cubit<GetTeamsState> {
  GetTeamsCubit() : super(TeamsInitial());

  void getAllTeams(String leagueId) {
    emit(TeamsLoading());
    TeamsRepo().getAllTeams(leagueId).then((value) {
      if (value != null) {
        emit(TeamsSuccess(response: value));
      } else {
        emit(TeamsFailure());
        print("request failed");
      }
    });
  }
}
