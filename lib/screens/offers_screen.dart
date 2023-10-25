import 'package:flutter/material.dart';
import 'package:gpay_ui/screens/instantscreens/instant_offer_screen.dart';
import 'package:gpay_ui/widgets/popular_offer_widget.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui/controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class OffersScreen extends StatefulWidget {
  const OffersScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  List<String> assetsname = [
    'assets/jio.png',
    'assets/redbus.png',
    'assets/mv.png',
    'assets/5paisa.png',
    'assets/maha.png',
    'assets/mv.png',
    'assets/jio.png',
    'assets/redbus.png',
    'assets/mv.png'
  ];
  List<String> names = [
    'Jio',
    'Redbus',
    'Model view',
    '5Paisa',
    'Mahavitaran',
    'Model view',
    'Jio',
    'Redbus',
    'Model view',
  ];
  List<String> titles = [
    '₹20 cashback',
    '90% off ',
    '₹500 voucher',
    '₹100 bonus',
    'Cashback upto ₹50',
    '₹20 cashback',
    '90% off ',
    '₹500 voucher',
    '₹100 off',
  ];
  List<String> subtitles = [
    'Upto ₹20 cashback on Mobile recharges Upto ₹20 cashback on Mobile recharges',
    '90% off on redbus booking',
    'Voucher off worth ₹500',
    '₹100 bonus on opening account',
    'Cashback upto ₹50',
    'Upto ₹20 cashback on Mobile recharges',
    '90% off on redbus booking',
    'Voucher off worth ₹500',
    '₹100 bonus on opening account',
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    return Scaffold(
      backgroundColor:
          isDark ? const Color.fromARGB(115, 37, 37, 37) : Colors.white,
      appBar: AppBar(
        toolbarHeight: 55,
        foregroundColor: isDark ? Colors.white : Colors.black,
        backgroundColor: isDark ? Colors.black : Colors.white,
        elevation: 0,
        leading: IconButton(
          tooltip: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: const Text('Offers'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: Text(
              'Popular offers',
              style: TextStyle(
                fontSize: 22,
                color: isDark ? Colors.white : Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              clipBehavior: Clip.antiAlias,
              itemCount: assetsname.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final asset = assetsname[index];
                final name = names[index];
                final title = titles[index];
                final subtitle = subtitles[index];
                return PopularOfferWidget(
                  text: asset,
                  name: name,
                  title: title,
                  subtitle: subtitle,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InstantOfferScreen(
                            text: asset,
                            title: title,
                            subtitle: subtitle,
                            onTap: () {})));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
