import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui/controllers/dark_mode_controller.dart';
import 'package:gpay_ui/widgets/mid_bill.dart';
class BillsScreen extends StatelessWidget {

  const BillsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        bool isDark = context.watch<DarkModeController>().isDark;

    return Scaffold(
      backgroundColor:
          isDark ? const Color.fromARGB(115, 37, 37, 37) : Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        foregroundColor: isDark ? Colors.white : Colors.black,
        backgroundColor: isDark ? Colors.black : Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: TextFormField(
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
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.grey,
              ),
            ),
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
                  MidBillWidget(
                    icon: Icons.mobile_friendly_rounded,
                    text: 'Mobile recharge',
                  ),
                  MidBillWidget(
                    icon: Icons.tv,
                    text: 'DTH / Cable\nTV',
                  ),
                  MidBillWidget(
                    icon: FontAwesomeIcons.googlePlay,
                    text: 'Google Play',
                  ),
                  MidBillWidget(
                    icon: Icons.directions_car_sharp,
                    text: 'FASTTag\nrecharge',
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
                  MidBillWidget(
                    icon: Icons.lightbulb,
                    text: 'Electricity',
                  ),
                  MidBillWidget(
                    icon: Icons.router_sharp,
                    text: 'Broadband / \nLandline',
                  ),
                  MidBillWidget(
                    icon: Icons.mobile_friendly_rounded,
                    text: 'Postpaid mobile',
                  ),
                  MidBillWidget(
                    icon: Icons.bubble_chart,
                    text: 'Water',
                  ),
                  MidBillWidget(
                    icon: Icons.gas_meter_rounded,
                    text: 'Piped gas',
                  ),
                  MidBillWidget(
                    icon: Icons.school_rounded,
                    text: 'Education',
                  ),
                  MidBillWidget(
                    icon: FontAwesomeIcons.gasPump,
                    text: 'Gas\ncylinder\nbooking',
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
                  MidBillWidget(
                    icon: Icons.verified_user,
                    text: 'Insurance',
                  ),
                  MidBillWidget(
                    icon: Icons.insert_drive_file_rounded,
                    text: 'Loan EMI\npayment',
                  ),
                  MidBillWidget(
                    icon: FontAwesomeIcons.creditCard,
                    text: 'Credit card\nbill\npayment',
                  ),
                  MidBillWidget(
                    icon: Icons.location_city,
                    text: 'Municipal\ntax / \nservice',
                  ),
                  MidBillWidget(
                    icon: Icons.movie_filter_sharp,
                    text: 'Recurring\ndeposit',
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
