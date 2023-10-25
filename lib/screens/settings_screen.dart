import 'package:flutter/material.dart';
import 'package:gpay_ui/screens/instantscreens/user_profile_details.dart';
import 'package:gpay_ui/widgets/setting_widget.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui/controllers/dark_mode_controller.dart';
// ignore: must_be_immutable
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        bool isDark = context.watch<DarkModeController>().isDark;

    return Scaffold(
      backgroundColor:
          isDark ? const Color.fromARGB(115, 37, 37, 37) : Colors.white,
      appBar: AppBar(
        foregroundColor: isDark ? Colors.white : Colors.black,
        backgroundColor:
            isDark ? const Color.fromARGB(115, 37, 37, 37) : Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 3,
            ),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
          SettingWidget(
            icon: Icons.person_add_alt_1_outlined,
            text: 'Personal info',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const UserProfileDetails(),
                ),
              );
            },
          ),
          SettingWidget(
              icon: Icons.notifications_none_rounded,
              text: 'Notifications & email'),
          SettingWidget(
              icon: Icons.privacy_tip_outlined, text: 'Privacy & security'),
          SettingWidget(icon: Icons.info_outline_rounded, text: 'About'),
          SettingWidget(
              icon: Icons.help_outline_rounded, text: 'Help & feedback'),
          SettingWidget(icon: Icons.lock_outline_rounded, text: 'Lock app'),
          SettingWidget(
              icon: Icons.power_settings_new_outlined, text: 'Sign out'),
        ],
      ),
    );
  }
}
