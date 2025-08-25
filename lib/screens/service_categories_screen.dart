import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hosta_provider/theme/app_colors.dart';
import 'package:hosta_provider/generated/app_localizations.dart';

class ServiceCategoriesScreen extends StatelessWidget {
  const ServiceCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          '${AppLocalizations.of(context)?.service_categories ?? 'Service Categories'} (${_serviceCategories.length})',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: isDark ? AppColors.dark : Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemCount: _serviceCategories.length,
          cacheExtent: 1000, // Cache more items for smoother scrolling
          addAutomaticKeepAlives:
              false, // Don't keep items alive when scrolling
          itemBuilder: (context, index) {
            final category = _serviceCategories[index];
            return _buildCategoryCard(context, category, isDark);
          },
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    ServiceCategory category,
    bool isDark,
  ) {
    return GestureDetector(
      onTap: () {
        // Navigate to services list for this category
        Navigator.pushNamed(context, '/category-services', arguments: category);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[800] : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Category Icon
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF4A90E2).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    category.iconPath,
                    width: 28,
                    height: 28,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Category Name
              Text(
                _getLocalizedCategoryName(context, category.name),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),

              // Services Count
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF4A90E2).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${category.servicesCount} ${AppLocalizations.of(context)?.services ?? 'Services'}',
                  style: TextStyle(
                    fontSize: 10,
                    color: const Color(0xFF4A90E2),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
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

  // Static service categories data
  static final List<ServiceCategory> _serviceCategories = [
    // Original categories
    ServiceCategory(
      id: 'cleaning',
      name: 'cleaning',
      iconPath: 'assets/icons/cleaning.svg',
      servicesCount: 8,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'plumbing',
      name: 'plumbing',
      iconPath: 'assets/icons/plumber.svg',
      servicesCount: 6,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'electrical',
      name: 'electrical',
      iconPath: 'assets/icons/electrican.svg',
      servicesCount: 7,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'car_washing',
      name: 'car_washing',
      iconPath: 'assets/icons/carwash.svg',
      servicesCount: 4,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'home_repair',
      name: 'home_repair',
      iconPath: 'assets/icons/homerepair.svg',
      servicesCount: 9,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'painting',
      name: 'painting',
      iconPath: 'assets/icons/painting.svg',
      servicesCount: 5,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'childcare',
      name: 'childcare',
      iconPath: 'assets/icons/babysitting.svg',
      servicesCount: 3,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'gardening',
      name: 'gardening',
      iconPath: 'assets/icons/gardining.svg',
      servicesCount: 6,
      color: const Color(0xFF4A90E2),
    ),

    // Duplicate categories for testing scroll performance
    ServiceCategory(
      id: 'cleaning_2',
      name: 'cleaning',
      iconPath: 'assets/icons/cleaning.svg',
      servicesCount: 12,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'plumbing_2',
      name: 'plumbing',
      iconPath: 'assets/icons/plumber.svg',
      servicesCount: 10,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'electrical_2',
      name: 'electrical',
      iconPath: 'assets/icons/electrican.svg',
      servicesCount: 15,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'car_washing_2',
      name: 'car_washing',
      iconPath: 'assets/icons/carwash.svg',
      servicesCount: 8,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'home_repair_2',
      name: 'home_repair',
      iconPath: 'assets/icons/homerepair.svg',
      servicesCount: 18,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'painting_2',
      name: 'painting',
      iconPath: 'assets/icons/painting.svg',
      servicesCount: 11,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'childcare_2',
      name: 'childcare',
      iconPath: 'assets/icons/babysitting.svg',
      servicesCount: 7,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'gardening_2',
      name: 'gardening',
      iconPath: 'assets/icons/gardining.svg',
      servicesCount: 14,
      color: const Color(0xFF4A90E2),
    ),

    // Third set of duplicates
    ServiceCategory(
      id: 'cleaning_3',
      name: 'cleaning',
      iconPath: 'assets/icons/cleaning.svg',
      servicesCount: 6,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'plumbing_3',
      name: 'plumbing',
      iconPath: 'assets/icons/plumber.svg',
      servicesCount: 9,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'electrical_3',
      name: 'electrical',
      iconPath: 'assets/icons/electrican.svg',
      servicesCount: 13,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'car_washing_3',
      name: 'car_washing',
      iconPath: 'assets/icons/carwash.svg',
      servicesCount: 5,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'home_repair_3',
      name: 'home_repair',
      iconPath: 'assets/icons/homerepair.svg',
      servicesCount: 16,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'painting_3',
      name: 'painting',
      iconPath: 'assets/icons/painting.svg',
      servicesCount: 8,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'childcare_3',
      name: 'childcare',
      iconPath: 'assets/icons/babysitting.svg',
      servicesCount: 4,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'gardening_3',
      name: 'gardening',
      iconPath: 'assets/icons/gardining.svg',
      servicesCount: 11,
      color: const Color(0xFF4A90E2),
    ),

    // Fourth set of duplicates
    ServiceCategory(
      id: 'cleaning_4',
      name: 'cleaning',
      iconPath: 'assets/icons/cleaning.svg',
      servicesCount: 10,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'plumbing_4',
      name: 'plumbing',
      iconPath: 'assets/icons/plumber.svg',
      servicesCount: 7,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'electrical_4',
      name: 'electrical',
      iconPath: 'assets/icons/electrican.svg',
      servicesCount: 12,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'car_washing_4',
      name: 'car_washing',
      iconPath: 'assets/icons/carwash.svg',
      servicesCount: 6,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'home_repair_4',
      name: 'home_repair',
      iconPath: 'assets/icons/homerepair.svg',
      servicesCount: 20,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'painting_4',
      name: 'painting',
      iconPath: 'assets/icons/painting.svg',
      servicesCount: 9,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'childcare_4',
      name: 'childcare',
      iconPath: 'assets/icons/babysitting.svg',
      servicesCount: 5,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'gardening_4',
      name: 'gardening',
      iconPath: 'assets/icons/gardining.svg',
      servicesCount: 15,
      color: const Color(0xFF4A90E2),
    ),

    // Fifth set of duplicates
    ServiceCategory(
      id: 'cleaning_5',
      name: 'cleaning',
      iconPath: 'assets/icons/cleaning.svg',
      servicesCount: 8,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'plumbing_5',
      name: 'plumbing',
      iconPath: 'assets/icons/plumber.svg',
      servicesCount: 11,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'electrical_5',
      name: 'electrical',
      iconPath: 'assets/icons/electrican.svg',
      servicesCount: 14,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'car_washing_5',
      name: 'car_washing',
      iconPath: 'assets/icons/carwash.svg',
      servicesCount: 7,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'home_repair_5',
      name: 'home_repair',
      iconPath: 'assets/icons/homerepair.svg',
      servicesCount: 17,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'painting_5',
      name: 'painting',
      iconPath: 'assets/icons/painting.svg',
      servicesCount: 10,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'childcare_5',
      name: 'childcare',
      iconPath: 'assets/icons/babysitting.svg',
      servicesCount: 6,
      color: const Color(0xFF4A90E2),
    ),
    ServiceCategory(
      id: 'gardening_5',
      name: 'gardening',
      iconPath: 'assets/icons/gardining.svg',
      servicesCount: 13,
      color: const Color(0xFF4A90E2),
    ),
  ];
}

class ServiceCategory {
  final String id;
  final String name;
  final String iconPath;
  final int servicesCount;
  final Color color;

  ServiceCategory({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.servicesCount,
    required this.color,
  });
}
