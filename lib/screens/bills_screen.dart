import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui/controllers/dark_mode_controller.dart';
import 'package:gpay_ui/widgets/mid_bill.dart';

import '../models/bill_model.dart';

class BillsScreen extends StatefulWidget {
  const BillsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BillsScreen> createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  List<Bill> utilityBill = [
    Bill(
      title: 'Electricity',
      icon: Icons.lightbulb,
    ),
    Bill(
      title: 'Broadband / \nLandline',
      icon: Icons.router_sharp,
    ),
    Bill(
      title: 'Postpaid mobile',
      icon: Icons.mobile_friendly_rounded,
    ),
    Bill(
      title: 'Water',
      icon: Icons.bubble_chart,
    ),
    Bill(
      title: 'Piped gas',
      icon: Icons.gas_meter_rounded,
    ),
    Bill(
      title: 'Education',
      icon: Icons.school_rounded,
    ),
    Bill(
      title: 'Gas\ncylinder\nbooking',
      icon: FontAwesomeIcons.gasPump,
    ),
  ];
  List<Bill> financeBill = [
    Bill(
      title: 'Insurance',
      icon: Icons.verified_user,
    ),
    Bill(
      title: 'Loan EMI\npayment',
      icon: Icons.insert_drive_file_rounded,
    ),
    Bill(
      title: 'Credit card\nbill\npayment',
      icon: FontAwesomeIcons.creditCard,
    ),
    Bill(
      title: 'Municipal\ntax / \nservice',
      icon: Icons.location_city,
    ),
    Bill(
      title: 'Recurring\ndeposit',
      icon: Icons.movie_filter_sharp,
    ),
  ];
  List<Bill> rechargeBill = [
    Bill(
      title: 'Mobile recharge',
      icon: Icons.mobile_friendly_rounded,
    ),
    Bill(
      title: 'DTH / Cable\nTV',
      icon: Icons.tv,
    ),
    Bill(
      title: 'Google Play',
      icon: FontAwesomeIcons.googlePlay,
    ),
    Bill(
      title: 'FASTTag\nrecharge',
      icon: Icons.directions_car_sharp,
    ),
  ];
  List<Bill> updated = [];
  search(String query) {
    final usuggestions = utilityBill.where((bill) {
      final title = bill.title.toLowerCase();
      return title.contains(query.toLowerCase());
    }).toList();
    final fsuggestions = financeBill.where((bill) {
      final title = bill.title.toLowerCase();
      return title.contains(query.toLowerCase());
    }).toList();
    final rsuggestions = rechargeBill.where((bill) {
      final title = bill.title.toLowerCase();
      return title.contains(query.toLowerCase());
    }).toList();
    setState(() {
      updated = usuggestions + fsuggestions + rsuggestions;
    });
  }

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;

    return Scaffold(
      backgroundColor:
          isDark ? const Color.fromARGB(115, 37, 37, 37) : Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: isDark ? Colors.white : Colors.black,
        backgroundColor: isDark ? Colors.black : Colors.white,
        leading: IconButton(
          onPressed: () {
            if (updated.isNotEmpty) {
              setState(() {
                updated.clear();
              });
            } else {
              Navigator.of(context).pop();
            }
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: SizedBox(
          height: 55,
          child: TextFormField(
            controller: searchController,
            onChanged: search,
            style: TextStyle(
              color: isDark ? Colors.white : Colors.black,
            ),
            textAlign: TextAlign.start,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Search billers',
              hintStyle: TextStyle(
                color: isDark ? Colors.white : Colors.black,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: isDark ? Colors.white : Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (searchController.text.isEmpty) {
                return;
              } else {
                setState(() {
                  updated.clear();
                  searchController.text = '';
                });
              }
            },
            icon: Icon(
              searchController.text.isEmpty
                  ? Icons.more_vert_rounded
                  : Icons.clear,
            ),
          ),
        ],
      ),
      body: updated.isNotEmpty
          ? Wrap(
              children: [
                for (int i = 0; i < updated.length; i++)
                  MidBillWidget(
                    icon: updated[i].icon,
                    text: updated[i].title,
                  ),
              ],
            )
          : ListView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 4,
                      ),
                      child: Text(
                        'Payment categories',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 12,
                      ),
                      child: Text(
                        'RECHARGE',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    Wrap(
                      children: [
                        for (int i = 0; i < rechargeBill.length; i++)
                          MidBillWidget(
                            icon: rechargeBill[i].icon,
                            text: rechargeBill[i].title,
                          ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 12,
                      ),
                      child: Text(
                        'UTILITY BILLS',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    Wrap(
                      children: [
                        for (int i = 0; i < utilityBill.length; i++)
                          MidBillWidget(
                            icon: utilityBill[i].icon,
                            text: utilityBill[i].title,
                          ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 12,
                      ),
                      child: Text(
                        'FINANCE & TAX',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    Wrap(
                      children: [
                        for (int i = 0; i < financeBill.length; i++)
                          MidBillWidget(
                            icon: financeBill[i].icon,
                            text: financeBill[i].title,
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
