import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../core/theme/app_colors.dart';
import 'landing_screen.dart';
import 'calculator_screen.dart';
import 'schemes_screen.dart';
import 'eligibility_screen.dart';
import 'feed_screen.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    LandingScreen(),
    FeedScreen(isBottomNav: true),
    CalculatorScreen(isBottomNav: true),
    SchemesScreen(isBottomNav: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.textSecondary.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SalomonBottomBar(
              currentIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index),
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.textSecondary,
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(Icons.home_rounded),
                  title: const Text('Home'),
                  selectedColor: AppColors.primary,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.groups_rounded),
                  title: const Text('Community'),
                  selectedColor: AppColors.primaryDark,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.calculate_rounded),
                  title: const Text('Calculate'),
                  selectedColor: const Color(0xFF673AB7),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.account_balance_rounded),
                  title: const Text('Schemes'),
                  selectedColor: AppColors.success,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
