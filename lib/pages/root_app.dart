import 'package:USFP/helpers/db_conn.dart';
import 'package:USFP/theme/colors.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'auth.dart';
import 'budget_page.dart';
import 'create_budge_page.dart';
import 'daily_page.dart';

import 'profile_page.dart';
import 'stats_page.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

void initMessaging() {
  FirebaseMessaging.onMessage.listen(_messageHandler
      //   (RemoteMessage message)

      //  {

      //   // flutterLocalNotificationsPlugin.show(
      //   //   0,
      //   //   message.data['title'],
      //   //   message.data['body'],
      //   //   platformChannelSpecifics,
      //   // );
      // }

      );
  FirebaseMessaging.onBackgroundMessage(_messageHandler);
}

Future<void> _messageHandler(RemoteMessage message) async {
  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: int.parse(message.data['id']),
      channelKey: message.data['channelKey'],
      largeIcon: message.data['largeIcon'] ?? "resource://drawable/res_ic_app",
      title: message.notification.title,
      body: message.notification.body,
      notificationLayout: NotificationLayout.Default,
      ticker: "USFP",
    ),
  );
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  List<Widget> pages = [
    // OnBoarding(),
    StatsPage(),
    DailyPage(),
    BudgetPage(),
    LogIn(),
    // ProfilePage(),
    CreatBudgetPage()
  ];

  @override
  void initState() {
    var xp = DBProvider.db.database;
    super.initState();

    final FirebaseMessaging _fcm = FirebaseMessaging.instance;

    //initMessaging();
    // messaging = FirebaseMessaging.instance;

    _fcm.getToken().then((value) {
      print(value);
    });

    AwesomeNotifications().initialize(
        'resource://drawable/res_ic_stat_icon',
        [
          NotificationChannel(
              channelKey: 'basic_channel',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              defaultColor: Colors.black,
              playSound: true,
              ledColor: Colors.yellow),
          NotificationChannel(
              channelKey: 'big_picture',
              channelName: 'Big pictures',
              channelDescription: 'Notifications with big and beautiful images',
              defaultColor: Colors.orange,
              ledColor: Colors.yellow,
              enableVibration: true),
          NotificationChannel(
            channelKey: 'big_text',
            channelName: 'Big text notifications',
            channelDescription: 'Notifications with a expandable body text',
            defaultColor: Colors.blueGrey,
            ledColor: Colors.blueGrey,
          ),
        ],
        debug: false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody(),
        bottomNavigationBar: getFooter(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => OnBoarding()));
            selectedTab(4);
          },
          child: Icon(
            Icons.add,
            size: 25,
            color: Colors.white,
          ),
          backgroundColor: primary,
          //params
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.md_calendar,
      Ionicons.md_stats,
      Icons.article,
      Ionicons.ios_person,
    ];

    return AnimatedBottomNavigationBar(
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
