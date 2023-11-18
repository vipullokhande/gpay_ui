import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui/controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class MidBillWidget extends StatelessWidget {
  IconData icon;
  String text;
  MidBillWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: isDark ? Colors.white : Colors.black,
          shadowColor: isDark ? Colors.blue : Colors.grey,
          backgroundColor:
              isDark ? const Color.fromARGB(255, 48, 47, 47) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
        ),
        child: Container(
          height: 105,
          width: size.width * 0.14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.blue,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  letterSpacing: 0.2,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
