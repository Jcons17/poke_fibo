abstract interface class User {
  String get email;
  String get name;
  String get code;

  String toJson();
}
