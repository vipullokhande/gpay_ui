import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/dark_mode_controller.dart';

class PaymentOptionsWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isIcon;
  const PaymentOptionsWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isIcon,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    return InkWell(
      splashColor: const Color.fromARGB(255, 231, 204, 236),
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
      child: Column(
        children: [
          isIcon
              ? SizedBox(
                  height: 55,
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: isDark ? 0.9 : 0.75,
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: isDark
                              ? Colors.blue.shade900
                              : Colors.blue.shade100,
                          child: Icon(
                            icon,
                            color: isDark ? Colors.white : Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Icon(
                          Icons.add_circle,
                          size: 22,
                          color: isDark
                              ? Colors.blue.shade100
                              : Colors.blue.shade800,
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  height: 55,
                  child: Icon(
                    icon,
                    color: isDark ? Colors.blue.shade200 : Colors.blue.shade700,
                    size: 38,
                  ),
                ),
          const SizedBox(
            height: 15,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: isDark
                  ? const Color.fromARGB(206, 255, 255, 255)
                  : const Color.fromARGB(255, 45, 45, 45),
            ),
          ),
        ],
      ),
    );
  }
}
