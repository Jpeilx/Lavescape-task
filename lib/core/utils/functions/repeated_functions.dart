import 'package:flutter/material.dart';
import 'package:lavescape/core/utils/colors/app_colors.dart';
import 'package:lavescape/core/utils/styles/font_manager.dart';
import 'package:lavescape/core/utils/styles/text_style_manger.dart';
import 'package:permission_handler/permission_handler.dart';

class RepeatedFunctions {
  static showSnackBar(
    BuildContext context, {
    required String message,
    Color? textColor,
    Color? background,
    bool error = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: getMediumStyle(
            fontSize: FontSize.s14,
            color: AppColors.kWhiteColor,
            fontFamily: FontConstants.interFontfamily,
          ),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ),
    );
  }

  static Future<void> ensureLocationPermission() async {
    // Check current status first
    final status = await Permission.location.status;

    if (status.isGranted) {
      // Already granted → no need to ask again
      print('Location permission already granted.');
    } else if (status.isDenied) {
      // Ask only if not yet granted
      final result = await Permission.location.request();
      if (result.isGranted) {
        print('Location permission granted after request.');
      } else {
        print('Location permission denied by user.');
      }
    } else if (status.isPermanentlyDenied) {
      // User chose "Don't ask again"
      print('Permission permanently denied. Ask to open app settings.');
      openAppSettings(); // takes user to settings
    }
  }
}
