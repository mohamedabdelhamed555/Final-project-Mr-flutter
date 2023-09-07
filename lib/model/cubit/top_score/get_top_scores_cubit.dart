import 'package:bloc/bloc.dart';
import 'package:final_project/model/data/topScore_data.dart';
import 'package:final_project/model/repository/get_repo_top_score.dart';
import 'package:meta/meta.dart';

part 'get_top_scores_state.dart';

class GetTopScoresCubit extends Cubit<GetTopScoresState> {
  List<Result> topScore = [];
  GetTopScoresCubit() : super(TopScorersInitial());

  void getTopScorers(int leagueId) {
    emit(TopScorersLoading());

    TopScorersRepo().getTopScorers(leagueId).then((value) {
      if (value != null) {
        topScore = value.result ?? [];
        print(topScore.length);
        emit(TopScorersSuccess(response: value));
      } else {
        emit(TopScorersFailure());
      }
    });
  }
}
