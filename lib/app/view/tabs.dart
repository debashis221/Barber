/*
  Authors : initappz (Rahul Jograna)
  Website : https://initappz.com/
  App Name : Ultimate Salon Full App Flutter V3
  This App Template Source code is licensed as per the
  terms found in the Website https://initappz.com/license
  Copyright and Good Faith Purchasers © 2024-present initappz.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owner/app/controller/tabs_controller.dart';
import 'package:owner/app/util/theme.dart';
import 'package:owner/app/view/analytics.dart';
import 'package:owner/app/view/appointment.dart';
import 'package:owner/app/view/calendar.dart';
import 'package:owner/app/view/history.dart';
import 'package:owner/app/view/profile.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    // List<Widget> pages = const [AppointmentScreen(), HistoryScreen(), AnalyticScreen(), CalendarScreen(), ProfileScreen()];
    return GetBuilder<TabsController>(
      builder: (value) {
        return DefaultTabController(
          length: 5,
          child: Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: (TabBar(
              controller: value.tabController,
              labelColor: ThemeProvider.appColor,
              unselectedLabelColor: const Color.fromARGB(255, 185, 196, 207),
              indicatorColor: Colors.transparent,
              labelPadding: const EdgeInsets.symmetric(horizontal: 0),
              labelStyle: const TextStyle(fontFamily: 'regular', fontSize: 12),
              onTap: (int index) => value.updateTabId(index),
              tabs: [
                Tab(
                  icon: Icon(value.tabId != 0 ? Icons.content_paste_outlined : Icons.content_paste, color: value.tabId == 0 ? ThemeProvider.appColor : const Color.fromARGB(255, 185, 196, 207)),
                  text: 'Appoinment'.tr,
                ),
                Tab(
                  icon: Icon(value.tabId != 1 ? Icons.history_outlined : Icons.history, color: value.tabId == 1 ? ThemeProvider.appColor : const Color.fromARGB(255, 185, 196, 207)),
                  text: 'Orders'.tr,
                ),
                Tab(
                  icon: Icon(value.tabId != 2 ? Icons.currency_exchange_outlined : Icons.currency_exchange, color: value.tabId == 2 ? ThemeProvider.appColor : const Color.fromARGB(255, 185, 196, 207)),
                  text: 'Earnings'.tr,
                ),
                Tab(
                  icon: Icon(value.tabId != 3 ? Icons.calendar_today_outlined : Icons.calendar_today, color: value.tabId == 3 ? ThemeProvider.appColor : const Color.fromARGB(255, 185, 196, 207)),
                  text: 'Calendar'.tr,
                ),
                Tab(
                  icon: Icon(value.tabId != 4 ? Icons.person_outlined : Icons.person, color: value.tabId == 4 ? ThemeProvider.appColor : const Color.fromARGB(255, 185, 196, 207)),
                  text: 'Profile'.tr,
                ),
              ],
            )),
            body: TabBarView(
              controller: value.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [AppointmentScreen(), HistoryScreen(), AnalyticScreen(), CalendarScreen(), ProfileScreen()],
            ),
          ),
        );
        // return DefaultTabController(
        //   length: 5,
        //   child: Scaffold(
        //     backgroundColor: Colors.white,
        //     bottomNavigationBar: Container(
        //       color: Colors.white,
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        //         child: InkWell(
        //           child: (GNav(
        //             rippleColor: ThemeProvider.appColor,
        //             hoverColor: ThemeProvider.appColor,
        //             haptic: false,
        //             curve: Curves.easeOutExpo,
        //             tabBorderRadius: 15,
        //             textStyle: const TextStyle(fontFamily: 'bold', color: Colors.white),
        //             duration: const Duration(milliseconds: 300),
        //             gap: 5,
        //             color: Colors.grey.shade400,
        //             activeColor: Colors.white,
        //             iconSize: 24,
        //             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //             tabs: [
        //               GButton(icon: Icons.content_paste_outlined, text: 'Appoinment'.tr, backgroundColor: ThemeProvider.appColor),
        //               GButton(icon: Icons.history_outlined, text: 'Orders'.tr, backgroundColor: ThemeProvider.appColor),
        //               GButton(icon: Icons.currency_exchange_outlined, text: 'Earnings'.tr, backgroundColor: ThemeProvider.appColor),
        //               GButton(icon: Icons.calendar_today_outlined, text: 'Calendar'.tr, backgroundColor: ThemeProvider.appColor),
        //               GButton(icon: Icons.person_outlined, text: 'Profile'.tr, backgroundColor: ThemeProvider.appColor),
        //             ],
        //             selectedIndex: value.tabId,
        //             onTabChange: (index) => value.updateTabId(index),
        //           )),
        //         ),
        //       ),
        //     ),
        //     body: TabBarView(physics: const NeverScrollableScrollPhysics(), controller: value.tabController, children: pages),
        //   ),
        // );
      },
    );
  }
}
