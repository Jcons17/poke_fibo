import 'dart:convert';

import 'package:flutter_template/core/domain/entity/move_expanded.dart';

class MoveExpandedDto extends MoveExpanded {
  final int? accuracy;
  final int id;
  final String name;
  final int? power;
  final int? pp;
  final int? priority;
  MoveExpandedDto({
    this.accuracy,
    required this.id,
    required this.name,
    this.power,
    this.pp,
    this.priority,
  });

  MoveExpandedDto copyWith({
    int? accuracy,
    int? id,
    String? name,
    int? power,
    int? pp,
    int? priority,
  }) {
    return MoveExpandedDto(
      accuracy: accuracy ?? this.accuracy,
      id: id ?? this.id,
      name: name ?? this.name,
      power: power ?? this.power,
      pp: pp ?? this.pp,
      priority: priority ?? this.priority,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'accuracy': accuracy,
      'id': id,
      'name': name,
      'power': power,
      'pp': pp,
      'priority': priority,
    };
  }

  factory MoveExpandedDto.fromMap(Map<String, dynamic> map) {
    return MoveExpandedDto(
      accuracy: map['accuracy']?.toInt(),
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      power: map['power']?.toInt(),
      pp: map['pp']?.toInt(),
      priority: map['priority']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MoveExpandedDto.fromJson(String source) => MoveExpandedDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MoveExpandedDto(accuracy: $accuracy, id: $id, name: $name, power: $power, pp: $pp, priority: $priority)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MoveExpandedDto &&
        other.accuracy == accuracy &&
        other.id == id &&
        other.name == name &&
        other.power == power &&
        other.pp == pp &&
        other.priority == priority;
  }

  @override
  int get hashCode {
    return accuracy.hashCode ^ id.hashCode ^ name.hashCode ^ power.hashCode ^ pp.hashCode ^ priority.hashCode;
  }
}
