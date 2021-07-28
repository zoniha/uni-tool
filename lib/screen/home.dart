import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:uni_tool/layout/color.dart';
import 'package:uni_tool/provider/bottom_navbar_provider.dart';
import 'package:uni_tool/screen/calculator.dart';
import 'package:uni_tool/screen/system.dart';

class HomeScreen extends ConsumerWidget {
  final screens = [
    calculatorScreen(),
    SystemScreen(),
  ];

  Widget build(BuildContext context, ScopedReader watch) {
    final pageTransition = watch(pageTransitionProvider);

    return Scaffold(
      body: screens[pageTransition.currentIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        backgroundColor: fog,
        activeColor: deepBlue,
        color: lightPurple,
        initialActiveIndex: pageTransition.currentIndex,
        elevation: 1,
        items: [
          TabItem(
            icon: Icons.calculate_rounded,
            title: '計算',
          ),
          TabItem(
            icon: Icons.settings_rounded,
            title: 'システム',
          ),
        ],
        onTap: (index) {
          pageTransition.transition(index);
        },
      ),
    );
  }
}
