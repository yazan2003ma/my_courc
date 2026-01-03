import 'package:flutter/material.dart';
import 'package:flutter1/model/qrmodel.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class AppDatabase extends ChangeNotifier {
  static late Isar isar;

  final List<Userqr> allUsers = [];
  final List<codeQr> allCodes = [];

  // ---------------- INITIALIZE ----------------
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([UserqrSchema, CodeQrSchema], directory: dir.path);
  }

  // ---------------- USER ----------------
  Future<void> addUser({
    required String newFullName,
    required String newuserName,
    required String newEmail,
    required String newPassword,
  }) async {
    final user = Userqr()
      ..fullName = newFullName
      ..username = newuserName
      ..email = newEmail
      ..password = newPassword;

    await isar.writeTxn(() => isar.userqrs.put(user));
    await fetchUsers();
  }

  Future<Userqr?> fetchByEmail(String email) async {
    return await isar.userqrs.filter().emailEqualTo(email).findFirst();
  }

  Future<Userqr?> fetchById(int id) async {
    return await isar.userqrs.get(id);
  }

  Future<void> fetchUsers() async {
    final users = await isar.userqrs.where().findAll();
    allUsers
      ..clear()
      ..addAll(users);
    notifyListeners();
  }

  Future<void> updateUser(Userqr user) async {
    await isar.writeTxn(() => isar.userqrs.put(user));
    await fetchUsers();
  }

  // ---------------- CODE ----------------
  Future<void> addCode({
    required String title,
    required String data,
    required bool canEdit,
    String? codePassword,
    required int userId,
  }) async {
    final code = codeQr()
      ..title = title
      ..data = data
      ..canEdit = canEdit
      ..codePassword = codePassword
      ..userId = userId;

    await isar.writeTxn(() => isar.codeQrs.put(code));
    await fetchCodes();
  }

  Future<void> fetchCodes() async {
    final codes = await isar.codeQrs.where().findAll();
    allCodes
      ..clear()
      ..addAll(codes);
    notifyListeners();
  }

  Future<void> updateCode(codeQr code) async {
    await isar.writeTxn(() => isar.codeQrs.put(code));
    await fetchCodes();
  }

  Future<void> deleteCode(int id) async {
    await isar.writeTxn(() => isar.codeQrs.delete(id));
    await fetchCodes();
  }
}
