import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hosta_provider/theme/app_colors.dart';
import 'package:hosta_provider/generated/app_localizations.dart';
import 'package:hosta_provider/screens/service_categories_screen.dart';

class CategoryServicesScreen extends StatelessWidget {
  const CategoryServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final ServiceCategory category = arguments as ServiceCategory;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.dark : Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? Colors.white : Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          _getLocalizedCategoryName(context, category.name),
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: isDark ? AppColors.dark : Colors.grey[50],
      body: Column(
        children: [
          // Category Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[800] : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Category Icon
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4A90E2).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      category.iconPath,
                      width: 32,
                      height: 32,
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Category Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getLocalizedCategoryName(context, category.name),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${category.servicesCount} ${AppLocalizations.of(context)?.services ?? 'Services'}',
                        style: TextStyle(
                          fontSize: 14,
                          color: isDark ? Colors.grey[400] : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Services List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: _getServicesForCategory(category.id).length,
                itemBuilder: (context, index) {
                  final service = _getServicesForCategory(category.id)[index];
                  return _buildServiceCard(
                    context,
                    service,
                    isDark,
                    category.color,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getLocalizedCategoryName(BuildContext context, String categoryName) {
    switch (categoryName) {
      case 'cleaning':
        return AppLocalizations.of(context)?.cleaning ?? 'Cleaning';
      case 'plumbing':
        return AppLocalizations.of(context)?.plumbing ?? 'Plumbing';
      case 'electrical':
        return AppLocalizations.of(context)?.electrical ?? 'Electrical';
      case 'car_washing':
        return AppLocalizations.of(context)?.car_washing ?? 'Car Washing';
      case 'home_repair':
        return AppLocalizations.of(context)?.home_repair ?? 'Home Repair';
      case 'painting':
        return AppLocalizations.of(context)?.painting ?? 'Painting';
      case 'childcare':
        return AppLocalizations.of(context)?.childcare ?? 'Childcare';
      case 'gardening':
        return AppLocalizations.of(context)?.gardening ?? 'Gardening';
      default:
        return categoryName;
    }
  }

  Widget _buildServiceCard(
    BuildContext context,
    ServiceItem service,
    bool isDark,
    Color categoryColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF4A90E2).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: _getServiceIcon(service.name, const Color(0xFF4A90E2)),
          ),
        ),
        title: Text(
          service.name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              service.description,
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.grey[400] : Colors.grey[600],
              ),
            ),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Add service to provider's services
            _addServiceToProvider(context, service);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4A90E2),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            AppLocalizations.of(context)?.add ?? 'Add',
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }

  void _addServiceToProvider(BuildContext context, ServiceItem service) {
    _showPriceInputDialog(context, service);
  }

  void _showPriceInputDialog(BuildContext context, ServiceItem service) {
    final TextEditingController priceController = TextEditingController();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xFF4A90E2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add_business,
                color: Colors.white,
                size: 36,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              AppLocalizations.of(context)?.add_service ?? 'Add Service',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              service.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)?.price ?? 'Price',
                hintText: '0',
                suffixText: 'د.ع',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: isDark ? Colors.grey[800] : Colors.grey[100],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)?.cancel ?? 'Cancel',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final price = priceController.text.trim();
                      if (price.isNotEmpty && double.tryParse(price) != null) {
                        Navigator.pop(context);
                        _confirmAddService(
                          context,
                          service,
                          double.parse(price),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              AppLocalizations.of(
                                    context,
                                  )?.please_enter_valid_price ??
                                  'Please enter a valid price',
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A90E2),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)?.add ?? 'Add',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _confirmAddService(
    BuildContext context,
    ServiceItem service,
    double price,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${service.name} ${AppLocalizations.of(context)?.service_added_successfully ?? 'service added successfully'} - ${price.toInt()} د.ع',
        ),
        backgroundColor: const Color(0xFF4A90E2),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Widget _getServiceIcon(String serviceName, Color categoryColor) {
    // Use SVG icons for services based on category
    String iconPath = '';

    if (serviceName.contains('تنظيف') || serviceName.contains('cleaning')) {
      iconPath = 'assets/icons/cleaning.svg';
    } else if (serviceName.contains('سباكة') ||
        serviceName.contains('plumbing')) {
      iconPath = 'assets/icons/plumber.svg';
    } else if (serviceName.contains('كهرباء') ||
        serviceName.contains('electrical')) {
      iconPath = 'assets/icons/electrican.svg';
    } else if (serviceName.contains('غسيل') || serviceName.contains('car')) {
      iconPath = 'assets/icons/carwash.svg';
    } else if (serviceName.contains('إصلاح') ||
        serviceName.contains('repair')) {
      iconPath = 'assets/icons/homerepair.svg';
    } else if (serviceName.contains('دهان') ||
        serviceName.contains('painting')) {
      iconPath = 'assets/icons/painting.svg';
    } else if (serviceName.contains('أطفال') || serviceName.contains('child')) {
      iconPath = 'assets/icons/babysitting.svg';
    } else if (serviceName.contains('حدائق') ||
        serviceName.contains('garden')) {
      iconPath = 'assets/icons/gardining.svg';
    } else {
      // Default icon
      return Icon(Icons.miscellaneous_services, color: categoryColor, size: 24);
    }

    return SvgPicture.asset(iconPath, width: 24, height: 24);
  }

  // Static services data for each category
  List<ServiceItem> _getServicesForCategory(String categoryId) {
    switch (categoryId) {
      case 'cleaning':
        return [
          ServiceItem(
            id: 'house_cleaning',
            name: 'تنظيف المنزل',
            description: 'تنظيف شامل للمنزل',
            price: '50-100',
            icon: Icons.cleaning_services,
          ),
          ServiceItem(
            id: 'office_cleaning',
            name: 'تنظيف المكاتب',
            description: 'تنظيف المكاتب والشركات',
            price: '80-150',
            icon: Icons.business,
          ),
          ServiceItem(
            id: 'carpet_cleaning',
            name: 'تنظيف السجاد',
            description: 'تنظيف وغسيل السجاد',
            price: '30-60',
            icon: Icons.cleaning_services,
          ),
          ServiceItem(
            id: 'window_cleaning',
            name: 'تنظيف النوافذ',
            description: 'تنظيف النوافذ والزجاج',
            price: '20-40',
            icon: Icons.window,
          ),
        ];

      case 'plumbing':
        return [
          ServiceItem(
            id: 'pipe_repair',
            name: 'إصلاح الأنابيب',
            description: 'إصلاح تسربات الأنابيب',
            price: '40-80',
            icon: Icons.plumbing,
          ),
          ServiceItem(
            id: 'faucet_repair',
            name: 'إصلاح الحنفيات',
            description: 'إصلاح واستبدال الحنفيات',
            price: '25-50',
            icon: Icons.water_drop,
          ),
          ServiceItem(
            id: 'toilet_repair',
            name: 'إصلاح المراحيض',
            description: 'إصلاح مشاكل المراحيض',
            price: '30-60',
            icon: Icons.plumbing,
          ),
        ];

      case 'electrical':
        return [
          ServiceItem(
            id: 'electrical_repair',
            name: 'إصلاح الكهرباء',
            description: 'إصلاح مشاكل الكهرباء',
            price: '50-100',
            icon: Icons.electrical_services,
          ),
          ServiceItem(
            id: 'light_installation',
            name: 'تركيب الإضاءة',
            description: 'تركيب وصيانة الإضاءة',
            price: '30-70',
            icon: Icons.lightbulb,
          ),
          ServiceItem(
            id: 'socket_repair',
            name: 'إصلاح المقابس',
            description: 'إصلاح واستبدال المقابس الكهربائية',
            price: '20-40',
            icon: Icons.power,
          ),
        ];

      case 'car_washing':
        return [
          ServiceItem(
            id: 'exterior_wash',
            name: 'غسيل خارجي',
            description: 'غسيل خارجي للسيارة',
            price: '15-30',
            icon: Icons.car_repair,
          ),
          ServiceItem(
            id: 'interior_cleaning',
            name: 'تنظيف داخلي',
            description: 'تنظيف داخل السيارة',
            price: '20-40',
            icon: Icons.airline_seat_recline_normal,
          ),
          ServiceItem(
            id: 'full_wash',
            name: 'غسيل شامل',
            description: 'غسيل شامل خارجي وداخلي',
            price: '30-60',
            icon: Icons.local_car_wash,
          ),
        ];

      case 'home_repair':
        return [
          ServiceItem(
            id: 'door_repair',
            name: 'إصلاح الأبواب',
            description: 'إصلاح وصيانة الأبواب',
            price: '40-80',
            icon: Icons.door_front_door,
          ),
          ServiceItem(
            id: 'furniture_repair',
            name: 'إصلاح الأثاث',
            description: 'إصلاح وصيانة الأثاث',
            price: '30-70',
            icon: Icons.chair,
          ),
          ServiceItem(
            id: 'lock_repair',
            name: 'إصلاح الأقفال',
            description: 'إصلاح واستبدال الأقفال',
            price: '25-50',
            icon: Icons.lock,
          ),
        ];

      case 'painting':
        return [
          ServiceItem(
            id: 'wall_painting',
            name: 'دهان الجدران',
            description: 'دهان جدران المنزل',
            price: '100-200',
            icon: Icons.format_paint,
          ),
          ServiceItem(
            id: 'furniture_painting',
            name: 'دهان الأثاث',
            description: 'دهان وصيانة الأثاث',
            price: '50-100',
            icon: Icons.palette,
          ),
          ServiceItem(
            id: 'exterior_painting',
            name: 'دهان خارجي',
            description: 'دهان الواجهات الخارجية',
            price: '150-300',
            icon: Icons.home_repair_service,
          ),
        ];

      case 'childcare':
        return [
          ServiceItem(
            id: 'babysitting',
            name: 'جلوس مع الأطفال',
            description: 'رعاية الأطفال في المنزل',
            price: '20-40',
            icon: Icons.child_care,
          ),
          ServiceItem(
            id: 'homework_help',
            name: 'مساعدة في الواجبات',
            description: 'مساعدة الأطفال في الواجبات المدرسية',
            price: '25-45',
            icon: Icons.school,
          ),
          ServiceItem(
            id: 'play_supervision',
            name: 'إشراف على اللعب',
            description: 'إشراف على لعب الأطفال',
            price: '15-30',
            icon: Icons.toys,
          ),
        ];

      case 'gardening':
        return [
          ServiceItem(
            id: 'lawn_mowing',
            name: 'قص العشب',
            description: 'قص وصيانة العشب',
            price: '30-60',
            icon: Icons.grass,
          ),
          ServiceItem(
            id: 'plant_care',
            name: 'رعاية النباتات',
            description: 'رعاية وري النباتات',
            price: '20-40',
            icon: Icons.local_florist,
          ),
          ServiceItem(
            id: 'garden_design',
            name: 'تصميم الحدائق',
            description: 'تصميم وتنسيق الحدائق',
            price: '100-200',
            icon: Icons.eco,
          ),
        ];

      default:
        return [];
    }
  }
}

class ServiceItem {
  final String id;
  final String name;
  final String description;
  final String price;
  final IconData icon;

  ServiceItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.icon,
  });
}
