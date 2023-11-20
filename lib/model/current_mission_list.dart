


import 'current_mission_dto.dart';

class CurrentMissionList {
  final List<CurrentMissionDto> missions;

  CurrentMissionList({
    required this.missions,
  });

  factory CurrentMissionList.fromJson(List<dynamic> jsonList) {
    final missions = jsonList
        .map((mission) => CurrentMissionDto.fromJson(mission))
        .toList();

    return CurrentMissionList(missions: missions);
  }
}