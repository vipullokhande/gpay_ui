import 'package:flutter/material.dart';
import 'package:gpay_ui/models/businesses_model.dart';
import 'package:gpay_ui/models/person_model.dart';
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
import 'package:gpay_ui/widgets/people_widget.dart';
import 'package:gpay_ui/widgets/single_business.dart';
import 'package:provider/provider.dart';
import '../controllers/dark_mode_controller.dart';

// ignore: must_be_immutable
// class SearchSinglee {
//   final String name;
//   final String asset;

//   SearchSinglee({
//     required this.name,
//     required this.asset,
//   });
// }

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
  String getInitials(String fullName) {
    List<String> names = fullName.split(" ");
    String initials = names[0][0] + names[1][0];
    return initials;
  }

  List<Person> searchPersonList = [];
  List<BusinessesModel> searchBusinessList = [];
  // List<SearchSinglee> searchList = [];
  search(String query) {
    final businesssuggestions = businesses.where((b) {
      final bname = b.businessName.toLowerCase();
      // ignore: iterable_contains_unrelated_type
      return bname.contains(query.toLowerCase());
    }).toList();
    final personsuggestions = person.where((p) {
      final pname = p.name.toLowerCase();
      // ignore: iterable_contains_unrelated_type
      return pname.contains(query.toLowerCase());
    }).toList();
    // for (var i = 0; i < personsuggestions.length; i++) {
    //   searchList.add(SearchSinglee(
    //       name: personsuggestions[i].name,
    //       asset: personsuggestions[i].bg.toString()));
    // }
    // for (var i = 0; i < businesssuggestions.length; i++) {
    //   searchList.add(SearchSinglee(
    //       name: businesssuggestions[i].businessName,
    //       asset: businesssuggestions[i].businessAsset));
    // }
    setState(() {
      searchBusinessList = businesssuggestions;
      searchPersonList = personsuggestions;
      //searchList = searchList;
    });
  }

  List<Person> person = [
    Person(
      name: 'Akshay Kumar',
      bg: Colors.blue,
    ),
    Person(
      name: 'Katrina Kaif',
      bg: Colors.red,
    ),
    Person(
      name: 'Bill Gates',
      bg: Colors.orange,
    ),
    Person(
      name: 'Elon Musk',
      bg: Colors.yellowAccent.shade700,
    ),
    Person(
      name: 'Jeff Bezos',
      bg: Colors.greenAccent.shade700,
    ),
    Person(
      name: 'Warren Buffet',
      bg: Colors.cyan,
    ),
    Person(
      name: 'Tim Cook',
      bg: Colors.purple,
    ),
    Person(
      name: 'Mark Zuckerburg',
      bg: Colors.blueGrey,
    ),
    Person(
      name: 'Jack Maa',
      bg: Colors.redAccent,
    ),
  ];
  List<Color> personBG = [
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.yellowAccent.shade700,
    Colors.pink,
    Colors.greenAccent.shade700,
    Colors.cyan,
    Colors.purple,
    Colors.blueGrey,
    Colors.redAccent,
    Colors.blue.shade400,
    Colors.red.shade400,
    Colors.orange.shade400,
    Colors.pink.shade400,
    Colors.green.shade900,
    Colors.cyan.shade400,
    Colors.purple.shade400,
    Colors.blueGrey.shade400,
    Colors.redAccent.shade400,
  ];
  List<String> personNames = [
    'Akshay Kumar',
    'Katrina Kaif',
    'Bill Gates',
    'Elon Musk',
    'Jeff Bezos',
    'Warren Buffet',
    'Akshay Kumar',
    'Katrina Kaif',
    'Bill Gates',
    'Elon Musk',
    'Jeff Bezos',
    'Warren Buffet',
    'Tim Cook',
    'S K',
    'Bill Gates',
    'Elon Musk',
    'Jeff Bezos',
    'Warren Buffet',
    'Akshay Kumar',
    'Katrina Kaif',
    'Bill Gates',
    'Elon Musk',
    'Jeff Bezos',
  ];
  List<BusinessesModel> businesses = [
    BusinessesModel(
      businessName: 'Mahavitran',
      businessAsset: 'assets/maha.png',
    ),
    BusinessesModel(
      businessName: 'Jio Prepaid',
      businessAsset: 'assets/jio.png',
    ),
    BusinessesModel(
      businessName: 'Redbus',
      businessAsset: 'assets/redbus.png',
    ),
    BusinessesModel(
      businessName: 'Money view',
      businessAsset: 'assets/mv.png',
    ),
    BusinessesModel(
      businessName: 'Nearby store',
      businessAsset:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFmL8yI75EyfanQr0X7OONurtiEUjG9dHZFA&usqp=CAU',
    ),
    BusinessesModel(
      businessName: 'CASHe',
      businessAsset:
          'https://play-lh.googleusercontent.com/mlu3_G6TXUBcJCMeOpYu5RJaZIEOjZkykAhE0I8YcZBBsJ717ni02wy0dP4Ssh7gih5K',
    ),
    BusinessesModel(
      businessName: '5paisa',
      businessAsset: 'assets/5paisa.png',
    ),
    BusinessesModel(
      businessName: 'Nearby store',
      businessAsset:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQrF0tUNLkb0tnsVJFHO4ezf2ZByHMWJ-_5Q&usqp=CAU',
    ),
    BusinessesModel(
      businessName: 'CASHe',
      businessAsset:
          'https://play-lh.googleusercontent.com/mlu3_G6TXUBcJCMeOpYu5RJaZIEOjZkykAhE0I8YcZBBsJ717ni02wy0dP4Ssh7gih5K',
    ),
    BusinessesModel(
      businessName: '5paisa',
      businessAsset: 'assets/5paisa.png',
    ),
  ];
  // List<String> logos = [
  //   'assets/maha.png',
  //   'assets/jio.png',
  //   'assets/redbus.png',
  //   'assets/mv.png',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFmL8yI75EyfanQr0X7OONurtiEUjG9dHZFA&usqp=CAU',
  //   'https://play-lh.googleusercontent.com/mlu3_G6TXUBcJCMeOpYu5RJaZIEOjZkykAhE0I8YcZBBsJ717ni02wy0dP4Ssh7gih5K',
  //   'assets/5paisa.png',
  //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQrF0tUNLkb0tnsVJFHO4ezf2ZByHMWJ-_5Q&usqp=CAU',
  //   'https://play-lh.googleusercontent.com/mlu3_G6TXUBcJCMeOpYu5RJaZIEOjZkykAhE0I8YcZBBsJ717ni02wy0dP4Ssh7gih5K',
  //   'assets/5paisa.png'
  // ];
  // List<String> names = [
  //   'Mahavitran',
  //   'Jio Prepaid',
  //   'Redbus',
  //   'Money view',
  //   'Nearby store',
  //   'CASHe',
  //   '5paisa',
  //   'Nearby store',
  //   'CASHe',
  //   '5paisa'
  // ];
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<DarkModeController>().isDark;
    final size = MediaQuery.of(context).size;
    String upiID = 'xnmae1@okhdfcbank';
    Color expTileColor = isDark ? Colors.white : Colors.black;
    return Scaffold(
      backgroundColor:
          isDark ? const Color.fromARGB(255, 24, 24, 24) : Colors.white,
      appBar: AppBar(
        backgroundColor:
            isDark ? const Color.fromARGB(255, 24, 24, 24) : Colors.white,
        toolbarHeight: size.height * 0.07,
        title: ListTile(
          // titleAlignment: ListTileTitleAlignment.center,
          title: SizedBox(
            height: 50,
            child: TextFormField(
              controller: searchController,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
              ),
              onChanged: search,
              decoration: InputDecoration(
                fillColor: isDark
                    ? const Color.fromARGB(255, 69, 69, 69)
                    : Colors.white,
                filled: true,
                hintText: 'Pay friends and merchants',
                hintStyle: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
                prefixIcon: IconButton(
                  onPressed: () {
                    if (searchPersonList.isNotEmpty ||
                        searchBusinessList.isNotEmpty) {
                      if (searchController.text.isEmpty) {
                        if (FocusScope.of(context).hasFocus) {
                          FocusScope.of(context).unfocus();
                        }
                        setState(() {
                          searchController.text = '';
                          searchPersonList.clear();
                          searchBusinessList.clear();
                        });
                      } else {
                        if (FocusScope.of(context).hasFocus) {
                          FocusScope.of(context).unfocus();
                        }
                        setState(() {
                          searchController.text = '';
                          searchPersonList.clear();
                          searchBusinessList.clear();
                        });
                      }
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  icon: Icon(
                    searchPersonList.isEmpty
                        ? Icons.search
                        : Icons.arrow_back_ios_new_rounded,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                suffixIcon: searchController.text.isEmpty
                    ? const SizedBox()
                    : IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            searchPersonList.clear();
                            searchController.text = '';
                          });
                        },
                        icon: Icon(
                          Icons.clear,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    width: 1,
                    color: isDark ? Colors.white12 : Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    width: 1,
                    color: isDark ? Colors.white : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    asset: assets,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 25),
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
        ],
      ),
      body: searchPersonList.isNotEmpty || searchBusinessList.isNotEmpty
          ?
          // Flexible(child: ListView.builder(itemBuilder: (context, index) {
          //     return SearchResultWidget(
          //         name: searchList[index].name, image: searchList[index].asset);
          //   }))

          Wrap(
              children: [
                for (int i = 0; i < searchPersonList.length; i++)
                  PeopleWidget(
                    name: searchPersonList[i].name,
                    getInitial: getInitials(searchPersonList[i].name),
                    color: searchPersonList[i].bg,
                  ),
                for (int i = 0; i < searchBusinessList.length; i++)
                  SingleBusinessWidget(
                    businessesModel: searchBusinessList[i],
                    onTap: () {},
                    onLongPress: () {},
                  ),
              ],
            )
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              scrollDirection: Axis.vertical,
              children: <Widget>[
                // Container(
                //   height: size.height * 0.1,
                //   width: size.width,
                //   alignment: Alignment.center,
                //   margin: const EdgeInsets.symmetric(
                //     vertical: 8,
                //   ),
                //   decoration: BoxDecoration(
                //     color: isDark ? Colors.black : Colors.white38,
                //     image: const DecorationImage(
                //       image: NetworkImage(
                //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVOIYQrX9h0FA7v7Kl1F-7UujQcl-ZElDoNg&usqp=CAU",
                //       ),
                //       fit: BoxFit.cover,
                //       isAntiAlias: true,
                //     ),
                //   ),
                //   child: ListTile(
                //     titleAlignment: ListTileTitleAlignment.center,
                //     title: SizedBox(
                //       height: 50,
                //       child: TextFormField(
                //         controller: searchController,
                //         textAlign: TextAlign.start,
                //         style: TextStyle(
                //           color: isDark ? Colors.white : Colors.black,
                //         ),
                //         onChanged: searchPerson,
                //         decoration: InputDecoration(
                //           fillColor: isDark ? Colors.black : Colors.white,
                //           filled: true,
                //           hintText: 'Pay friends and merchants',
                //           hintStyle: TextStyle(
                //             color: isDark ? Colors.white : Colors.black,
                //           ),
                //           prefixIcon: Icon(
                //             Icons.search,
                //             color: isDark ? Colors.white : Colors.black,
                //           ),
                //           suffixIcon: searchController.text.isEmpty
                //               ? const SizedBox()
                //               : IconButton(
                //                   onPressed: () {
                //                     if (searchController.text.isEmpty) {
                //                       return;
                //                     } else {
                //                       setState(() {
                //                         searchPersonList.clear();
                //                         searchController.text = '';
                //                       });
                //                     }
                //                   },
                //                   icon: Icon(
                //                     Icons.clear,
                //                     color: isDark ? Colors.white : Colors.black,
                //                   ),
                //                 ),
                //           border: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(30),
                //             borderSide: BorderSide(
                //               width: 1,
                //               color: isDark ? Colors.black : Colors.grey,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //     trailing: GestureDetector(
                //       onTap: () {
                //         Navigator.of(context).push(
                //           MaterialPageRoute(
                //             builder: (context) => ProfileScreen(
                //               asset: assets,
                //             ),
                //           ),
                //         );
                //       },
                //       child: ClipOval(
                //         child: Image.asset(
                //           assets,
                //           fit: BoxFit.cover,
                //           height: 50,
                //           width: 50,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 10),
                          backgroundColor: isDark
                              ? const Color.fromARGB(255, 36, 36, 36)
                              : const Color.fromARGB(255, 235, 235, 235),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide.none,
                          ),
                          // fixedSize: Size(size.width * 0.3, 30),
                        ),
                        onPressed: () {},
                        label: Icon(
                          Icons.add_circle_outline,
                          color: isDark ? Colors.white : Colors.black,
                          size: 22,
                        ),
                        icon: Text(
                          'Activate UPI Lite',
                          style: TextStyle(
                            fontSize: 10,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 10),
                          backgroundColor: isDark
                              ? const Color.fromARGB(255, 59, 59, 59)
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: isDark ? Colors.white38 : Colors.grey,
                            ),
                          ),
                          // fixedSize: Size(size.width * 0.45, 30),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          Icons.copy,
                          color: isDark ? Colors.white : Colors.black,
                          size: 20,
                        ),
                        label: Text(
                          'UPI ID : $upiID ',
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14.0, vertical: 9),
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
                person.isEmpty
                    ? ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 16),
                        leading: Image.asset('assets/bg.png'),
                        title: Text(
                          'People you\'ve recently paid will show up here ',
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Expanded(
                        child: Center(
                          child: Wrap(
                            children: [
                              for (int i = 0; i < person.length; i++)
                                GestureDetector(
                                  onLongPress: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            alignment: Alignment.center,
                                            child: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  person.removeAt(i);
                                                  Navigator.of(context).pop();
                                                });
                                              },
                                              child: const Text(
                                                'remove',
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: PeopleWidget(
                                    name: person[i].name,
                                    getInitial: getInitials(person[i].name),
                                    color: person[i].bg,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
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
                          backgroundColor:
                              const Color.fromARGB(255, 170, 213, 249),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
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
                  height: size.height * 0.135,
                  width: size.width,
                  child: ListView.builder(
                    itemCount: businesses.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      final image = businesses[index].businessAsset;
                      final name = businesses[index].businessName;
                      return SingleBusinessWidget(
                        businessesModel: BusinessesModel(
                          businessName: name,
                          businessAsset: image,
                        ),
                        onTap: () {},
                        onLongPress: () {},
                      );
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Bill & Recharges",
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 3),
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
                      24,
                    ),
                    side: BorderSide(
                      width: 1,
                      color: Colors.blueAccent.shade200,
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
                                    image: 'assets/maha.png',
                                    text: 'Mahavitran'),
                                DropWidget(
                                    image: 'assets/mv.png', text: 'Movie view'),
                                DropWidget(
                                    image: 'assets/5paisa.png', text: '5Paisa'),
                                DropWidget(
                                    image: 'assets/jio.png', text: 'Jio'),
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
                                DropWidget(
                                    image: 'assets/jio.png', text: 'Jio'),
                                DropWidget(
                                    image: 'assets/redbus.png', text: 'Redbus')
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 5,
                        ),
                        child: Text(
                          'Promotions',
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6)
                            .copyWith(top: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 8),
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
                        onTap: () {},
                        leading: const Icon(
                          Icons.speed,
                          color: Colors.blue,
                        ),
                        title: Text(
                          'Check your CIBIL score for \nfree',
                          maxLines: 2,
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
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TransactionHistoryScreen(),
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
