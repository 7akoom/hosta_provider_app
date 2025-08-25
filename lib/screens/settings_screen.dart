import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hosta_provider/theme/app_colors.dart';
import 'package:hosta_provider/presentation/providers/app_settings_provider.dart';
import 'package:hosta_provider/generated/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppSettingsProvider>().isDarkMode;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.dark : Colors.white,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)?.settings ?? 'Settings',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<AppSettingsProvider>(
        builder: (context, appProvider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)?.settings ?? 'Settings',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.white : AppColors.dark,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.dark.withAlpha((255 * 0.1).toInt())
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDark
                          ? AppColors.white.withAlpha((255 * 0.2).toInt())
                          : AppColors.boxBorder,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)?.appearance ??
                            'Appearance',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isDark ? AppColors.white : AppColors.dark,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue.withAlpha(
                              (255 * 0.1).toInt(),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            isDark ? Icons.dark_mode : Icons.light_mode,
                            color: AppColors.primaryBlue,
                            size: 20,
                          ),
                        ),
                        title: Text(
                          AppLocalizations.of(context)?.theme ?? 'Theme',
                          style: TextStyle(
                            color: isDark ? AppColors.white : AppColors.dark,
                          ),
                        ),
                        subtitle: Text(
                          isDark
                              ? AppLocalizations.of(context)?.dark ?? 'Dark'
                              : AppLocalizations.of(context)?.light ?? 'Light',
                          style: TextStyle(
                            color: isDark
                                ? AppColors.white.withAlpha((255 * 0.7).toInt())
                                : AppColors.dark.withAlpha((255 * 0.7).toInt()),
                          ),
                        ),
                        trailing: Switch(
                          value: isDark,
                          onChanged: (value) {
                            appProvider.toggleTheme();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.dark.withAlpha((255 * 0.1).toInt())
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDark
                          ? AppColors.white.withAlpha((255 * 0.2).toInt())
                          : AppColors.boxBorder,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)?.language ?? 'Language',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isDark ? AppColors.white : AppColors.dark,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue.withAlpha(
                              (255 * 0.1).toInt(),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.language,
                            color: AppColors.primaryBlue,
                            size: 20,
                          ),
                        ),
                        title: Text(
                          AppLocalizations.of(context)?.app_language ??
                              'App Language',
                          style: TextStyle(
                            color: isDark ? AppColors.white : AppColors.dark,
                          ),
                        ),
                        subtitle: Text(
                          appProvider.selectedLanguage == 'en'
                              ? AppLocalizations.of(context)?.english ??
                                    'English'
                              : appProvider.selectedLanguage == 'ar'
                              ? AppLocalizations.of(context)?.arabic ??
                                    'العربية'
                              : AppLocalizations.of(context)?.kurdish ??
                                    'کوردی',
                          style: TextStyle(
                            color: isDark
                                ? AppColors.white.withAlpha((255 * 0.7).toInt())
                                : AppColors.dark.withAlpha((255 * 0.7).toInt()),
                          ),
                        ),
                        trailing: DropdownButton<String>(
                          value: appProvider.selectedLanguage,
                          items: [
                            DropdownMenuItem(
                              value: 'en',
                              child: Text(
                                AppLocalizations.of(context)?.english ??
                                    'English',
                                style: TextStyle(
                                  color: isDark
                                      ? AppColors.white
                                      : AppColors.dark,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'ar',
                              child: Text(
                                AppLocalizations.of(context)?.arabic ??
                                    'العربية',
                                style: TextStyle(
                                  color: isDark
                                      ? AppColors.white
                                      : AppColors.dark,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: 'ku',
                              child: Text(
                                AppLocalizations.of(context)?.kurdish ??
                                    'کوردی',
                                style: TextStyle(
                                  color: isDark
                                      ? AppColors.white
                                      : AppColors.dark,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (value) {
                            if (value != null) {
                              appProvider.setLanguage(value);
                            }
                          },
                          dropdownColor: isDark ? AppColors.dark : Colors.white,
                          underline: const SizedBox(),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: isDark ? AppColors.white : AppColors.dark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
