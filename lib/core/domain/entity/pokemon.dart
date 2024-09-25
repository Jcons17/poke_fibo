abstract class Pokemon {
  List<Ability> get abilities;
  int get baseExperience;
  Cries get cries;
  List<Species>? get forms;
  List<GameIndex>? get gameIndices;
  int get height;
  int get id;
  bool get isDefault;
  String get locationAreaEncounters;
  List<Move> get moves;
  String get name;
  int get order;
  Species get species;
  Sprites get sprites;
  List<Stat> get stats;
  int get weight;

  String toJson();
}

abstract class Ability {
  Species? get ability;
  bool? get isHidden;
  int? get slot;
}

abstract class Species {
  String? get name;
  String? get url;
}

abstract class Cries {
  String? get latest;
  String? get legacy;
}

abstract class GameIndex {
  int? get gameIndex;
  Species? get version;
}

abstract class Move {
  Species? get move;
  List<VersionGroupDetail>? get versionGroupDetails;
}

abstract class VersionGroupDetail {
  int? get levelLearnedAt;
  Species? get moveLearnMethod;
  Species? get versionGroup;
}

abstract class Sprites {
  String? get backDefault;
  String? get backFemale;
  String? get backShiny;
  String? get backShinyFemale;
  String? get frontDefault;
  String? get frontFemale;
  String? get frontShiny;
  String? get frontShinyFemale;
}

abstract class Stat {
  int? get baseStat;
  int? get effort;
  Species? get stat;
}
