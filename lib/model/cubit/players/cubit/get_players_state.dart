part of 'get_players_cubit.dart';

@immutable
sealed class GetPlayersState {}

class PlayersInitial extends GetPlayersState {}

class PlayersLoading extends GetPlayersState {}

class PlayersSuccess extends GetPlayersState {
  final Players respose;
  PlayersSuccess({required this.respose});
}

class PlayersFailure extends GetPlayersState {}
