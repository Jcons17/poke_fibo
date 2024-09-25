abstract class RemotePokemonResponse {
  int? get count;
  String? get next;
  String? get previous;
  List<Result> get results;
}

abstract class Result {
  String get name;
  String get url;
}
