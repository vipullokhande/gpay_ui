import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui/controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class GridWidget extends StatelessWidget {
  IconData icon;
  String text;
  VoidCallback onTap;
  GridWidget(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;

    var size = MediaQuery.of(context).size.width;
    return InkWell(
      splashColor: Colors.deepPurple.shade200,
      borderRadius: BorderRadius.circular(25),
      onTap: onTap,
      child: SizedBox(
        width: size * 0.23,
        height: 90,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Icon(
              icon,
              color: isDark ? Colors.white : Colors.black,
              size: 28,
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
