import 'package:eft_project/components/app_bar.dart';
import 'package:eft_project/components/bottom_navigation_bar.dart';
import 'package:eft_project/enum.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);
  static String id = 'settings';
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(selected: MenuState.profile),
      body: Appbar(
        title: 'Settings',
      ),
    );
  }
}
