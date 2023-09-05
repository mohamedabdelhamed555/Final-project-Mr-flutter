import 'package:bloc/bloc.dart';
import 'package:final_project/model/data/topScore_data.dart';
import 'package:final_project/model/repository/get_repo_top_score.dart';
import 'package:meta/meta.dart';

part 'get_top_scores_state.dart';

class GetTopScoresCubit extends Cubit<GetTopScoresState> {
  GetTopScoresCubit() : super(TopScorersInitial());

  void getTopScorers(String leagueId) {
    emit(TopScorersLoading());

    TopScorersRepo().getTopScorers(leagueId).then((value) {
      if (value != null) {
        emit(TopScorersSuccess(response: value));
      } else {
        emit(TopScorersFailure());
      }
    });
  }
}
