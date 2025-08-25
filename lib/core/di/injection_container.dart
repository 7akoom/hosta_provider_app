import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hosta_provider/data/datasources/api_service.dart';
import 'package:hosta_provider/data/repositories/auth_repository.dart';
import 'package:hosta_provider/data/repositories/booking_repository.dart';
import 'package:hosta_provider/presentation/providers/auth_provider.dart';
import 'package:hosta_provider/presentation/providers/app_settings_provider.dart';
import 'package:hosta_provider/presentation/providers/notification_provider.dart';
import 'package:hosta_provider/presentation/providers/booking_provider.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Data Sources
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(getIt<SharedPreferences>()),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<ApiService>()),
  );
  getIt.registerLazySingleton<BookingRepository>(
    () => BookingRepository(getIt<ApiService>()),
  );

  // Providers
  getIt.registerFactory<NotificationProvider>(() => NotificationProvider());
  getIt.registerFactory<AppSettingsProvider>(
    () => AppSettingsProvider(getIt<SharedPreferences>()),
  );
  getIt.registerFactory<AuthProvider>(
    () => AuthProvider(getIt<AuthRepository>()),
  );
  getIt.registerFactory<BookingProvider>(
    () => BookingProvider(getIt<BookingRepository>()),
  );
}
