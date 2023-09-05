class TopScorers {
  int? success;
  List<Result>? result;

  TopScorers({this.success, this.result});

  factory TopScorers.fromJson(Map<String, dynamic> json) => TopScorers(
        success: json['success'] as int?,
        result: (json['result'] as List<dynamic>?)
            ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'result': result?.map((e) => e.toJson()).toList(),
      };
}

class Result {
  int? playerPlace;
  String? playerName;
  int? playerKey;
  String? teamName;
  int? teamKey;
  int? goals;
  dynamic assists;
  int? penaltyGoals;

  Result({
    this.playerPlace,
    this.playerName,
    this.playerKey,
    this.teamName,
    this.teamKey,
    this.goals,
    this.assists,
    this.penaltyGoals,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        playerPlace: json['player_place'] as int? ?? 0,
        playerName: json['player_name'] as String? ?? "",
        playerKey: json['player_key'] as int? ?? 0,
        teamName: json['team_name'] as String? ?? "",
        teamKey: json['team_key'] as int? ?? 0,
        goals: json['goals'] as int? ?? 0,
        assists: json['assists'] as dynamic ?? "",
        penaltyGoals: json['penalty_goals'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'player_place': playerPlace,
        'player_name': playerName,
        'player_key': playerKey,
        'team_name': teamName,
        'team_key': teamKey,
        'goals': goals,
        'assists': assists,
        'penalty_goals': penaltyGoals,
      };
}
