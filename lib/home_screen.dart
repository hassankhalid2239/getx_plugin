import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_plugin/Controllers/theme_controller.dart';

import 'counter_screen.dart';
import 'favorite_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final _themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.redAccent,
        title: const Text(
          'Getx Plugin',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          PopupMenuButton(
            padding: EdgeInsets.zero,
            tooltip: 'Light Theme',
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            position: PopupMenuPosition.under,
            color: Colors.white,
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: ThemeMode.light,
                child: Text(
                  'Light Theme',
                  style: TextStyle(
                    color: _themeController.theme.value == ThemeMode.light
                        ? Colors.redAccent
                        : Colors.black,
                  ),
                ),
              ),
              PopupMenuItem(
                value: ThemeMode.dark,
                child: Text(
                  'Dark Theme',
                  style: TextStyle(
                    color: _themeController.theme.value == ThemeMode.dark
                        ? Colors.redAccent
                        : Colors.black,
                  ),
                ),
              ),
              PopupMenuItem(
                value: ThemeMode.system,
                child: Text(
                  'System',
                  style: TextStyle(
                    color: _themeController.theme.value == ThemeMode.system
                        ? Colors.redAccent
                        : Colors.black,
                  ),
                ),
              ),
            ],
            onSelected: (value) {
              _themeController.changeTheme(value);
              // Get.changeTheme();
            },
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const WidgetStatePropertyAll(Colors.redAccent),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CounterScreen()));
                  },
                  child: const Text(
                    'Counter App',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const WidgetStatePropertyAll(Colors.redAccent),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavoriteScreen()));
                  },
                  child: const Text(
                    'List App',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
