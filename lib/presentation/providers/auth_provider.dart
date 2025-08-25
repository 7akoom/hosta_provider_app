import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/user_model.dart';
import '../../data/models/working_hours_model.dart';
import '../../data/repositories/auth_repository.dart';
import '../../core/errors/network_exception.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  String? _error;
  final AuthRepository _authRepository;

  AuthProvider(this._authRepository) {
    _initializeAuthState();
  }

  // إنشاء مستخدم وهمي افتراضي
  UserModel _createMockUser() {
    // إنشاء أوقات العمل الافتراضية
    final workingHours = [
      WorkingHoursModel(
        dayOfWeek: 1,
        dayName: 'الاثنين',
        isWorkingDay: true,
        startTime: '08:00',
        endTime: '18:00',
      ),
      WorkingHoursModel(
        dayOfWeek: 2,
        dayName: 'الثلاثاء',
        isWorkingDay: true,
        startTime: '08:00',
        endTime: '18:00',
      ),
      WorkingHoursModel(
        dayOfWeek: 3,
        dayName: 'الأربعاء',
        isWorkingDay: true,
        startTime: '08:00',
        endTime: '18:00',
      ),
      WorkingHoursModel(
        dayOfWeek: 4,
        dayName: 'الخميس',
        isWorkingDay: true,
        startTime: '08:00',
        endTime: '18:00',
      ),
      WorkingHoursModel(
        dayOfWeek: 5,
        dayName: 'الجمعة',
        isWorkingDay: true,
        startTime: '08:00',
        endTime: '16:00',
      ),
      WorkingHoursModel(
        dayOfWeek: 6,
        dayName: 'السبت',
        isWorkingDay: true,
        startTime: '09:00',
        endTime: '17:00',
      ),
      WorkingHoursModel(
        dayOfWeek: 7,
        dayName: 'الأحد',
        isWorkingDay: false,
        startTime: null,
        endTime: null,
      ),
    ];

    return UserModel(
      id: 'mock_user_001',
      name: 'أحمد محمد',
      email: 'ahmed.mohamed@example.com',
      phone: '+964 750 123 4567',
      avatar: null,
      emailVerifiedAt: DateTime.now(),
      createdAt: DateTime.now().subtract(const Duration(days: 30)),
      updatedAt: DateTime.now(),
      isActive: true,
      city: 'بغداد',
      address: 'شارع الرشيد، بغداد، العراق',
      languages: ['Arabic', 'English', 'Kurdish'],
      workingHours: workingHours,
    );
  }

  Future<void> _initializeAuthState() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    if (token != null) {
      try {
        // يمكنك إضافة دالة في AuthRepository للتحقق من صلاحية التوكن
        // وجلب بيانات المستخدم من الباك إند
        // _user = await _authRepository.getUserProfile();
      } catch (e) {
        // في حالة حدوث خطأ، نقوم بمسح التوكن
        await prefs.remove('access_token');
        _user = null;
      }
    } else {
      // إضافة مستخدم وهمي افتراضي بدلاً من null
      _user = _createMockUser();
    }
    notifyListeners();
  }

  // Getters
  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _user != null;

  // Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }

  // Sign In
  Future<bool> signIn(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await _authRepository.signIn(email, password);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _error = e is NetworkException ? e.message : 'An error occurred';
      notifyListeners();
      return false;
    }
  }

  // Sign Up
  Future<bool> signUp({
    required String name,
    required String email,
    required String password,
    String? phone,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _user = await _authRepository.signUp(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      _error = e is NetworkException ? e.message : 'An error occurred';
      notifyListeners();
      return false;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authRepository.signOut();
      // بدلاً من تعيين _user = null، نعيد تعيين المستخدم الوهمي
      _user = _createMockUser();
      _error = null;
    } catch (e) {
      _error = e is NetworkException ? e.message : 'Sign out failed';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update User Information
  Future<void> updateUserInfo({
    String? email,
    String? phone,
    String? oldPassword,
    String? newPassword,
    List<String>? languages,
    List<WorkingHoursModel>? workingHours,
  }) async {
    if (_user == null) {
      throw Exception('User not authenticated');
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // في الوقت الحالي، نقوم بتحديث البيانات محلياً فقط
      // عند ربط الباك إند، يمكن استبدال هذا بالاستدعاء الفعلي
      _user = _user!.copyWith(
        email: email ?? _user!.email,
        phone: phone ?? _user!.phone,
        languages: languages ?? _user!.languages,
        workingHours: workingHours ?? _user!.workingHours,
        updatedAt: DateTime.now(),
      );

      // عند ربط الباك إند، استخدم هذا الكود:
      // _user = await _authRepository.updateUserInfo(
      //   email: email,
      //   phone: phone,
      //   oldPassword: oldPassword,
      //   newPassword: newPassword,
      //   languages: languages,
      //   workingHours: workingHours,
      // );

      _error = null;
      notifyListeners();
    } catch (e) {
      _error = e is NetworkException ? e.message : e.toString();
      throw Exception(_error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update User Profile
  void updateUser(UserModel updatedUser) {
    _user = updatedUser;
    notifyListeners();
  }

  // Check if user is authenticated
  bool isUserAuthenticated() {
    return _user != null;
  }

  // Reset auth state
  Future<void> resetAuthState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    // بدلاً من تعيين _user = null، نعيد تعيين المستخدم الوهمي
    _user = _createMockUser();
    notifyListeners();
  }
}
