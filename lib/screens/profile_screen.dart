import 'package:flutter/material.dart';
import 'package:gpay_ui/screens/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui/controllers/dark_mode_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  String asset;

  ProfileScreen({Key? key, required this.asset}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String rewcount = '14';
  String accounts = '1';

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;

    var size = MediaQuery.of(context).size;
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      var heightt = sizeInfo.deviceScreenType == DeviceScreenType.mobile
          ? size.height * 0.23
          : size.height * 0.33;
      var botPadding = sizeInfo.deviceScreenType == DeviceScreenType.mobile
          ? const EdgeInsets.only(bottom: 130)
          : const EdgeInsets.only(bottom: 0);
      var topHeight = sizeInfo.deviceScreenType == DeviceScreenType.mobile
          ? size.height * 0.29
          : size.height * 0.3;
      var resMargin = sizeInfo.deviceScreenType == DeviceScreenType.mobile
          ? const EdgeInsets.symmetric(
              horizontal: 16,
            ).copyWith(top: MediaQuery.of(context).size.height * 0.27)
          : const EdgeInsets.symmetric(
              horizontal: 16,
            ).copyWith(top: MediaQuery.of(context).size.height * 0.29);
      // var resAlign = sizeInfo.deviceScreenType == DeviceScreenType.mobile
      //     ? MainAxisAlignment.spaceEvenly
      //     : MainAxisAlignment.spaceEvenly;
      return Scaffold(
        backgroundColor: isDark ? Colors.black54 : Colors.white,
        appBar: AppBar(
          foregroundColor: isDark ? Colors.white : Colors.black,
          backgroundColor:
              isDark ? const Color.fromARGB(210, 30, 30, 30) : Colors.white,
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
              icon: const Icon(Icons.more_vert_rounded),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: topHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isDark
                      ? const [
                          Color.fromARGB(210, 30, 30, 30),
                          Color.fromARGB(249, 67, 67, 67)
                        ]
                      : const [
                          Colors.white,
                          Color.fromARGB(255, 211, 227, 248),
                          Color.fromARGB(255, 180, 206, 241),
                        ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                // image: DecorationImage(
                //   image: AssetImage('assets/gpayprofileback.png'),
                //   fit: BoxFit.cover,
                //   opacity: 0.25,
                // ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vipul Lokhande',
                            style: TextStyle(
                              fontSize: 20,
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '+91 7744959632',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: isDark
                                  ? const Color.fromARGB(255, 197, 196, 196)
                                  : const Color.fromARGB(255, 44, 44, 44),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'vipullokhande1@okhdfcbank',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: isDark
                                  ? const Color.fromARGB(255, 197, 196, 196)
                                  : const Color.fromARGB(255, 44, 44, 44),
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Stack(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              widget.asset,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Positioned(
                            bottom: 1,
                            right: 1,
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  26,
                                ),
                              ),
                              child: IconButton(
                                color: Colors.black,
                                splashColor: Colors.purple,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.qr_code_scanner_rounded,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ListTile(
                    leading: ClipOval(
                      child: Image.asset(
                        'assets/rewards.png',
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    title: Text(
                      '₹$rewcount Rewards earned',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              clipBehavior: Clip.antiAlias,
              color:
                  isDark ? const Color.fromARGB(255, 39, 39, 39) : Colors.white,
              margin: resMargin,
              child: SizedBox(
                height: heightt,
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 3,
                      ),
                      leading: Expanded(
                        child: Text(
                          'Set up payment methods 1/2',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward,
                        color: Colors.blue,
                      ),
                      onTap: () {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          splashColor: const Color.fromARGB(255, 231, 204, 236),
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.blinds_closed_rounded,
                                  color: Colors.blue,
                                  size: 38,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Bank account',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.3,
                                    color: isDark ? Colors.white : Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '$accounts account',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.3,
                                    color: isDark
                                        ? const Color.fromARGB(
                                            206, 255, 255, 255)
                                        : const Color.fromARGB(255, 45, 45, 45),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: const Color.fromARGB(255, 231, 204, 236),
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.credit_card_rounded,
                                  color: Colors.blue,
                                  size: 38,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Pay businesses',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.3,
                                    color: isDark ? Colors.white : Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Credit / debit card',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.3,
                                    color: isDark
                                        ? const Color.fromARGB(
                                            203, 255, 255, 255)
                                        : const Color.fromARGB(255, 45, 45, 45),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: botPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.card_giftcard_rounded,
                      color: Colors.blue,
                    ),
                    title: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Invite friends ,get rewards',
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: isDark ? Colors.white : Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'share your code ac8bx3e',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: isDark
                                  ? const Color.fromARGB(225, 255, 255, 255)
                                  : const Color.fromARGB(255, 66, 65, 65),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: TextButton(
                      onPressed: () {},
                      child: const Text('Share'),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SettingsScreen(),
                        ),
                      );
                    },
                    leading: const Icon(
                      Icons.settings,
                      color: Colors.blue,
                    ),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.help_outline_rounded,
                      color: Colors.blue,
                    ),
                    title: Text(
                      'Get help',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
