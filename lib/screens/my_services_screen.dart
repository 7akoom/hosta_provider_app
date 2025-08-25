import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hosta_provider/theme/app_colors.dart';
import 'package:hosta_provider/generated/app_localizations.dart';

class MyServicesScreen extends StatefulWidget {
  const MyServicesScreen({super.key});

  @override
  State<MyServicesScreen> createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen> {
  final List<Map<String, dynamic>> _services = [
    // Cleaning Services
    {
      'id': '1',
      'title': 'تنظيف المنزل',
      'description': 'تنظيف شامل للمنزل',
      'status': 'active',
      'price': 50000,
      'iconPath': 'assets/icons/cleaning.svg',
    },
    {
      'id': '2',
      'title': 'تنظيف المكاتب',
      'description': 'تنظيف المكاتب والشركات',
      'status': 'active',
      'price': 80000,
      'iconPath': 'assets/icons/cleaning.svg',
    },
    {
      'id': '3',
      'title': 'تنظيف السجاد',
      'description': 'تنظيف وغسيل السجاد',
      'status': 'active',
      'price': 30000,
      'iconPath': 'assets/icons/cleaning.svg',
    },

    // Plumbing Services
    {
      'id': '4',
      'title': 'إصلاح الأنابيب',
      'description': 'إصلاح تسربات الأنابيب',
      'status': 'active',
      'price': 40000,
      'iconPath': 'assets/icons/plumber.svg',
    },
    {
      'id': '5',
      'title': 'إصلاح الحنفيات',
      'description': 'إصلاح واستبدال الحنفيات',
      'status': 'inactive',
      'price': 25000,
      'iconPath': 'assets/icons/plumber.svg',
    },
    {
      'id': '6',
      'title': 'إصلاح المراحيض',
      'description': 'إصلاح مشاكل المراحيض',
      'status': 'active',
      'price': 35000,
      'iconPath': 'assets/icons/plumber.svg',
    },

    // Electrical Services
    {
      'id': '7',
      'title': 'إصلاح الكهرباء',
      'description': 'إصلاح مشاكل الكهرباء',
      'status': 'active',
      'price': 50000,
      'iconPath': 'assets/icons/electrican.svg',
    },
    {
      'id': '8',
      'title': 'تركيب الإضاءة',
      'description': 'تركيب وصيانة الإضاءة',
      'status': 'active',
      'price': 35000,
      'iconPath': 'assets/icons/electrican.svg',
    },
    {
      'id': '9',
      'title': 'إصلاح المقابس',
      'description': 'إصلاح واستبدال المقابس الكهربائية',
      'status': 'inactive',
      'price': 20000,
      'iconPath': 'assets/icons/electrican.svg',
    },

    // Car Washing Services
    {
      'id': '10',
      'title': 'غسيل خارجي',
      'description': 'غسيل خارجي للسيارة',
      'status': 'active',
      'price': 15000,
      'iconPath': 'assets/icons/carwash.svg',
    },
    {
      'id': '11',
      'title': 'تنظيف داخلي',
      'description': 'تنظيف داخل السيارة',
      'status': 'active',
      'price': 20000,
      'iconPath': 'assets/icons/carwash.svg',
    },
    {
      'id': '12',
      'title': 'غسيل شامل',
      'description': 'غسيل شامل خارجي وداخلي',
      'status': 'active',
      'price': 30000,
      'iconPath': 'assets/icons/carwash.svg',
    },

    // Home Repair Services
    {
      'id': '13',
      'title': 'إصلاح الأبواب',
      'description': 'إصلاح وصيانة الأبواب',
      'status': 'active',
      'price': 40000,
      'iconPath': 'assets/icons/homerepair.svg',
    },
    {
      'id': '14',
      'title': 'إصلاح الأثاث',
      'description': 'إصلاح وصيانة الأثاث',
      'status': 'inactive',
      'price': 30000,
      'iconPath': 'assets/icons/homerepair.svg',
    },
    {
      'id': '15',
      'title': 'إصلاح الأقفال',
      'description': 'إصلاح واستبدال الأقفال',
      'status': 'active',
      'price': 25000,
      'iconPath': 'assets/icons/homerepair.svg',
    },

    // Painting Services
    {
      'id': '16',
      'title': 'دهان الجدران',
      'description': 'دهان جدران المنزل',
      'status': 'active',
      'price': 100000,
      'iconPath': 'assets/icons/painting.svg',
    },
    {
      'id': '17',
      'title': 'دهان الأثاث',
      'description': 'دهان وصيانة الأثاث',
      'status': 'active',
      'price': 50000,
      'iconPath': 'assets/icons/painting.svg',
    },
    {
      'id': '18',
      'title': 'دهان خارجي',
      'description': 'دهان الواجهات الخارجية',
      'status': 'inactive',
      'price': 150000,
      'iconPath': 'assets/icons/painting.svg',
    },

    // Childcare Services
    {
      'id': '19',
      'title': 'جلوس مع الأطفال',
      'description': 'رعاية الأطفال في المنزل',
      'status': 'active',
      'price': 20000,
      'iconPath': 'assets/icons/babysitting.svg',
    },
    {
      'id': '20',
      'title': 'مساعدة في الواجبات',
      'description': 'مساعدة الأطفال في الواجبات المدرسية',
      'status': 'active',
      'price': 25000,
      'iconPath': 'assets/icons/babysitting.svg',
    },
    {
      'id': '21',
      'title': 'إشراف على اللعب',
      'description': 'إشراف على لعب الأطفال',
      'status': 'inactive',
      'price': 15000,
      'iconPath': 'assets/icons/babysitting.svg',
    },

    // Gardening Services
    {
      'id': '22',
      'title': 'قص العشب',
      'description': 'قص وصيانة العشب',
      'status': 'active',
      'price': 30000,
      'iconPath': 'assets/icons/gardining.svg',
    },
    {
      'id': '23',
      'title': 'رعاية النباتات',
      'description': 'رعاية وري النباتات',
      'status': 'active',
      'price': 20000,
      'iconPath': 'assets/icons/gardining.svg',
    },
    {
      'id': '24',
      'title': 'تصميم الحدائق',
      'description': 'تصميم وتنسيق الحدائق',
      'status': 'active',
      'price': 100000,
      'iconPath': 'assets/icons/gardining.svg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.dark : Colors.white,
        elevation: 0,
        title: Text(
          AppLocalizations.of(context)?.my_services ?? 'My Services',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              AppLocalizations.of(context)?.my_services ?? 'My Services',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.white : AppColors.dark,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: _services.length,
              itemBuilder: (context, index) {
                final service = _services[index];
                final isActive = service['status'] == 'active';

                return Container(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.dark : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDark
                          ? AppColors.white.withAlpha((255 * 0.1).toInt())
                          : AppColors.boxBorder,
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(
                          0xFF4A90E2,
                        ).withAlpha((255 * 0.1).toInt()),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          service['iconPath'],
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    title: Text(
                      service['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isDark ? AppColors.white : AppColors.dark,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          service['description'],
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark
                                ? AppColors.white.withAlpha((255 * 0.7).toInt())
                                : AppColors.dark.withAlpha((255 * 0.7).toInt()),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: isActive ? Colors.green : Colors.grey,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                isActive
                                    ? (AppLocalizations.of(context)?.active ??
                                          'Active')
                                    : (AppLocalizations.of(context)?.inactive ??
                                          'Inactive'),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '${service['price']} د.ع',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF4A90E2),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: PopupMenuButton<String>(
                      icon: Icon(
                        Icons.more_vert,
                        color: isDark ? AppColors.white : AppColors.dark,
                      ),
                      onSelected: (value) {
                        _handleServiceAction(value, service);
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'edit',
                          child: Row(
                            children: [
                              const Icon(Icons.edit),
                              const SizedBox(width: 8),
                              Text(
                                AppLocalizations.of(context)?.edit ?? 'Edit',
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'toggle',
                          child: Row(
                            children: [
                              const Icon(Icons.power_settings_new),
                              const SizedBox(width: 8),
                              Text(
                                AppLocalizations.of(context)?.toggle_status ??
                                    'Toggle Status',
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              const Icon(Icons.delete, color: Colors.red),
                              const SizedBox(width: 8),
                              Text(
                                AppLocalizations.of(context)?.delete ??
                                    'Delete',
                                style: const TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to service categories screen
          Navigator.pushNamed(context, '/service-categories');
        },
        backgroundColor: AppColors.primaryBlue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _handleServiceAction(String action, Map<String, dynamic> service) {
    switch (action) {
      case 'edit':
        _showEditPriceDialog(context, service);
        break;
      case 'toggle':
        setState(() {
          service['status'] = service['status'] == 'active'
              ? 'inactive'
              : 'active';
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${service['title']} ${AppLocalizations.of(context)?.status_updated ?? 'status updated'}!',
            ),
            backgroundColor: const Color(0xFF4A90E2),
          ),
        );
        break;
      case 'delete':
        _showDeleteConfirmationDialog(context, service);
        break;
    }
  }

  void _showEditPriceDialog(
    BuildContext context,
    Map<String, dynamic> service,
  ) {
    final TextEditingController priceController = TextEditingController();
    priceController.text = service['price'].toString();
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
              child: const Icon(Icons.edit, color: Colors.white, size: 36),
            ),
            const SizedBox(height: 24),
            Text(
              AppLocalizations.of(context)?.edit_service ?? 'Edit Service',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              service['title'],
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
                        setState(() {
                          service['price'] = double.parse(price).toInt();
                        });
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${service['title']} ${AppLocalizations.of(context)?.service_updated_successfully ?? 'service updated successfully'} - ${service['price']} د.ع',
                            ),
                            backgroundColor: const Color(0xFF4A90E2),
                            duration: const Duration(seconds: 3),
                          ),
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
                      AppLocalizations.of(context)?.edit ?? 'Edit',
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

  void _showDeleteConfirmationDialog(
    BuildContext context,
    Map<String, dynamic> service,
  ) {
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
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.delete, color: Colors.white, size: 36),
            ),
            const SizedBox(height: 24),
            Text(
              AppLocalizations.of(context)?.delete_service ?? 'Delete Service',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${AppLocalizations.of(context)?.delete_service_confirmation ?? 'Are you sure you want to delete'} ${service['title']}?',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
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
                      setState(() {
                        _services.removeWhere((s) => s['id'] == service['id']);
                      });
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${service['title']} ${AppLocalizations.of(context)?.service_deleted_successfully ?? 'service deleted successfully'}!',
                          ),
                          backgroundColor: const Color(0xFF4A90E2),
                          duration: const Duration(seconds: 3),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context)?.delete ?? 'Delete',
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
}
