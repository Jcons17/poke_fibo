import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_template/core/domain/entity/pokemon.dart';

class PokemonDto implements Pokemon {
  final List<AbilityDto> abilities;
  final int baseExperience;
  final CriesDto cries;
  final List<SpeciesDto>? forms;
  final List<GameIndexDto>? gameIndices;
  final int height;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<MoveDto> moves;
  final String name;
  final int order;
  final SpeciesDto species;
  final SpritesDto sprites;
  final List<StatDto> stats;
  final int weight;
  PokemonDto({
    required this.abilities,
    required this.baseExperience,
    required this.cries,
    this.forms,
    this.gameIndices,
    required this.height,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.weight,
  });

  PokemonDto copyWith({
    List<AbilityDto>? abilities,
    int? baseExperience,
    CriesDto? cries,
    List<SpeciesDto>? forms,
    List<GameIndexDto>? gameIndices,
    int? height,
    int? id,
    bool? isDefault,
    String? locationAreaEncounters,
    List<MoveDto>? moves,
    String? name,
    int? order,
    SpeciesDto? species,
    SpritesDto? sprites,
    List<StatDto>? stats,
    int? weight,
  }) {
    return PokemonDto(
      abilities: abilities ?? this.abilities,
      baseExperience: baseExperience ?? this.baseExperience,
      cries: cries ?? this.cries,
      forms: forms ?? this.forms,
      gameIndices: gameIndices ?? this.gameIndices,
      height: height ?? this.height,
      id: id ?? this.id,
      isDefault: isDefault ?? this.isDefault,
      locationAreaEncounters: locationAreaEncounters ?? this.locationAreaEncounters,
      moves: moves ?? this.moves,
      name: name ?? this.name,
      order: order ?? this.order,
      species: species ?? this.species,
      sprites: sprites ?? this.sprites,
      stats: stats ?? this.stats,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'abilities': abilities.map((x) => x.toMap()).toList(),
      'base_experience': baseExperience,
      'cries': cries.toMap(),
      'forms': forms?.map((x) => x.toMap()).toList(),
      'game_indices': gameIndices?.map((x) => x.toMap()).toList(),
      'height': height,
      'id': id,
      'is_default': isDefault,
      'location_area_encounters': locationAreaEncounters,
      'moves': moves.map((x) => x.toMap()).toList(),
      'name': name,
      'order': order,
      'species': species.toMap(),
      'sprites': sprites.toMap(),
      'stats': stats.map((x) => x.toMap()).toList(),
      'weight': weight,
    };
  }

  factory PokemonDto.fromMap(Map<String, dynamic> map) {
    return PokemonDto(
      abilities: List<AbilityDto>.from(map['abilities']?.map((x) => AbilityDto.fromMap(x))),
      baseExperience: map['base_experience']?.toInt() ?? 0,
      cries: CriesDto.fromMap(map['cries']),
      forms: map['forms'] != null ? List<SpeciesDto>.from(map['forms']?.map((x) => SpeciesDto.fromMap(x))) : null,
      gameIndices: map['gameIndices'] != null
          ? List<GameIndexDto>.from(map['game_indices']?.map((x) => GameIndexDto.fromMap(x)))
          : null,
      height: map['height']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      isDefault: map['is_default'] ?? false,
      locationAreaEncounters: map['location_area_encounters'] ?? '',
      moves: List<MoveDto>.from(map['moves']?.map((x) => MoveDto.fromMap(x))),
      name: map['name'] ?? '',
      order: map['order']?.toInt() ?? 0,
      species: SpeciesDto.fromMap(map['species']),
      sprites: SpritesDto.fromMap(map['sprites']),
      stats: List<StatDto>.from(map['stats']?.map((x) => StatDto.fromMap(x))),
      weight: map['weight']?.toInt() ?? 0,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory PokemonDto.fromJson(String source) => PokemonDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PokemonDto(abilities: $abilities, baseExperience: $baseExperience, cries: $cries, forms: $forms, gameIndices: $gameIndices, height: $height, id: $id, isDefault: $isDefault, locationAreaEncounters: $locationAreaEncounters, moves: $moves, name: $name, order: $order, species: $species, sprites: $sprites, stats: $stats, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonDto &&
        listEquals(other.abilities, abilities) &&
        other.baseExperience == baseExperience &&
        other.cries == cries &&
        listEquals(other.forms, forms) &&
        listEquals(other.gameIndices, gameIndices) &&
        other.height == height &&
        other.id == id &&
        other.isDefault == isDefault &&
        other.locationAreaEncounters == locationAreaEncounters &&
        listEquals(other.moves, moves) &&
        other.name == name &&
        other.order == order &&
        other.species == species &&
        other.sprites == sprites &&
        listEquals(other.stats, stats) &&
        other.weight == weight;
  }

  @override
  int get hashCode {
    return abilities.hashCode ^
        baseExperience.hashCode ^
        cries.hashCode ^
        forms.hashCode ^
        gameIndices.hashCode ^
        height.hashCode ^
        id.hashCode ^
        isDefault.hashCode ^
        locationAreaEncounters.hashCode ^
        moves.hashCode ^
        name.hashCode ^
        order.hashCode ^
        species.hashCode ^
        sprites.hashCode ^
        stats.hashCode ^
        weight.hashCode;
  }
}

class AbilityDto implements Ability {
  final SpeciesDto? ability;
  final bool? isHidden;
  final int? slot;
  AbilityDto({
    this.ability,
    this.isHidden,
    this.slot,
  });

  AbilityDto copyWith({
    SpeciesDto? ability,
    bool? isHidden,
    int? slot,
  }) {
    return AbilityDto(
      ability: ability ?? this.ability,
      isHidden: isHidden ?? this.isHidden,
      slot: slot ?? this.slot,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ability': ability?.toMap(),
      'is_hidden': isHidden,
      'slot': slot,
    };
  }

  factory AbilityDto.fromMap(Map<String, dynamic> map) {
    return AbilityDto(
      ability: map['ability'] != null ? SpeciesDto.fromMap(map['ability']) : null,
      isHidden: map['is_hidden'],
      slot: map['slot']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AbilityDto.fromJson(String source) => AbilityDto.fromMap(json.decode(source));

  @override
  String toString() => 'AbilityDto(ability: $ability, isHidden: $isHidden, slot: $slot)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AbilityDto && other.ability == ability && other.isHidden == isHidden && other.slot == slot;
  }

  @override
  int get hashCode => ability.hashCode ^ isHidden.hashCode ^ slot.hashCode;
}

class CriesDto implements Cries {
  final String? latest;
  final String? legacy;
  CriesDto({
    this.latest,
    this.legacy,
  });

  CriesDto copyWith({
    String? latest,
    String? legacy,
  }) {
    return CriesDto(
      latest: latest ?? this.latest,
      legacy: legacy ?? this.legacy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latest': latest,
      'legacy': legacy,
    };
  }

  factory CriesDto.fromMap(Map<String, dynamic> map) {
    return CriesDto(
      latest: map['latest'],
      legacy: map['legacy'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CriesDto.fromJson(String source) => CriesDto.fromMap(json.decode(source));

  @override
  String toString() => 'CriesDto(latest: $latest, legacy: $legacy)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CriesDto && other.latest == latest && other.legacy == legacy;
  }

  @override
  int get hashCode => latest.hashCode ^ legacy.hashCode;
}

class GameIndexDto implements GameIndex {
  final int? gameIndex;
  final SpeciesDto? version;
  GameIndexDto({
    this.gameIndex,
    this.version,
  });

  GameIndexDto copyWith({
    int? gameIndex,
    SpeciesDto? version,
  }) {
    return GameIndexDto(
      gameIndex: gameIndex ?? this.gameIndex,
      version: version ?? this.version,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'game_index': gameIndex,
      'version': version?.toMap(),
    };
  }

  factory GameIndexDto.fromMap(Map<String, dynamic> map) {
    return GameIndexDto(
      gameIndex: map['game_index']?.toInt(),
      version: map['version'] != null ? SpeciesDto.fromMap(map['version']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GameIndexDto.fromJson(String source) => GameIndexDto.fromMap(json.decode(source));

  @override
  String toString() => 'GameIndexDto(gameIndex: $gameIndex, version: $version)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameIndexDto && other.gameIndex == gameIndex && other.version == version;
  }

  @override
  int get hashCode => gameIndex.hashCode ^ version.hashCode;
}

class MoveDto implements Move {
  final SpeciesDto? move;
  final List<VersionGroupDetailDto>? versionGroupDetails;
  MoveDto({
    this.move,
    this.versionGroupDetails,
  });

  MoveDto copyWith({
    SpeciesDto? move,
    List<VersionGroupDetailDto>? versionGroupDetails,
  }) {
    return MoveDto(
      move: move ?? this.move,
      versionGroupDetails: versionGroupDetails ?? this.versionGroupDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'move': move?.toMap(),
      'version_group_details': versionGroupDetails?.map((x) => x.toMap()).toList(),
    };
  }

  factory MoveDto.fromMap(Map<String, dynamic> map) {
    return MoveDto(
      move: map['move'] != null ? SpeciesDto.fromMap(map['move']) : null,
      versionGroupDetails: map['version_group_details'] != null
          ? List<VersionGroupDetailDto>.from(map['version_group_details']?.map((x) => VersionGroupDetailDto.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MoveDto.fromJson(String source) => MoveDto.fromMap(json.decode(source));

  @override
  String toString() => 'MoveDto(move: $move, versionGroupDetails: $versionGroupDetails)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MoveDto && other.move == move && listEquals(other.versionGroupDetails, versionGroupDetails);
  }

  @override
  int get hashCode => move.hashCode ^ versionGroupDetails.hashCode;
}

class VersionGroupDetailDto implements VersionGroupDetail {
  final int? levelLearnedAt;
  final SpeciesDto? moveLearnMethod;
  final SpeciesDto? versionGroup;
  VersionGroupDetailDto({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  VersionGroupDetailDto copyWith({
    int? levelLearnedAt,
    SpeciesDto? moveLearnMethod,
    SpeciesDto? versionGroup,
  }) {
    return VersionGroupDetailDto(
      levelLearnedAt: levelLearnedAt ?? this.levelLearnedAt,
      moveLearnMethod: moveLearnMethod ?? this.moveLearnMethod,
      versionGroup: versionGroup ?? this.versionGroup,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'level_learned_at': levelLearnedAt,
      'move_learn_method': moveLearnMethod?.toMap(),
      'version_group': versionGroup?.toMap(),
    };
  }

  factory VersionGroupDetailDto.fromMap(Map<String, dynamic> map) {
    return VersionGroupDetailDto(
      levelLearnedAt: map['level_learned_at']?.toInt(),
      moveLearnMethod: map['move_learn_method'] != null ? SpeciesDto.fromMap(map['move_learn_method']) : null,
      versionGroup: map['version_group'] != null ? SpeciesDto.fromMap(map['version_group']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VersionGroupDetailDto.fromJson(String source) => VersionGroupDetailDto.fromMap(json.decode(source));

  @override
  String toString() =>
      'VersionGroupDetailDto(levelLearnedAt: $levelLearnedAt, moveLearnMethod: $moveLearnMethod, versionGroup: $versionGroup)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VersionGroupDetailDto &&
        other.levelLearnedAt == levelLearnedAt &&
        other.moveLearnMethod == moveLearnMethod &&
        other.versionGroup == versionGroup;
  }

  @override
  int get hashCode => levelLearnedAt.hashCode ^ moveLearnMethod.hashCode ^ versionGroup.hashCode;
}

class SpritesDto implements Sprites {
  final String? backDefault;
  final String? backFemale;
  final String? backShiny;
  final String? backShinyFemale;
  final String? frontDefault;
  final String? frontFemale;
  final String? frontShiny;
  final String? frontShinyFemale;
  SpritesDto({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  SpritesDto copyWith({
    String? backDefault,
    String? backFemale,
    String? backShiny,
    String? backShinyFemale,
    String? frontDefault,
    String? frontFemale,
    String? frontShiny,
    String? frontShinyFemale,
  }) {
    return SpritesDto(
      backDefault: backDefault ?? this.backDefault,
      backFemale: backFemale ?? this.backFemale,
      backShiny: backShiny ?? this.backShiny,
      backShinyFemale: backShinyFemale ?? this.backShinyFemale,
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
      frontShiny: frontShiny ?? this.frontShiny,
      frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'back_default': backDefault,
      'back_female': backFemale,
      'back_shiny': backShiny,
      'back_shiny_female': backShinyFemale,
      'front_default': frontDefault,
      'front_female': frontFemale,
      'front_shiny': frontShiny,
      'front_shiny_female': frontShinyFemale,
    };
  }

  factory SpritesDto.fromMap(Map<String, dynamic> map) {
    return SpritesDto(
      backDefault: map['back_default'],
      backFemale: map['back_female'],
      backShiny: map['back_shiny'],
      backShinyFemale: map['back_shiny_female'],
      frontDefault: map['front_default'],
      frontFemale: map['front_female'],
      frontShiny: map['front_shiny'],
      frontShinyFemale: map['front_shiny_female'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SpritesDto.fromJson(String source) => SpritesDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SpritesDto(backDefault: $backDefault, backFemale: $backFemale, backShiny: $backShiny, backShinyFemale: $backShinyFemale, frontDefault: $frontDefault, frontFemale: $frontFemale, frontShiny: $frontShiny, frontShinyFemale: $frontShinyFemale)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpritesDto &&
        other.backDefault == backDefault &&
        other.backFemale == backFemale &&
        other.backShiny == backShiny &&
        other.backShinyFemale == backShinyFemale &&
        other.frontDefault == frontDefault &&
        other.frontFemale == frontFemale &&
        other.frontShiny == frontShiny &&
        other.frontShinyFemale == frontShinyFemale;
  }

  @override
  int get hashCode {
    return backDefault.hashCode ^
        backFemale.hashCode ^
        backShiny.hashCode ^
        backShinyFemale.hashCode ^
        frontDefault.hashCode ^
        frontFemale.hashCode ^
        frontShiny.hashCode ^
        frontShinyFemale.hashCode;
  }
}

class StatDto implements Stat {
  final int? baseStat;
  final int? effort;
  final SpeciesDto? stat;
  StatDto({
    this.baseStat,
    this.effort,
    this.stat,
  });

  StatDto copyWith({
    int? baseStat,
    int? effort,
    SpeciesDto? stat,
  }) {
    return StatDto(
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
      stat: stat ?? this.stat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'base_stat': baseStat,
      'effort': effort,
      'stat': stat?.toMap(),
    };
  }

  factory StatDto.fromMap(Map<String, dynamic> map) {
    return StatDto(
      baseStat: map['base_stat']?.toInt(),
      effort: map['effort']?.toInt(),
      stat: map['stat'] != null ? SpeciesDto.fromMap(map['stat']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StatDto.fromJson(String source) => StatDto.fromMap(json.decode(source));

  @override
  String toString() => 'StatDto(baseStat: $baseStat, effort: $effort, stat: $stat)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StatDto && other.baseStat == baseStat && other.effort == effort && other.stat == stat;
  }

  @override
  int get hashCode => baseStat.hashCode ^ effort.hashCode ^ stat.hashCode;
}

class SpeciesDto implements Species {
  final String? name;
  final String? url;
  SpeciesDto({
    this.name,
    this.url,
  });

  @override
  String toString() => 'SpeciesDto(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpeciesDto && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory SpeciesDto.fromMap(Map<String, dynamic> map) {
    return SpeciesDto(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SpeciesDto.fromJson(String source) => SpeciesDto.fromMap(json.decode(source));
}
