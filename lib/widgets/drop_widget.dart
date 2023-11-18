import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui/controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class DropWidget extends StatelessWidget {
  String text;
  String image;
  VoidCallback? onTap;
  DropWidget({Key? key, required this.image, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.22,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: image.length > 20
                  ? Image.network(
                      image,
                      isAntiAlias: true,
                      height: 55,
                      width: 55,
                    )
                  : Image.asset(
                      image,
                      isAntiAlias: true,
                      fit: BoxFit.cover,
                      height: 55,
                      width: 55,
                    ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              text,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                overflow: TextOverflow.ellipsis,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }
}
