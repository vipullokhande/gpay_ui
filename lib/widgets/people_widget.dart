import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/dark_mode_controller.dart';

class PeopleWidget extends StatelessWidget {
  final String name;
  final String getInitial;
  final Color color;
  const PeopleWidget({
    super.key,
    required this.name,
    required this.getInitial,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    return SizedBox(
      width: 85,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Text(
              getInitial,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
