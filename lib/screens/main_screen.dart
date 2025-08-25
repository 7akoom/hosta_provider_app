import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:hosta_provider/widgets/custom_bottom_navigation.dart';
import 'package:hosta_provider/screens/home_screen.dart';
import 'package:hosta_provider/screens/bookings_screen.dart';
import 'package:hosta_provider/screens/my_services_screen.dart';
import 'package:hosta_provider/screens/profile_screen.dart';
import 'package:hosta_provider/generated/app_localizations.dart';

class MainScreen extends StatefulWidget {
  final int? initialTabIndex;

  const MainScreen({super.key, this.initialTabIndex});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;

  final List<Widget> _screens = const [
    HomeScreen(),
    BookingsScreen(),
    MyServicesScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialTabIndex ?? 0;
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // إعادة تعيين وقت الضغط على زر الرجوع عند تغيير الشاشة
    if (index != 0) {
      _lastBackPressTime = null;
    }
  }

  DateTime? _lastBackPressTime;

  bool _handleBackPress() {
    if (_selectedIndex != 0) {
      // إذا لم نكن في الشاشة الرئيسية، نعود إليها
      setState(() {
        _selectedIndex = 0;
      });
      return false;
    }

    // في الشاشة الرئيسية، نتحقق من النقر المزدوج
    final now = DateTime.now();
    if (_lastBackPressTime == null ||
        now.difference(_lastBackPressTime!) > const Duration(seconds: 2)) {
      _lastBackPressTime = now;

      // Show snackbar using mounted check
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              AppLocalizations.of(context)?.press_back_again ??
                  'Press back again to exit',
            ),
            duration: const Duration(seconds: 2),
          ),
        );
      }

      return false;
    }

    // إعادة تعيين الوقت عند الخروج
    _lastBackPressTime = null;

    // الخروج من التطبيق بعد تأخير قصير
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          try {
            if (kDebugMode) {
              debugPrint('Attempting to exit app with SystemNavigator.pop()');
            }
            SystemNavigator.pop();
          } catch (e) {
            if (kDebugMode) {
              debugPrint('SystemNavigator.pop() failed: $e');
            }
            try {
              // خيار بديل للخروج
              if (kDebugMode) {
                debugPrint('Attempting to exit app with Navigator.pop()');
              }
              // Check if still mounted before using context
              if (mounted) {
                Navigator.of(context).pop();
              }
            } catch (e2) {
              if (kDebugMode) {
                debugPrint('Navigator.pop() failed: $e2');
              }
              // خيار نهائي للخروج
              if (kDebugMode) {
                debugPrint('Attempting to exit app with exit(0)');
              }
              exit(0);
            }
          }
        }
      });
    });

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return _handleBackPress();
      },
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: CustomBottomNavigation(
          currentIndex: _selectedIndex,
          onTap: _onBottomNavTap,
        ),
      ),
    );
  }
}
