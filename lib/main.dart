import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpay_ui/controllers/dark_mode_controller.dart';
import 'package:gpay_ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DarkModeController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gpay-UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<DarkModeController>(context, listen: true).isDark;
    return Consumer(
      builder: (context, darkModeController, child) {
        return Scaffold(
          body: const HomeScreen(),
          floatingActionButton: FloatingActionButton(
            splashColor: Colors.purple,
            backgroundColor: isDark ? Colors.yellow : Colors.blue,
            child: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
              color: isDark ? Colors.black : Colors.white,
            ),
            onPressed: () {
              if (isDark) {
                context.read<DarkModeController>().changeToLight();
              } else {
                context.read<DarkModeController>().changeToDark();
              }
            },
          ),
        );
      },
    );
  }
}
