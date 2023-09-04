part of 'get_teams_cubit.dart';

@immutable
sealed class GetTeamsState {}

class TeamsInitial extends GetTeamsState {}

class TeamsLoading extends GetTeamsState {}

class TeamsSuccess extends GetTeamsState {
  final Teams response;
  TeamsSuccess({required this.response});
}

class TeamsFailure extends GetTeamsState {}
