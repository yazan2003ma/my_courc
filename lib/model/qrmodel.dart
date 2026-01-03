import 'package:isar/isar.dart';

part 'qrmodel.g.dart';

@collection
class codeQr {
  Id id = Isar.autoIncrement;

  late String title;
  late String data;
  late bool canEdit;
  String? codePassword;

  late int userId;
}

@collection
class Userqr {
  Id id = Isar.autoIncrement;

  late String fullName;
  late String username;
  late String email;
  late String password;
}
