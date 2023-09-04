import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_top_scores_state.dart';

class GetTopScoresCubit extends Cubit<GetTopScoresState> {
  GetTopScoresCubit() : super(GetTopScoresInitial());
}
