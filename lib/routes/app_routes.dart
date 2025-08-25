import 'package:flutter/material.dart';
import 'package:hosta_provider/screens/welcome_screen.dart';
import 'package:hosta_provider/screens/main_screen.dart';
import 'package:hosta_provider/screens/auth/forgot_password_screen.dart';
import 'package:hosta_provider/screens/auth/reset_password_screen.dart';
import 'package:hosta_provider/screens/auth/signin_screen.dart';
import 'package:hosta_provider/screens/auth/signup_screen.dart';
import 'package:hosta_provider/screens/auth/verification_code_screen.dart';

import 'package:hosta_provider/screens/profile_screen.dart';
import 'package:hosta_provider/screens/notifications_screen.dart';
import 'package:hosta_provider/screens/account_screen.dart';
import 'package:hosta_provider/screens/settings_screen.dart';
import 'package:hosta_provider/screens/support_screen.dart';
import 'package:hosta_provider/screens/booking_details_screen.dart';
import 'package:hosta_provider/screens/service_categories_screen.dart';
import 'package:hosta_provider/screens/category_services_screen.dart';
// unified details screen used for all bookings

class AppRoutes {
  static const welcome = '/';
  static const signin = '/signin';
  static const signup = '/signup';
  static const forgotPassword = '/forgot-password';
  static const verification = '/verification';
  static const resetPassword = '/reset-password';
  static const home = '/home';
  static const categoryDetails = '/category-details';
  static const serviceDetails = '/service-details';
  static const providerDetails = '/provider-details';
  static const search = '/search';
  static const profile = '/profile';
  static const chat = '/chat';
  static const myServices = '/my-services';
  static const bookService = '/book_service';
  static const notifications = '/notifications';
  static const account = '/account';
  static const settings = '/settings';
  static const support = '/support';
  static const schedule = '/schedule';
  static const cancelBooking = '/cancel-booking';
  static const favorites = '/favorites';
  static const bookingDetails = '/booking-details';
  static const serviceCategories = '/service-categories';
  static const categoryServices = '/category-services';
  static const bookings = '/bookings';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final name = routeSettings.name ?? '/';

    if (name == welcome) {
      return MaterialPageRoute(builder: (_) => const WelcomeScreen());
    }

    if (name == signin) {
      return MaterialPageRoute(builder: (_) => const SigninScreen());
    }

    if (name == signup) {
      return MaterialPageRoute(builder: (_) => const SignUpScreen());
    }

    if (name == forgotPassword) {
      return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
    }

    if (name == verification) {
      final args = routeSettings.arguments as Map<String, dynamic>? ?? {};
      return MaterialPageRoute(
        builder: (_) => VerificationCodeScreen(
          destination: args['destination'] ?? '',
          isPhone: args['isPhone'] ?? false,
        ),
      );
    }

    if (name == resetPassword) {
      return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
    }

    if (name == home) {
      return MaterialPageRoute(builder: (_) => const MainScreen());
    }

    if (name == profile) {
      return MaterialPageRoute(builder: (_) => const ProfileScreen());
    }

    if (name == notifications) {
      return MaterialPageRoute(builder: (_) => const NotificationsScreen());
    }

    if (name == account) {
      return MaterialPageRoute(builder: (_) => const AccountScreen());
    }

    if (name == settings) {
      return MaterialPageRoute(builder: (_) => const SettingsScreen());
    }

    if (name == support) {
      return MaterialPageRoute(builder: (_) => const SupportScreen());
    }

    if (name == bookingDetails) {
      return MaterialPageRoute(
        builder: (_) => const BookingDetailsScreen(),
        settings: routeSettings,
      );
    }

    if (name == serviceCategories) {
      return MaterialPageRoute(builder: (_) => const ServiceCategoriesScreen());
    }

    if (name == categoryServices) {
      return MaterialPageRoute(
        builder: (_) => const CategoryServicesScreen(),
        settings: routeSettings,
      );
    }

    if (name == bookings) {
      final args = routeSettings.arguments as Map<String, dynamic>? ?? {};
      final tabIndex = args['tabIndex'] as int? ?? 0;
      return MaterialPageRoute(
        builder: (_) => MainScreen(initialTabIndex: tabIndex),
      );
    }

    return MaterialPageRoute(
      builder: (_) =>
          const Scaffold(body: Center(child: Text('Page not found'))),
    );
  }
}
