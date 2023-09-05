part of 'get_top_scores_cubit.dart';

@immutable
sealed class GetTopScoresState {}

class TopScorersInitial extends GetTopScoresState {}

class TopScorersLoading extends GetTopScoresState {}

class TopScorersSuccess extends GetTopScoresState {
  final TopScorers response;
  TopScorersSuccess({required this.response});
}

class TopScorersFailure extends GetTopScoresState {}
