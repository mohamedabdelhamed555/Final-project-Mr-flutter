import 'package:bloc/bloc.dart';
import 'package:final_project/model/data/players_data.dart';
import 'package:final_project/model/repository/get_repo_players.dart';
import 'package:meta/meta.dart';

part 'get_players_state.dart';

class GetPlayersCubit extends Cubit<GetPlayersState> {
  GetPlayersCubit() : super(PlayersInitial());

  void getTeamPlayer(String teamId) {
    emit(PlayersLoading());

    PlayersRepo().getTeamPlayers(teamId).then((value) {
      if (value != null) {
        emit(PlayersSuccess(respose: value));
      } else {
        emit(PlayersFailure());
      }
    });
  }
}
