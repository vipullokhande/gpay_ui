import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui/controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class GChip extends StatelessWidget {
  String text;
  IconData icon;
  VoidCallback onTap;
  GChip({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 20,
        ),
        avatar: Icon(
          icon,
          color: isDark ? Colors.white : Colors.black,
        ),
        label: Text(
          text,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: isDark
            ? const Color.fromARGB(255, 96, 96, 96)
            : const Color.fromARGB(255, 235, 234, 234),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
            side: const BorderSide(
              width: 1,
              color: Colors.grey,
            )),
      ),
    );
  }
}
