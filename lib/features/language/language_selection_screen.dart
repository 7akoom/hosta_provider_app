import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? selectedLanguage;

  final List<Map<String, dynamic>> languages = [
    {
      'code': 'en',
      'name': 'EN',
      'fullName': 'English',
      'locale': const Locale('en'),
    },
    {
      'code': 'ar',
      'name': 'AR',
      'fullName': 'العربية',
      'locale': const Locale('ar'),
    },
    {
      'code': 'ku',
      'name': 'KU',
      'fullName': 'کوردی',
      'locale': const Locale('ku'),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : const Color(0xFF5494E8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Logo with LimitedBox and AspectRatio
              LimitedBox(
                maxWidth: 50,
                maxHeight: 50,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SvgPicture.asset(
                          'assets/images/logo.svg',
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          fit: BoxFit.contain,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              const Spacer(flex: 3),

              // Choose a Language text
              const Text(
                'Choose a language | اختر لغة | زمانێک هەڵبژێرە',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Language selection buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: languages.map<Widget>((language) {
                  final isSelected = selectedLanguage == language['code'];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedLanguage = language['code'];
                      });
                      _selectLanguage(language);
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        // خلفية بيضاء دائماً في كلا الوضعين
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF5494E8)
                              : Colors.white.withValues(alpha: 0.3),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          language['name'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            // في اللايت: أزرق، في الدارك: أسود
                            color: isDarkMode
                                ? Colors.black
                                : const Color(0xFF5494E8),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),

              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectLanguage(Map<String, dynamic> language) async {
    // Save language preference using SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language', language['code']);
    await prefs.setBool('language_selected', true);

    // Wait a bit for visual feedback
    await Future.delayed(const Duration(milliseconds: 500));

    // Navigate to signin screen using named route
    if (!mounted) return;
    Navigator.of(context).pushReplacementNamed('/signin');
  }
}
