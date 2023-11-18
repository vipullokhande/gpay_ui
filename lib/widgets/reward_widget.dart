import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui/controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class RewardWidget extends StatefulWidget {
  String text;
  String title;
  String subtitle;
  VoidCallback onTap;
  RewardWidget({
    Key? key,
    required this.text,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  State<RewardWidget> createState() => _RewardWidgetState();
}

class _RewardWidgetState extends State<RewardWidget> {
  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    return InkWell(
      splashColor: const Color.fromARGB(207, 231, 151, 245),
      borderRadius: BorderRadius.circular(20),
      onTap: widget.onTap,
      child: Ink(
        child: Container(
          padding: const EdgeInsets.fromLTRB(
            12,
            10,
            0,
            0,
          ),
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: Colors.black),
            image: DecorationImage(
              image: const AssetImage('assets/rewards_back.png'),
              fit: BoxFit.cover,
              opacity: isDark ? 0.1 : 0.3,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    maxLines: 1,
                  ),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: isDark
                          ? const Color.fromARGB(255, 223, 223, 223)
                          : Colors.black,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
              Positioned(
                bottom: 10,
                child: ClipOval(
                  child: Image.asset(
                    widget.text,
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
