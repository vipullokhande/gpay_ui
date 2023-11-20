import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gpay_ui/controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  bool isSearch = false;
  List<String> searchResTitles = [];
  List<String> searchResAssets = [];
  List<String> searchResSubtitles = [];
  List<String> searchResAmounts = [];
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
      // '${DateTime.now()}',
      // '${DateTime.now()}',
      // '${DateTime.now()}',
      // '${DateTime.now()}',
      // '${DateTime.now()}',
      // '${DateTime.now()}',
      // '${DateTime.now()}',
      // '${DateTime.now()}',
      // '${DateTime.now()}',
      // '${DateTime.now()}',
      // '${DateTime.now()}',
      // '${DateTime.now()}'
      '2023-01-23',
      '2023-01-01',
      '2023-11-09',
      '2023-08-12',
      '2023-01-23',
      '2023-01-01',
      '2023-11-09',
      '2023-08-12',
      '2023-01-23',
      '2023-01-01',
      '2023-11-09',
      '2023-08-12',
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
                // onTap: () {
                //   setState(() {
                //     isSearch = true;
                //   });
                // },
                onEditingComplete: () {
                  setState(() {
                    // if (searchController.text.isEmpty) {
                    //   setState(() {
                    //     isSearch = false;
                    //   });
                    // }
                    for (int i = 0; i < titles.length; i++) {
                      if (searchResTitles.isEmpty) {
                        if (titles[i]
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          searchResTitles.add(titles[i]);
                          searchResAssets.add(assets[i]);
                          searchResSubtitles.add(subtitles[i]);
                          searchResAmounts.add(amounts[i]);
                          isSearch = true;
                        }
                      }
                    }
                  });
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
                      if (isSearch) {
                        if (FocusScope.of(context).hasFocus) {
                          setState(() {
                            isSearch = false;
                          });
                          FocusScope.of(context).unfocus();
                        }
                        searchResAssets.clear();
                        searchResSubtitles.clear();
                        searchResAmounts.clear();
                        searchResSubtitles.clear();
                        setState(() {
                          isSearch = false;
                        });
                      } else {
                        Navigator.of(context).pop();
                      }
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
                    onPressed: () {
                      if (searchController.text.isNotEmpty) {
                        setState(() {
                          searchController.text = '';
                        });
                      }
                    },
                    icon: Icon(
                      searchController.text.isEmpty
                          ? Icons.more_vert_outlined
                          : Icons.close,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          isSearch
              ? Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: searchResTitles.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final asset = searchResAssets[index];
                      final title = searchResTitles[index];
                      final subtitle = searchResSubtitles[index];
                      final amount = searchResAmounts[index];
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
                )
              : Expanded(
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
