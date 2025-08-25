import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ku.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('ku'),
  ];

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'Hosta Services'**
  String get app_name;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @select_language.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get select_language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @kurdish.
  ///
  /// In en, this message translates to:
  /// **'Kurdish'**
  String get kurdish;

  /// No description provided for @guest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guest;

  /// No description provided for @sign_in.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get sign_in;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_up;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgot_password;

  /// No description provided for @reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get reset_password;

  /// No description provided for @verification_code.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verification_code;

  /// No description provided for @send_code.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get send_code;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @dont_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dont_have_account;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_account;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @sign_out.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get sign_out;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @try_again.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get try_again;

  /// No description provided for @error_occurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get error_occurred;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @no_data.
  ///
  /// In en, this message translates to:
  /// **'No Data Available'**
  String get no_data;

  /// No description provided for @press_back_again.
  ///
  /// In en, this message translates to:
  /// **'Press back again to exit'**
  String get press_back_again;

  /// No description provided for @my_services.
  ///
  /// In en, this message translates to:
  /// **'My Services'**
  String get my_services;

  /// No description provided for @signup_intro_text.
  ///
  /// In en, this message translates to:
  /// **'Sign up with your email or phone number'**
  String get signup_intro_text;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get mobile_number;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @date_of_birth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get date_of_birth;

  /// No description provided for @required_field.
  ///
  /// In en, this message translates to:
  /// **'Required field'**
  String get required_field;

  /// No description provided for @enter_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter password'**
  String get enter_password;

  /// No description provided for @enter_password_please.
  ///
  /// In en, this message translates to:
  /// **'Enter password please'**
  String get enter_password_please;

  /// No description provided for @passwords_dont_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwords_dont_match;

  /// No description provided for @password_min_length.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get password_min_length;

  /// No description provided for @agreement_text.
  ///
  /// In en, this message translates to:
  /// **'By signing up, you agree to the '**
  String get agreement_text;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get and;

  /// No description provided for @terms_of_service.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get terms_of_service;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @location_permission.
  ///
  /// In en, this message translates to:
  /// **'Location Permission'**
  String get location_permission;

  /// No description provided for @location_permission_message.
  ///
  /// In en, this message translates to:
  /// **'Please allow location access to continue registration.'**
  String get location_permission_message;

  /// No description provided for @deny.
  ///
  /// In en, this message translates to:
  /// **'Deny'**
  String get deny;

  /// No description provided for @allow.
  ///
  /// In en, this message translates to:
  /// **'Allow'**
  String get allow;

  /// No description provided for @location_error.
  ///
  /// In en, this message translates to:
  /// **'Unable to get current location.'**
  String get location_error;

  /// No description provided for @location_permission_denied.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied!'**
  String get location_permission_denied;

  /// No description provided for @select_city.
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get select_city;

  /// No description provided for @iraq.
  ///
  /// In en, this message translates to:
  /// **'Iraq'**
  String get iraq;

  /// No description provided for @choose_email_or_phone_to_reset_password.
  ///
  /// In en, this message translates to:
  /// **'Choose email or phone number to reset your password'**
  String get choose_email_or_phone_to_reset_password;

  /// No description provided for @enter_your_email.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enter_your_email;

  /// No description provided for @enter_your_phone.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get enter_your_phone;

  /// No description provided for @back_to_signin.
  ///
  /// In en, this message translates to:
  /// **'Back to signin'**
  String get back_to_signin;

  /// No description provided for @verification_code_sent_phone.
  ///
  /// In en, this message translates to:
  /// **'We have sent you a 5 digit verification code on'**
  String get verification_code_sent_phone;

  /// No description provided for @verification_code_sent_email.
  ///
  /// In en, this message translates to:
  /// **'We have sent you a 5 digit verification code to'**
  String get verification_code_sent_email;

  /// No description provided for @enter_verification_code.
  ///
  /// In en, this message translates to:
  /// **'Enter verification code'**
  String get enter_verification_code;

  /// No description provided for @password_changed_successfully.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully!'**
  String get password_changed_successfully;

  /// No description provided for @enter_new_password.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get enter_new_password;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get new_password;

  /// No description provided for @password_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Password confirmation'**
  String get password_confirmation;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @my_account.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get my_account;

  /// No description provided for @manage_account_information.
  ///
  /// In en, this message translates to:
  /// **'Manage your account information'**
  String get manage_account_information;

  /// No description provided for @language_and_theme_preferences.
  ///
  /// In en, this message translates to:
  /// **'Language and theme preferences'**
  String get language_and_theme_preferences;

  /// No description provided for @help_and_support.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get help_and_support;

  /// No description provided for @contact_us_for_assistance.
  ///
  /// In en, this message translates to:
  /// **'Contact us for assistance'**
  String get contact_us_for_assistance;

  /// No description provided for @are_you_sure_sign_out.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out?'**
  String get are_you_sure_sign_out;

  /// No description provided for @sign_out_of_your_account.
  ///
  /// In en, this message translates to:
  /// **'Sign out of your account'**
  String get sign_out_of_your_account;

  /// No description provided for @account_information.
  ///
  /// In en, this message translates to:
  /// **'Account Information'**
  String get account_information;

  /// No description provided for @please_sign_in_to_view_account.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to view your account'**
  String get please_sign_in_to_view_account;

  /// No description provided for @update_email.
  ///
  /// In en, this message translates to:
  /// **'Update Email'**
  String get update_email;

  /// No description provided for @new_email.
  ///
  /// In en, this message translates to:
  /// **'New Email'**
  String get new_email;

  /// No description provided for @enter_your_new_email.
  ///
  /// In en, this message translates to:
  /// **'Enter your new email'**
  String get enter_your_new_email;

  /// No description provided for @update_phone.
  ///
  /// In en, this message translates to:
  /// **'Update Phone'**
  String get update_phone;

  /// No description provided for @new_phone.
  ///
  /// In en, this message translates to:
  /// **'New Phone'**
  String get new_phone;

  /// No description provided for @enter_your_new_phone.
  ///
  /// In en, this message translates to:
  /// **'Enter your new phone number'**
  String get enter_your_new_phone;

  /// No description provided for @update_password.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get update_password;

  /// No description provided for @current_password.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get current_password;

  /// No description provided for @enter_your_current_password.
  ///
  /// In en, this message translates to:
  /// **'Enter your current password'**
  String get enter_your_current_password;

  /// No description provided for @enter_a_new_password.
  ///
  /// In en, this message translates to:
  /// **'Enter a new password'**
  String get enter_a_new_password;

  /// No description provided for @confirm_your_new_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm your new password'**
  String get confirm_your_new_password;

  /// No description provided for @please_enter_your_current_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter your current password'**
  String get please_enter_your_current_password;

  /// No description provided for @please_enter_a_new_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter a new password'**
  String get please_enter_a_new_password;

  /// No description provided for @please_confirm_your_new_password.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your new password'**
  String get please_confirm_your_new_password;

  /// No description provided for @information_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Information updated successfully'**
  String get information_updated_successfully;

  /// No description provided for @delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get delete_account;

  /// No description provided for @once_you_delete_account.
  ///
  /// In en, this message translates to:
  /// **'Once you delete your account, there is no going back. Please be certain.'**
  String get once_you_delete_account;

  /// No description provided for @are_you_sure_delete_account.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account? This action cannot be undone.'**
  String get are_you_sure_delete_account;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @app_language.
  ///
  /// In en, this message translates to:
  /// **'App Language'**
  String get app_language;

  /// No description provided for @help_support.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get help_support;

  /// No description provided for @how_can_we_help_you.
  ///
  /// In en, this message translates to:
  /// **'How can we help you?'**
  String get how_can_we_help_you;

  /// No description provided for @subject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// No description provided for @what_is_your_issue_about.
  ///
  /// In en, this message translates to:
  /// **'What is your issue about?'**
  String get what_is_your_issue_about;

  /// No description provided for @please_enter_a_subject.
  ///
  /// In en, this message translates to:
  /// **'Please enter a subject'**
  String get please_enter_a_subject;

  /// No description provided for @describe_your_issue_in_detail.
  ///
  /// In en, this message translates to:
  /// **'Describe your issue in detail'**
  String get describe_your_issue_in_detail;

  /// No description provided for @please_enter_your_message.
  ///
  /// In en, this message translates to:
  /// **'Please enter your message'**
  String get please_enter_your_message;

  /// No description provided for @message_must_be_at_least_10_characters.
  ///
  /// In en, this message translates to:
  /// **'Message must be at least 10 characters long'**
  String get message_must_be_at_least_10_characters;

  /// No description provided for @contact_information.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contact_information;

  /// No description provided for @support_email.
  ///
  /// In en, this message translates to:
  /// **'support@hosta.com'**
  String get support_email;

  /// No description provided for @support_phone.
  ///
  /// In en, this message translates to:
  /// **'+1 234 567 890'**
  String get support_phone;

  /// No description provided for @message_sent.
  ///
  /// In en, this message translates to:
  /// **'Message Sent'**
  String get message_sent;

  /// No description provided for @thank_you_contacting_us.
  ///
  /// In en, this message translates to:
  /// **'Thank you for contacting us. We will get back to you soon.'**
  String get thank_you_contacting_us;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @send_message.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get send_message;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @no_notifications_yet.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet'**
  String get no_notifications_yet;

  /// No description provided for @mark_all_as_read.
  ///
  /// In en, this message translates to:
  /// **'Mark all as read'**
  String get mark_all_as_read;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @in_progress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get in_progress;

  /// No description provided for @confirmed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get confirmed;

  /// No description provided for @accepted.
  ///
  /// In en, this message translates to:
  /// **'Accepted'**
  String get accepted;

  /// No description provided for @booking_details.
  ///
  /// In en, this message translates to:
  /// **'Booking Details'**
  String get booking_details;

  /// No description provided for @client_information.
  ///
  /// In en, this message translates to:
  /// **'Client Information'**
  String get client_information;

  /// No description provided for @service.
  ///
  /// In en, this message translates to:
  /// **'Service'**
  String get service;

  /// No description provided for @date_time.
  ///
  /// In en, this message translates to:
  /// **'Date & Time'**
  String get date_time;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @suggest_alternative_date.
  ///
  /// In en, this message translates to:
  /// **'Suggest Alternative Date'**
  String get suggest_alternative_date;

  /// No description provided for @select_alternative_date.
  ///
  /// In en, this message translates to:
  /// **'Select Alternative Date'**
  String get select_alternative_date;

  /// No description provided for @available_times.
  ///
  /// In en, this message translates to:
  /// **'Available Times'**
  String get available_times;

  /// No description provided for @send_alternative_date.
  ///
  /// In en, this message translates to:
  /// **'Send Alternative Date'**
  String get send_alternative_date;

  /// No description provided for @client_address.
  ///
  /// In en, this message translates to:
  /// **'Client Address'**
  String get client_address;

  /// No description provided for @show_on_map.
  ///
  /// In en, this message translates to:
  /// **'Show on Map'**
  String get show_on_map;

  /// No description provided for @additional_notes.
  ///
  /// In en, this message translates to:
  /// **'Additional Notes'**
  String get additional_notes;

  /// No description provided for @cancellation_reason.
  ///
  /// In en, this message translates to:
  /// **'Cancellation Reason'**
  String get cancellation_reason;

  /// No description provided for @no_cancellation_reason.
  ///
  /// In en, this message translates to:
  /// **'No cancellation reason provided'**
  String get no_cancellation_reason;

  /// No description provided for @attached_images.
  ///
  /// In en, this message translates to:
  /// **'Attached Images'**
  String get attached_images;

  /// No description provided for @start_service.
  ///
  /// In en, this message translates to:
  /// **'Start Service'**
  String get start_service;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @my_rating.
  ///
  /// In en, this message translates to:
  /// **'My Rating'**
  String get my_rating;

  /// No description provided for @daily_bookings.
  ///
  /// In en, this message translates to:
  /// **'Daily Bookings'**
  String get daily_bookings;

  /// No description provided for @daily_total.
  ///
  /// In en, this message translates to:
  /// **'Daily Total'**
  String get daily_total;

  /// No description provided for @monthly_bookings.
  ///
  /// In en, this message translates to:
  /// **'Monthly Bookings'**
  String get monthly_bookings;

  /// No description provided for @monthly_total.
  ///
  /// In en, this message translates to:
  /// **'Monthly Total'**
  String get monthly_total;

  /// No description provided for @current_booking.
  ///
  /// In en, this message translates to:
  /// **'Current Booking'**
  String get current_booking;

  /// No description provided for @pending_bookings.
  ///
  /// In en, this message translates to:
  /// **'Pending Bookings'**
  String get pending_bookings;

  /// No description provided for @annual_statistics.
  ///
  /// In en, this message translates to:
  /// **'Annual Statistics'**
  String get annual_statistics;

  /// No description provided for @bookings.
  ///
  /// In en, this message translates to:
  /// **'Bookings'**
  String get bookings;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @booking.
  ///
  /// In en, this message translates to:
  /// **'Booking'**
  String get booking;

  /// No description provided for @finish_service.
  ///
  /// In en, this message translates to:
  /// **'Finish Service'**
  String get finish_service;

  /// No description provided for @end_service_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to end this service?'**
  String get end_service_confirmation;

  /// No description provided for @no_bookings_found.
  ///
  /// In en, this message translates to:
  /// **'No bookings found'**
  String get no_bookings_found;

  /// No description provided for @booking_rejected.
  ///
  /// In en, this message translates to:
  /// **'Booking rejected'**
  String get booking_rejected;

  /// No description provided for @booking_accepted_successfully.
  ///
  /// In en, this message translates to:
  /// **'Booking accepted successfully'**
  String get booking_accepted_successfully;

  /// No description provided for @service_started_successfully.
  ///
  /// In en, this message translates to:
  /// **'Service started successfully'**
  String get service_started_successfully;

  /// No description provided for @service_completed_successfully.
  ///
  /// In en, this message translates to:
  /// **'Service completed successfully'**
  String get service_completed_successfully;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactive;

  /// No description provided for @toggle_status.
  ///
  /// In en, this message translates to:
  /// **'Toggle Status'**
  String get toggle_status;

  /// No description provided for @add_new_service.
  ///
  /// In en, this message translates to:
  /// **'Add new service functionality coming soon!'**
  String get add_new_service;

  /// No description provided for @accept_booking.
  ///
  /// In en, this message translates to:
  /// **'Accept Booking'**
  String get accept_booking;

  /// No description provided for @reject_booking.
  ///
  /// In en, this message translates to:
  /// **'Reject Booking'**
  String get reject_booking;

  /// No description provided for @accept_booking_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to accept this booking?'**
  String get accept_booking_confirmation;

  /// No description provided for @reject_booking_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to reject this booking?'**
  String get reject_booking_confirmation;

  /// No description provided for @start_service_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you ready to start providing the service?'**
  String get start_service_confirmation;

  /// No description provided for @service_categories.
  ///
  /// In en, this message translates to:
  /// **'Service Categories'**
  String get service_categories;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get services;

  /// No description provided for @cleaning.
  ///
  /// In en, this message translates to:
  /// **'Cleaning'**
  String get cleaning;

  /// No description provided for @plumbing.
  ///
  /// In en, this message translates to:
  /// **'Plumbing'**
  String get plumbing;

  /// No description provided for @electrical.
  ///
  /// In en, this message translates to:
  /// **'Electrical'**
  String get electrical;

  /// No description provided for @car_washing.
  ///
  /// In en, this message translates to:
  /// **'Car Washing'**
  String get car_washing;

  /// No description provided for @home_repair.
  ///
  /// In en, this message translates to:
  /// **'Home Repair'**
  String get home_repair;

  /// No description provided for @painting.
  ///
  /// In en, this message translates to:
  /// **'Painting'**
  String get painting;

  /// No description provided for @childcare.
  ///
  /// In en, this message translates to:
  /// **'Childcare'**
  String get childcare;

  /// No description provided for @gardening.
  ///
  /// In en, this message translates to:
  /// **'Gardening'**
  String get gardening;

  /// No description provided for @add_service.
  ///
  /// In en, this message translates to:
  /// **'Add Service'**
  String get add_service;

  /// No description provided for @please_enter_valid_price.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid price'**
  String get please_enter_valid_price;

  /// No description provided for @service_added_successfully.
  ///
  /// In en, this message translates to:
  /// **'service added successfully'**
  String get service_added_successfully;

  /// No description provided for @edit_service.
  ///
  /// In en, this message translates to:
  /// **'Edit Service'**
  String get edit_service;

  /// No description provided for @service_updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'service updated successfully'**
  String get service_updated_successfully;

  /// No description provided for @delete_service.
  ///
  /// In en, this message translates to:
  /// **'Delete Service'**
  String get delete_service;

  /// No description provided for @delete_service_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete'**
  String get delete_service_confirmation;

  /// No description provided for @service_deleted_successfully.
  ///
  /// In en, this message translates to:
  /// **'service deleted successfully'**
  String get service_deleted_successfully;

  /// No description provided for @status_updated.
  ///
  /// In en, this message translates to:
  /// **'status updated'**
  String get status_updated;

  /// No description provided for @languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languages;

  /// No description provided for @working_hours.
  ///
  /// In en, this message translates to:
  /// **'Working Hours'**
  String get working_hours;

  /// No description provided for @languages_spoken.
  ///
  /// In en, this message translates to:
  /// **'Languages I Speak'**
  String get languages_spoken;

  /// No description provided for @working_schedule.
  ///
  /// In en, this message translates to:
  /// **'Working Schedule'**
  String get working_schedule;

  /// No description provided for @update_languages.
  ///
  /// In en, this message translates to:
  /// **'Update Languages'**
  String get update_languages;

  /// No description provided for @update_working_hours.
  ///
  /// In en, this message translates to:
  /// **'Update Working Hours'**
  String get update_working_hours;

  /// No description provided for @select_languages.
  ///
  /// In en, this message translates to:
  /// **'Select Languages'**
  String get select_languages;

  /// No description provided for @select_working_hours.
  ///
  /// In en, this message translates to:
  /// **'Select Working Hours'**
  String get select_working_hours;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @working_day.
  ///
  /// In en, this message translates to:
  /// **'Working Day'**
  String get working_day;

  /// No description provided for @day_off.
  ///
  /// In en, this message translates to:
  /// **'Day Off'**
  String get day_off;

  /// No description provided for @start_time.
  ///
  /// In en, this message translates to:
  /// **'Start Time'**
  String get start_time;

  /// No description provided for @end_time.
  ///
  /// In en, this message translates to:
  /// **'End Time'**
  String get end_time;

  /// No description provided for @set_working_hours.
  ///
  /// In en, this message translates to:
  /// **'Set Working Hours'**
  String get set_working_hours;

  /// No description provided for @set_languages.
  ///
  /// In en, this message translates to:
  /// **'Set Languages'**
  String get set_languages;

  /// No description provided for @available_languages.
  ///
  /// In en, this message translates to:
  /// **'Available Languages'**
  String get available_languages;

  /// No description provided for @arabic_language.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic_language;

  /// No description provided for @english_language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english_language;

  /// No description provided for @kurdish_language.
  ///
  /// In en, this message translates to:
  /// **'Kurdish'**
  String get kurdish_language;

  /// No description provided for @no_languages_selected.
  ///
  /// In en, this message translates to:
  /// **'No languages selected'**
  String get no_languages_selected;

  /// No description provided for @no_working_hours_set.
  ///
  /// In en, this message translates to:
  /// **'No working hours set'**
  String get no_working_hours_set;

  /// No description provided for @working_hours_updated.
  ///
  /// In en, this message translates to:
  /// **'Working hours updated'**
  String get working_hours_updated;

  /// No description provided for @languages_updated.
  ///
  /// In en, this message translates to:
  /// **'Languages updated'**
  String get languages_updated;

  /// No description provided for @signed_out_successfully.
  ///
  /// In en, this message translates to:
  /// **'Signed out successfully'**
  String get signed_out_successfully;

  /// No description provided for @confirm_payment.
  ///
  /// In en, this message translates to:
  /// **'Confirm Payment'**
  String get confirm_payment;

  /// No description provided for @service_price.
  ///
  /// In en, this message translates to:
  /// **'Service Price'**
  String get service_price;

  /// No description provided for @additional_cost.
  ///
  /// In en, this message translates to:
  /// **'Additional Cost'**
  String get additional_cost;

  /// No description provided for @total_amount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get total_amount;

  /// No description provided for @enter_additional_cost.
  ///
  /// In en, this message translates to:
  /// **'Enter additional cost (optional)'**
  String get enter_additional_cost;

  /// No description provided for @confirm_payment_amount.
  ///
  /// In en, this message translates to:
  /// **'Please confirm the payment amount for this service'**
  String get confirm_payment_amount;

  /// No description provided for @payment_confirmed.
  ///
  /// In en, this message translates to:
  /// **'Payment confirmed successfully'**
  String get payment_confirmed;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'ku'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'ku':
      return AppLocalizationsKu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
