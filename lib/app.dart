import 'package:elxer_tasks/pages/dashboard/dashboardPage.dart';
import 'package:flutter/material.dart';

import 'core/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elxer Tasks',
      theme: theme.lightThemeData,
      home: const DashboardPage(),
    );
  }
}
