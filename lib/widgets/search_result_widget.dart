import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchResultWidget extends StatelessWidget {
  final String name;
  final String image;
  Color? color;
  SearchResultWidget({
    super.key,
    required this.name,
    required this.image,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        image.length == 2
            ? CircleAvatar(
                backgroundColor: color,
                radius: 30,
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )
            : ClipOval(
                clipBehavior: Clip.antiAlias,
                child: image.length > 30
                    ? Image.network(
                        image,
                        isAntiAlias: true,
                        height: 55,
                        width: 55,
                      )
                    : Image.asset(
                        image,
                        isAntiAlias: true,
                        height: 55,
                        width: 55,
                      ),
              ),
      ],
    );
  }
}
