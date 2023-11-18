import 'package:flutter/material.dart';
import 'package:gpay_ui/screens/bills_screen.dart';
import 'package:gpay_ui/screens/offers_screen.dart';
import 'package:gpay_ui/screens/profile_screen.dart';
import 'package:gpay_ui/screens/refferels_screen.dart';
import 'package:gpay_ui/screens/rewards_screen.dart';
import 'package:gpay_ui/screens/transaction_history_screen.dart';
import 'package:gpay_ui/widgets/chip.dart';
import 'package:gpay_ui/widgets/drop_widget.dart';
import 'package:gpay_ui/widgets/grid_widget.dart';
import 'package:gpay_ui/widgets/mid.dart';
import 'package:provider/provider.dart';
import '../controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String assets = 'assets/vip.png';
  bool panel = true;

  List<String> logos = [
    'assets/maha.png',
    'assets/jio.png',
    'assets/redbus.png',
    'assets/mv.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFmL8yI75EyfanQr0X7OONurtiEUjG9dHZFA&usqp=CAU',
    'https://play-lh.googleusercontent.com/mlu3_G6TXUBcJCMeOpYu5RJaZIEOjZkykAhE0I8YcZBBsJ717ni02wy0dP4Ssh7gih5K',
    'assets/5paisa.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQrF0tUNLkb0tnsVJFHO4ezf2ZByHMWJ-_5Q&usqp=CAU',
    'https://play-lh.googleusercontent.com/mlu3_G6TXUBcJCMeOpYu5RJaZIEOjZkykAhE0I8YcZBBsJ717ni02wy0dP4Ssh7gih5K',
    'assets/5paisa.png'
  ];
  List<String> names = [
    'Mahavitran',
    'Jio Prepaid',
    'Redbus',
    'Money view',
    'Nearby store',
    'CASHe',
    '5paisa',
    'Nearby store',
    'CASHe',
    '5paisa'
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    final size = MediaQuery.of(context).size;
    String upiID = 'xnmae1@okhdfcbank';
    Color expTileColor = isDark ? Colors.white : Colors.black;
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            height: size.height * 0.1,
            width: size.width,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: isDark ? Colors.black : Colors.white38,
              image: const DecorationImage(
                image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxl-ddjYk5x_tSNGQ7fjWBw3h9HMEogxXK_w&usqp=CAU",
                ),
                fit: BoxFit.cover,
                isAntiAlias: true,
              ),
            ),
            child: ListTile(
              title: TextFormField(
                enabled: false,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  fillColor: isDark ? Colors.black : Colors.white,
                  filled: true,
                  hintText: 'Pay friends and merchants',
                  prefixIcon: Icon(
                    Icons.search,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 1,
                      color: isDark ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                        asset: assets,
                      ),
                    ),
                  );
                },
                child: ClipOval(
                  child: Image.asset(
                    assets,
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: size.height * 0.25,
            padding: const EdgeInsets.only(
              top: 10,
            ),
            width: size.width,
            // clipBehavior: Clip.antiAlias,
            // decoration: BoxDecoration(
            // border: Border.all(
            //   color: Colors.black,
            //   width: 1,
            // ),
            //   color: Colors.white,
            //   borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(20),
            //     topRight: Radius.circular(20),
            //   ),
            // ),
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                GridWidget(
                  icon: Icons.qr_code_scanner_rounded,
                  text: 'Scan any\n QR Code',
                  onTap: () {},
                ),
                GridWidget(
                  icon: Icons.perm_contact_calendar_sharp,
                  text: 'Pay\n Contacts',
                  onTap: () {},
                ),
                GridWidget(
                  icon: Icons.send_to_mobile_rounded,
                  text: 'Pay phone\n number',
                  onTap: () {},
                ),
                GridWidget(
                  icon: Icons.card_travel_rounded,
                  text: 'Bank\n transfer',
                  onTap: () {},
                ),
                GridWidget(
                  icon: Icons.settings_backup_restore_rounded,
                  text: 'Pay UPI ID\n or number',
                  onTap: () {},
                ),
                GridWidget(
                  icon: Icons.person,
                  text: 'Self\n transfer',
                  onTap: () {},
                ),
                GridWidget(
                  icon: Icons.electric_bolt_outlined,
                  text: 'Pay\n bills',
                  onTap: () {},
                ),
                GridWidget(
                  icon: Icons.mobile_friendly_sharp,
                  text: 'Mobile\n recharge',
                  onTap: () {},
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            alignment: Alignment.center,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: isDark ? Colors.black : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
                fixedSize: Size(size.width - 80, 40),
              ),
              onPressed: () {},
              icon: const Icon(Icons.copy),
              label: Text('UPI ID : $upiID'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 9),
            child: Text(
              'People',
              style: TextStyle(
                color: isDark
                    ? Colors.white
                    : const Color.fromARGB(255, 44, 43, 43),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: 16),
            leading: Image.asset('assets/bg.png'),
            title: Text(
              'People you\'ve recently paid will show up here ',
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              children: [
                Text(
                  'Businessess',
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 170, 213, 249),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(
                    Icons.explore,
                    color: Colors.blue.shade900,
                  ),
                  label: const Text(
                    'Explore',
                    style: TextStyle(
                      color: Color.fromARGB(255, 10, 2, 240),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.15,
            width: size.width,
            child: ListView.builder(
              itemCount: logos.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                final image = logos[index];
                final name = names[index];
                return SizedBox(
                  width: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: image.length > 30
                            ? Image.network(
                                image,
                                isAntiAlias: true,
                                height: 60,
                                width: 60,
                              )
                            : Image.asset(
                                image,
                                isAntiAlias: true,
                                height: 60,
                                width: 60,
                              ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Bill recharges and more",
              style: TextStyle(
                fontSize: 20,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              splashColor: Colors.purple,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const Scaffold(
                      body: SizedBox(
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: Icon(Icons.facebook),
                      ),
                    ),
                  ),
                );
              },
              child: Ink(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: isDark
                      ? const Color.fromARGB(255, 48, 47, 47)
                      : const Color.fromARGB(255, 235, 234, 234),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/maha.png',
                        isAntiAlias: true,
                        width: 60,
                        height: 60,
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Expanded(
                      child: Text(
                        'Mahavitaran - \nMaharashtra Electricity',
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: size.height * 0.36,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            margin: const EdgeInsets.all(
              15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: isDark
                  ? const Color.fromARGB(255, 48, 47, 47)
                  : const Color.fromARGB(255, 235, 234, 234),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'ALSO TRY ADDING',
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    Mid(
                      icon: Icons.phone_android_rounded,
                      text: 'Postpaid mobile',
                    ),
                    Mid(
                      icon: Icons.wifi_password_rounded,
                      text: 'Broadband /\nLandline',
                    ),
                    Mid(
                      icon: Icons.gas_meter_outlined,
                      text: 'Piped gas',
                    ),
                  ],
                ),
              ],
            ),
          ),
          FilterChip(
            onSelected: (value) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const BillsScreen(),
                ),
              );
            },
            backgroundColor: isDark
                ? const Color.fromARGB(255, 48, 47, 47)
                : Colors.blue.shade100,
            label: Text(
              'see all',
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
              side: const BorderSide(
                width: 1,
                color: Colors.blueAccent,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 9,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: isDark
                  ? const Color.fromARGB(255, 48, 47, 47)
                  : const Color.fromARGB(255, 235, 234, 234),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ExpansionTile(
              collapsedTextColor: expTileColor,
              textColor: expTileColor,
              collapsedIconColor: expTileColor,
              // collapsedTextColor: isDark ? Colors.white : Colors.black,
              // textColor: isDark ? Colors.white : Colors.black,
              // collapsedIconColor: isDark ? Colors.white : Colors.black,
              tilePadding: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 5,
              ),
              childrenPadding: const EdgeInsets.symmetric(
                horizontal: 3,
                vertical: 5,
              ),
              // backgroundColor: isDark
              //     ? const Color.fromARGB(255, 48, 47, 47)
              //     : const Color.fromARGB(255, 235, 234, 234),
              // collapsedBackgroundColor: isDark
              //     ? const Color.fromARGB(255, 48, 47, 47)
              //     : const Color.fromARGB(255, 235, 234, 234),
              onExpansionChanged: (value) {
                setState(() {
                  panel = value;
                });
              },
              trailing: Icon(
                size: 50,
                panel
                    ? Icons.arrow_drop_up_rounded
                    : Icons.arrow_drop_down_rounded,
                color: isDark ? Colors.white : Colors.black,
              ),
              title: Row(
                children: [
                  DropWidget(image: 'assets/jio.png', text: 'Jio'),
                  DropWidget(image: 'assets/redbus.png', text: 'Redbus'),
                  DropWidget(image: 'assets/5paisa.png', text: '5Paisa'),
                ],
              ),
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.14,
                      child: Row(
                        children: [
                          DropWidget(
                              image: 'assets/maha.png', text: 'Mahavitran'),
                          DropWidget(
                              image: 'assets/mv.png', text: 'Movie view'),
                          DropWidget(
                              image: 'assets/5paisa.png', text: '5Paisa'),
                          DropWidget(image: 'assets/jio.png', text: 'Jio'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.14,
                      child: Row(
                        children: [
                          DropWidget(
                              image: 'assets/redbus.png', text: 'Redbus'),
                          DropWidget(
                              image: 'assets/5paisa.png', text: '5Paisa'),
                          DropWidget(image: 'assets/jio.png', text: 'Jio'),
                          DropWidget(image: 'assets/redbus.png', text: 'Redbus')
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Promotions',
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      DropWidget(
                        image: 'assets/rewards.png',
                        text: 'Rewards',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const RewardsScreen(),
                            ),
                          );
                        },
                      ),
                      DropWidget(
                        image: 'assets/offers.png',
                        text: 'Offers',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const OffersScreen(),
                            ),
                          );
                        },
                      ),
                      DropWidget(
                        image: 'assets/invite.png',
                        text: 'Invite Friends',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => const ReferrelsScreen()));
                        },
                      ),
                      DropWidget(
                        image: 'assets/ihome.png',
                        text: 'Indi-home',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  child: Text(
                    'Manage your money',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Wrap(
                  children: [
                    GChip(
                      text: 'Loans',
                      icon: Icons.local_activity,
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GChip(
                      text: 'Gold',
                      icon: Icons.flourescent_rounded,
                      onTap: () {},
                    ),
                  ],
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const TransactionHistoryScreen(),
                      ),
                    );
                  },
                  leading: const Icon(
                    Icons.access_time_rounded,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'Show transaction history',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black87,
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.house_siding_rounded,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'Check bank balance',
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black87,
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                Container(
                  height: 170,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    image: const DecorationImage(
                      image: AssetImage('assets/backbottom.png'),
                      fit: BoxFit.cover,
                      opacity: 0.3,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Invite your friends to Google Pay',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        'invite your friends to Google Pay and get ₹101 when your friends their first payment. Thet get ₹21!',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 5,
                        ),
                        leading: Text(
                          'Copy your code',
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                        title: Text(
                          'ac8bx3e',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.copy,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
