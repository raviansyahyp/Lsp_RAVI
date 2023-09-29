import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_cash_book/app/routes/app_pages.dart';
import 'package:my_cash_book/app/utils/app_color.dart';
import 'package:my_cash_book/app/utils/database_helper.dart';
import 'package:my_cash_book/app/utils/hash_password.dart';

class SettingController extends GetxController {
  //TODO: Implement SettingController

  RxBool isLoading = false.obs;
  RxBool obsecureText = true.obs;
  RxBool obsecureTextNew = true.obs;
  TextEditingController passC = TextEditingController();
  TextEditingController passNewC = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper.instance;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> changePassword() async {
    String currentPassword = passC.text;
    String newPassword = passNewC.text;
    final db = await dbHelper.database;

    // Get the current password from the database for the specified username
    final List<Map<String, dynamic>> users = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [box.read('user_id')],
    );

    if (users.isNotEmpty) {
      final storedPassword = users[0]['password'] as String;

      // Check if the current password matches the stored password
      if (checkPassword(currentPassword, storedPassword)) {
        // Encrypt the new password before storing it
        final hashedPassword = HashPassword(newPassword);

        // Update the password in the database
        await db.update(
          'users',
          {'password': hashedPassword},
          where: 'id = ?',
          whereArgs: [box.read('user_id')],
        );

        passC.clear();
        passNewC.clear();

        Get.snackbar(
          'Berhasil',
          'Password berhasil diperbarui',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.primaryColor,
          colorText: Colors.white,
        );
      }
    } else {
      // Password saat ini tidak cocok
      Get.snackbar(
        'Error',
        'Gagal memperbarui password',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.secondary,
        colorText: Colors.white,
      );
    }
  }

  bool checkPassword(String inputPassword, String storedPassword) {
    // Implementasikan metode enkripsi yang sama seperti yang digunakan sebelumnya
    final hashedInputPassword = HashPassword(inputPassword);

    // Bandingkan password yang dimasukkan dengan yang disimpan di database
    return hashedInputPassword == storedPassword;
  }

  Future<void> logout() async {
    box.remove("user_id");
    box.remove("username");
    Get.offNamed(Routes.LOGIN);
  }
}
