import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui/controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class SettingWidget extends StatelessWidget {
  IconData icon;
  String text;
  VoidCallback? onTap;
  SettingWidget({Key? key, required this.icon, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    return SizedBox(
      height: 60,
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            letterSpacing: 0.2,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
