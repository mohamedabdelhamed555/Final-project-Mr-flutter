part of 'get_leagues_cubit.dart';

@immutable
sealed class GetLeaguesState {
  get response => null;
}

final class GetLeaguesInitial extends GetLeaguesState {}

class LeaguesLoading extends GetLeaguesState {}

class LeaguesSuccess extends GetLeaguesState {
  final Leagues response;
  LeaguesSuccess({required this.response});
}

class LeaguesFailure extends GetLeaguesState {}
