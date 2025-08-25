import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hosta_provider/theme/app_colors.dart';
import 'package:hosta_provider/presentation/providers/auth_provider.dart';
import 'package:hosta_provider/generated/app_localizations.dart';
import 'package:hosta_provider/data/models/working_hours_model.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  bool _showOldPassword = false;
  bool _showNewPassword = false;
  bool _showConfirmPassword = false;

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _updateUserInfo({
    String? email,
    String? phone,
    String? oldPassword,
    String? newPassword,
    List<String>? languages,
    List<WorkingHoursModel>? workingHours,
  }) async {
    if (!mounted) return;

    setState(() => _isLoading = true);

    try {
      final authProvider = context.read<AuthProvider>();

      await authProvider.updateUserInfo(
        email: email,
        phone: phone,
        oldPassword: oldPassword,
        newPassword: newPassword,
        languages: languages,
        workingHours: workingHours,
      );

      if (!mounted) return;

      String message;
      if (languages != null) {
        message =
            AppLocalizations.of(context)?.languages_updated ??
            'Languages updated';
      } else if (workingHours != null) {
        message =
            AppLocalizations.of(context)?.working_hours_updated ??
            'Working hours updated';
      } else {
        message =
            AppLocalizations.of(context)?.information_updated_successfully ??
            'Information updated successfully';
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _showUpdateEmailDialog(String currentEmail) async {
    _emailController.text = currentEmail;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)?.update_email ?? 'Update Email',
        ),
        content: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)?.new_email ?? 'New Email',
            hintText:
                AppLocalizations.of(context)?.enter_your_new_email ??
                'Enter your new email',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)?.cancel ?? 'Cancel'),
          ),
          ElevatedButton(
            onPressed: _isLoading
                ? null
                : () => _updateUserInfo(email: _emailController.text.trim()),
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(AppLocalizations.of(context)?.update ?? 'Update'),
          ),
        ],
      ),
    );
  }

  Future<void> _showUpdatePhoneDialog(String? currentPhone) async {
    _phoneController.text = currentPhone ?? '';

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)?.update_phone ?? 'Update Phone',
        ),
        content: TextFormField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)?.new_phone ?? 'New Phone',
            hintText:
                AppLocalizations.of(context)?.enter_your_new_phone ??
                'Enter your new phone number',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)?.cancel ?? 'Cancel'),
          ),
          ElevatedButton(
            onPressed: _isLoading
                ? null
                : () => _updateUserInfo(phone: _phoneController.text.trim()),
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(AppLocalizations.of(context)?.update ?? 'Update'),
          ),
        ],
      ),
    );
  }

  Future<void> _showUpdateLanguagesDialog(List<String> currentLanguages) async {
    final availableLanguages = [
      AppLocalizations.of(context)?.arabic_language ?? 'Arabic',
      AppLocalizations.of(context)?.english_language ?? 'English',
      AppLocalizations.of(context)?.kurdish_language ?? 'Kurdish',
    ];

    List<String> selectedLanguages = List.from(currentLanguages);

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(
            AppLocalizations.of(context)?.update_languages ??
                'Update Languages',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: availableLanguages.map<Widget>((language) {
              return CheckboxListTile(
                title: Text(language),
                value: selectedLanguages.contains(language),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      selectedLanguages.add(language);
                    } else {
                      selectedLanguages.remove(language);
                    }
                  });
                },
              );
            }).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(AppLocalizations.of(context)?.cancel ?? 'Cancel'),
            ),
            ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () => _updateUserInfo(languages: selectedLanguages),
              child: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(AppLocalizations.of(context)?.update ?? 'Update'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showUpdateWorkingHoursDialog(
    List<WorkingHoursModel> currentWorkingHours,
  ) async {
    List<WorkingHoursModel> workingHours = List.from(currentWorkingHours);

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(
            AppLocalizations.of(context)?.update_working_hours ??
                'Update Working Hours',
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: workingHours.map<Widget>((day) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  day.dayName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Switch(
                                value: day.isWorkingDay,
                                onChanged: (value) {
                                  setState(() {
                                    final index = workingHours.indexOf(day);
                                    workingHours[index] = day.copyWith(
                                      isWorkingDay: value,
                                    );
                                  });
                                },
                              ),
                            ],
                          ),
                          if (day.isWorkingDay) ...[
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    initialValue: day.startTime,
                                    decoration: InputDecoration(
                                      labelText:
                                          AppLocalizations.of(
                                            context,
                                          )?.start_time ??
                                          'Start Time',
                                      hintText: '08:00',
                                    ),
                                    onChanged: (value) {
                                      final index = workingHours.indexOf(day);
                                      workingHours[index] = day.copyWith(
                                        startTime: value,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: TextFormField(
                                    initialValue: day.endTime,
                                    decoration: InputDecoration(
                                      labelText:
                                          AppLocalizations.of(
                                            context,
                                          )?.end_time ??
                                          'End Time',
                                      hintText: '18:00',
                                    ),
                                    onChanged: (value) {
                                      final index = workingHours.indexOf(day);
                                      workingHours[index] = day.copyWith(
                                        endTime: value,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(AppLocalizations.of(context)?.cancel ?? 'Cancel'),
            ),
            ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () => _updateUserInfo(workingHours: workingHours),
              child: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(AppLocalizations.of(context)?.update ?? 'Update'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showUpdatePasswordDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)?.update_password ?? 'Update Password',
        ),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _oldPasswordController,
                obscureText: !_showOldPassword,
                decoration: InputDecoration(
                  labelText:
                      AppLocalizations.of(context)?.current_password ??
                      'Current Password',
                  hintText:
                      AppLocalizations.of(
                        context,
                      )?.enter_your_current_password ??
                      'Enter your current password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showOldPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _showOldPassword = !_showOldPassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(
                          context,
                        )?.please_enter_your_current_password ??
                        'Please enter your current password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _newPasswordController,
                obscureText: !_showNewPassword,
                decoration: InputDecoration(
                  labelText:
                      AppLocalizations.of(context)?.new_password ??
                      'New Password',
                  hintText:
                      AppLocalizations.of(context)?.enter_a_new_password ??
                      'Enter a new password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showNewPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _showNewPassword = !_showNewPassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(
                          context,
                        )?.please_enter_a_new_password ??
                        'Please enter a new password';
                  }
                  if (value.length < 6) {
                    return AppLocalizations.of(context)?.password_min_length ??
                        'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: !_showConfirmPassword,
                decoration: InputDecoration(
                  labelText:
                      AppLocalizations.of(context)?.confirm_password ??
                      'Confirm Password',
                  hintText:
                      AppLocalizations.of(context)?.confirm_your_new_password ??
                      'Confirm your new password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _showConfirmPassword = !_showConfirmPassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(
                          context,
                        )?.please_confirm_your_new_password ??
                        'Please confirm your new password';
                  }
                  if (value != _newPasswordController.text) {
                    return AppLocalizations.of(context)?.passwords_dont_match ??
                        'Passwords do not match';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)?.cancel ?? 'Cancel'),
          ),
          ElevatedButton(
            onPressed: _isLoading
                ? null
                : () {
                    if (_formKey.currentState!.validate()) {
                      _updateUserInfo(
                        oldPassword: _oldPasswordController.text,
                        newPassword: _newPasswordController.text,
                      );
                    }
                  },
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(AppLocalizations.of(context)?.update ?? 'Update'),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    bool isDark,
    VoidCallback? onEdit, // Made optional
  ) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primaryBlue.withAlpha((255 * 0.1).toInt()),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppColors.primaryBlue, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: isDark
                      ? AppColors.white.withAlpha((255 * 0.7).toInt())
                      : AppColors.dark.withAlpha((255 * 0.7).toInt()),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? AppColors.white : AppColors.dark,
                ),
              ),
            ],
          ),
        ),
        if (onEdit != null) // Only show edit button if onEdit is provided
          IconButton(
            icon: const Icon(Icons.edit, size: 20),
            onPressed: onEdit,
            color: AppColors.primaryBlue,
          ),
      ],
    );
  }

  Widget _buildLanguagesSection(
    BuildContext context,
    List<String> languages,
    bool isDark,
  ) {
    return Container(
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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withAlpha((255 * 0.1).toInt()),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.language,
                  color: AppColors.primaryBlue,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  AppLocalizations.of(context)?.languages_spoken ??
                      'Languages I Speak',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColors.white : AppColors.dark,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit, size: 20),
                onPressed: () => _showUpdateLanguagesDialog(languages),
                color: AppColors.primaryBlue,
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (languages.isEmpty)
            Text(
              AppLocalizations.of(context)?.no_languages_selected ??
                  'No languages selected',
              style: TextStyle(
                fontSize: 14,
                color: isDark
                    ? AppColors.white.withAlpha((255 * 0.7).toInt())
                    : AppColors.dark.withAlpha((255 * 0.7).toInt()),
              ),
            )
          else
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: languages.map<Widget>((language) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryBlue.withAlpha((255 * 0.1).toInt()),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.primaryBlue.withAlpha(
                        (255 * 0.3).toInt(),
                      ),
                    ),
                  ),
                  child: Text(
                    language,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildWorkingHoursSection(
    BuildContext context,
    List<WorkingHoursModel> workingHours,
    bool isDark,
  ) {
    return Container(
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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withAlpha((255 * 0.1).toInt()),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.schedule,
                  color: AppColors.primaryBlue,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  AppLocalizations.of(context)?.working_schedule ??
                      'Working Schedule',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColors.white : AppColors.dark,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit, size: 20),
                onPressed: () => _showUpdateWorkingHoursDialog(workingHours),
                color: AppColors.primaryBlue,
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (workingHours.isEmpty)
            Text(
              AppLocalizations.of(context)?.no_working_hours_set ??
                  'No working hours set',
              style: TextStyle(
                fontSize: 14,
                color: isDark
                    ? AppColors.white.withAlpha((255 * 0.7).toInt())
                    : AppColors.dark.withAlpha((255 * 0.7).toInt()),
              ),
            )
          else
            Column(
              children: workingHours.map<Widget>((day) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: Text(
                          day.dayName,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: isDark ? AppColors.white : AppColors.dark,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: day.isWorkingDay
                                ? Colors.green.withAlpha((255 * 0.1).toInt())
                                : Colors.red.withAlpha((255 * 0.1).toInt()),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: day.isWorkingDay
                                  ? Colors.green.withAlpha((255 * 0.3).toInt())
                                  : Colors.red.withAlpha((255 * 0.3).toInt()),
                            ),
                          ),
                          child: Text(
                            day.isWorkingDay
                                ? '${day.startTime} - ${day.endTime}'
                                : (AppLocalizations.of(context)?.day_off ??
                                      'Day Off'),
                            style: TextStyle(
                              fontSize: 14,
                              color: day.isWorkingDay
                                  ? Colors.green
                                  : Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.dark : Colors.white,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)?.account ?? 'Account',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          final user = authProvider.user;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)?.account_information ??
                      'Account Information',
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
                    children: [
                      _buildInfoRow(
                        context,
                        AppLocalizations.of(context)?.name ?? 'Name',
                        user!.name,
                        Icons.person_outline,
                        isDark,
                        null, // No edit button for name
                      ),
                      const SizedBox(height: 16),
                      _buildInfoRow(
                        context,
                        AppLocalizations.of(context)?.email ?? 'Email',
                        user.email,
                        Icons.email_outlined,
                        isDark,
                        () => _showUpdateEmailDialog(user.email),
                      ),
                      if (user.phone != null) ...[
                        const SizedBox(height: 16),
                        _buildInfoRow(
                          context,
                          AppLocalizations.of(context)?.phone ?? 'Phone',
                          user.phone!,
                          Icons.phone_outlined,
                          isDark,
                          () => _showUpdatePhoneDialog(user.phone),
                        ),
                      ],
                      if (user.city != null) ...[
                        const SizedBox(height: 16),
                        _buildInfoRow(
                          context,
                          AppLocalizations.of(context)?.city ?? 'City',
                          user.city!,
                          Icons.location_city_outlined,
                          isDark,
                          null, // No edit button for city
                        ),
                      ],
                      if (user.address != null) ...[
                        const SizedBox(height: 16),
                        _buildInfoRow(
                          context,
                          AppLocalizations.of(context)?.address ?? 'Address',
                          user.address!,
                          Icons.location_on_outlined,
                          isDark,
                          null, // No edit button for address
                        ),
                      ],
                      const SizedBox(height: 16),
                      _buildInfoRow(
                        context,
                        AppLocalizations.of(context)?.password ?? 'Password',
                        '••••••••',
                        Icons.lock_outline,
                        isDark,
                        _showUpdatePasswordDialog,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Languages Section
                _buildLanguagesSection(context, user.languages, isDark),
                const SizedBox(height: 24),
                // Working Hours Section
                _buildWorkingHoursSection(context, user.workingHours, isDark),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red.withAlpha((255 * 0.1).toInt()),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.red.withAlpha((255 * 0.2).toInt()),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)?.delete_account ??
                            'Delete Account',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        AppLocalizations.of(context)?.once_you_delete_account ??
                            'Once you delete your account, there is no going back. Please be certain.',
                        style: TextStyle(
                          color: isDark
                              ? AppColors.white.withAlpha((255 * 0.7).toInt())
                              : AppColors.dark.withAlpha((255 * 0.7).toInt()),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () async {
                            final shouldDelete = await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  AppLocalizations.of(
                                        context,
                                      )?.delete_account ??
                                      'Delete Account',
                                ),
                                content: Text(
                                  AppLocalizations.of(
                                        context,
                                      )?.are_you_sure_delete_account ??
                                      'Are you sure you want to delete your account? This action cannot be undone.',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, false),
                                    child: Text(
                                      AppLocalizations.of(context)?.cancel ??
                                          'Cancel',
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, true),
                                    child: Text(
                                      AppLocalizations.of(context)?.delete ??
                                          'Delete',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            );

                            if (shouldDelete == true && context.mounted) {
                              // TODO: Implement account deletion
                              await authProvider.signOut();
                              if (context.mounted) {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/signin',
                                  (route) => false,
                                );
                              }
                            }
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.red),
                            ),
                          ),
                          child: Text(
                            AppLocalizations.of(context)?.delete_account ??
                                'Delete Account',
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
