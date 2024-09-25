import 'dart:convert';
import 'package:flutter_template/core/domain/entity/remote_pokemon_response.dart';

class RemotePokemonResponseDto implements RemotePokemonResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<ResultDto> results;

  RemotePokemonResponseDto({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory RemotePokemonResponseDto.fromJson(Map<String, dynamic> json) => RemotePokemonResponseDto(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<ResultDto>.from(json["results"].map((x) => ResultDto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class ResultDto implements Result {
  final String name;
  final String url;

  ResultDto({
    required this.name,
    required this.url,
  });

  factory ResultDto.fromJson(Map<String, dynamic> json) => ResultDto(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
