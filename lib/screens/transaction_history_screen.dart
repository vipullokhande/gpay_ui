import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui/controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;

    final searchController = TextEditingController();
    List<String> titles = [
      'Jio Prepaid',
      'Mohan Sweets',
      'Omkar Snacks',
      'Saurabh Mishra',
      'Jio Prepaid',
      'Mohan Sweets',
      'Omkar Snacks',
      'Saurabh Mishra',
      'Jio Prepaid',
      'Mohan Sweets',
      'Omkar Snacks',
      'Saurabh Mishra'
    ];
    List<String> assets = [
      'assets/jio.png',
      'assets/redbus.png',
      'assets/mv.png',
      'assets/5paisa.png',
      'assets/maha.png',
      'assets/mv.png',
      'assets/jio.png',
      'assets/redbus.png',
      'assets/mv.png',
      'assets/5paisa.png',
      'assets/maha.png',
      'assets/mv.png'
    ];
    List<String> subtitles = [
      '${DateTime.now()}',
      '${DateTime.now()}',
      '${DateTime.now()}',
      '${DateTime.now()}',
      '${DateTime.now()}',
      '${DateTime.now()}',
      '${DateTime.now()}',
      '${DateTime.now()}',
      '${DateTime.now()}',
      '${DateTime.now()}',
      '${DateTime.now()}',
      '${DateTime.now()}'
    ];
    List<String> amounts = [
      '- ₹20',
      '- ₹10',
      '- ₹70',
      '- ₹40',
      '- ₹90',
      '- ₹40',
      '- ₹60',
      '- ₹80',
      '- ₹30',
      '- ₹90',
      '- ₹10',
      '- ₹20',
    ];
    return Scaffold(
      backgroundColor:
          isDark ? const Color.fromARGB(220, 12, 12, 12) : Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.94,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
              title: TextFormField(
                controller: searchController,
                onChanged: (val) {
                  // if (val.isNotEmpty) {
                  //   for (var title in titles) {
                  //     if (title.toLowerCase().contains(val.toLowerCase())) {

                  //     }
                  //   }
                  // }
                },
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Search transactions',
                  hintStyle: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  prefixIcon: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 1,
                      color: isDark ? Colors.blue : Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      width: 1,
                      color: isDark ? Colors.blue : Colors.grey,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert_rounded,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: titles.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final asset = assets[index];
                final title = titles[index];
                final subtitle = subtitles[index];
                final amount = amounts[index];
                return ListTile(
                  onTap: () {},
                  leading: ClipOval(
                    child: Image.asset(
                      asset,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    title,
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    subtitle,
                    maxLines: 1,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: isDark
                          ? const Color.fromARGB(255, 198, 196, 196)
                          : Colors.black,
                    ),
                  ),
                  trailing: Text(
                    amount,
                    style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
