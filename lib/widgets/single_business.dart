import 'package:flutter/material.dart';
import 'package:gpay_ui/models/businesses_model.dart';
import 'package:provider/provider.dart';

import '../controllers/dark_mode_controller.dart';

class SingleBusinessWidget extends StatelessWidget {
  final BusinessesModel businessesModel;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const SingleBusinessWidget({
    super.key,
    required this.businessesModel,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: SizedBox(
        width: 90,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipOval(
              clipBehavior: Clip.antiAlias,
              child: businessesModel.businessAsset.length > 30
                  ? Image.network(
                      businessesModel.businessAsset,
                      isAntiAlias: true,
                      height: 55,
                      width: 55,
                    )
                  : Image.asset(
                      businessesModel.businessAsset,
                      isAntiAlias: true,
                      height: 55,
                      width: 55,
                    ),
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            Text(
              businessesModel.businessName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
