import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui/controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class PopularOfferWidget extends StatefulWidget {
  String text;
  String name;
  String title;
  String subtitle;
  VoidCallback onTap;
  PopularOfferWidget({
    Key? key,
    required this.text,
    required this.name,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  State<PopularOfferWidget> createState() => _PopularOfferWidgetState();
}

class _PopularOfferWidgetState extends State<PopularOfferWidget> {
  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: widget.onTap,
        splashColor: Colors.purple,
        child: Ink(
          decoration: BoxDecoration(
            // color: isDark
            //     ? const Color.fromARGB(220, 56, 56, 56)
            //     : const Color.fromARGB(255, 233, 227, 227),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isDark
                  ? const [
                      Color.fromARGB(76, 57, 207, 249),
                      Color.fromARGB(118, 0, 0, 0),
                    ]
                  : [
                      Colors.blue.shade300,
                      Colors.blue.shade200,
                      Colors.blue.shade100,
                    ],
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: const Color.fromARGB(255, 164, 164, 164),
            ),
          ),
          height: 140,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                child: ClipOval(
                  child: Image.asset(
                    widget.text,
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.name,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 18,
                        color: isDark ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.white : Colors.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: isDark ? Colors.white : Colors.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
