import 'package:flutter/material.dart';
import 'package:hosta_provider/theme/app_colors.dart';
import 'package:hosta_provider/domain/entities/booking_status.dart';
import 'package:hosta_provider/presentation/widgets/status_chip.dart';
import 'package:hosta_provider/presentation/widgets/confirmation_dialog.dart';
import 'package:hosta_provider/presentation/widgets/payment_confirmation_dialog.dart';
import 'package:hosta_provider/routes/app_routes.dart';
import 'package:hosta_provider/generated/app_localizations.dart';

class BookingsScreen extends StatefulWidget {
  final int? initialTabIndex;

  const BookingsScreen({super.key, this.initialTabIndex});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<String> _getTabs(BuildContext context) {
    return [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.accepted,
      AppLocalizations.of(context)!.in_progress,
      AppLocalizations.of(context)!.completed,
      AppLocalizations.of(context)!.pending,
      AppLocalizations.of(context)!.cancelled,
    ];
  }

  // Mock data للحجوزات
  final List<BookingModel> _allBookings = [
    // حجز قيد التنفيذ
    BookingModel(
      id: '#45624',
      clientName: 'Ahmed Hassan',
      clientPhone: '+964 770 123 4567',
      service: 'House Cleaning',
      date: '15 JUL 2019',
      time: '02:00 PM',
      price: '120 د.ع',
      status: BookingStatus.inProgress,
      clientAddress: 'Erbil, Kurdistan Region, Iraq',
      latitude: 36.2012,
      longitude: 44.0094,
      notes: 'Regular house cleaning service in progress.',
    ),
    BookingModel(
      id: '#45623',
      clientName: 'Othman Ali',
      clientPhone: '+964 770 123 4567',
      service: 'Cleaning & Booking Taxi',
      date: '14 JUL 2019',
      time: '10:00 AM',
      price: '150 د.ع',
      status: BookingStatus.confirmed,
      clientAddress: 'Erbil, Kurdistan Region, Iraq',
      latitude: 36.2012,
      longitude: 44.0094,
      notes:
          'Please clean the kitchen and living room thoroughly. I need the service to be completed before 3 PM.',
      images: [
        'https://via.placeholder.com/300x200',
        'https://via.placeholder.com/300x200',
      ],
    ),
    BookingModel(
      id: '#45623',
      clientName: 'Othman Ali',
      clientPhone: '+964 770 123 4567',
      service: 'Cleaning, Marketing, Taxi',
      date: '14 JUL 2019',
      time: '10:00 AM',
      price: '700 د.ع',
      status: BookingStatus.pending,
      clientAddress: 'Sulaymaniyah, Kurdistan Region, Iraq',
      latitude: 35.5562,
      longitude: 45.4297,
      notes:
          'Marketing consultation needed for small business. Please bring relevant materials.',
    ),
    BookingModel(
      id: '#45623',
      clientName: 'Othman Ali',
      clientPhone: '+964 770 123 4567',
      service: 'Cleaning & Booking Taxi',
      date: '14 JUL 2019',
      time: '10:00 AM',
      price: '40 د.ع',
      status: BookingStatus.accepted,
      clientAddress: 'Dohuk, Kurdistan Region, Iraq',
      latitude: 37.0583,
      longitude: 43.0000,
      notes: 'Standard cleaning service required.',
      images: ['https://via.placeholder.com/300x200'],
    ),
    BookingModel(
      id: '#45623',
      clientName: 'Othman Ali',
      clientPhone: '+964 770 123 4567',
      service: 'Cleaning & Booking Taxi',
      date: '14 JUL 2019',
      time: '10:00 AM',
      price: '234 د.ع',
      status: BookingStatus.accepted,
      clientAddress: 'Erbil, Kurdistan Region, Iraq',
      latitude: 36.1900,
      longitude: 44.0090,
      notes: 'Deep cleaning required for office space.',
    ),
    BookingModel(
      id: '#45623',
      clientName: 'Othman Ali',
      clientPhone: '+964 770 123 4567',
      service: 'Cleaning & Booking Taxi',
      date: '14 JUL 2019',
      time: '10:00 AM',
      price: '150 د.ع',
      status: BookingStatus.confirmed,
      clientAddress: 'Erbil, Kurdistan Region, Iraq',
      latitude: 36.2100,
      longitude: 44.0200,
      notes: 'Regular weekly cleaning service.',
    ),
    BookingModel(
      id: '#45625',
      clientName: 'Sara Ahmed',
      clientPhone: '+964 750 987 6543',
      service: 'House Painting',
      date: '16 JUL 2019',
      time: '09:00 AM',
      price: '300 د.ع',
      status: BookingStatus.cancelled,
      clientAddress: 'Sulaymaniyah, Kurdistan Region, Iraq',
      latitude: 35.5562,
      longitude: 45.4297,
      notes: 'Painting service cancelled due to weather conditions.',
      cancellationReason: 'Weather conditions not suitable for painting work.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 6,
      vsync: this,
      initialIndex: widget.initialTabIndex ?? 0,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<BookingModel> _getFilteredBookings(int tabIndex) {
    switch (tabIndex) {
      case 0: // All
        return _allBookings;
      case 1: // Accepted
        return _allBookings
            .where((b) => b.status == BookingStatus.accepted)
            .toList();
      case 2: // In Progress
        return _allBookings
            .where((b) => b.status == BookingStatus.inProgress)
            .toList();
      case 3: // Completed
        return _allBookings
            .where((b) => b.status == BookingStatus.confirmed)
            .toList();
      case 4: // Pending
        return _allBookings
            .where((b) => b.status == BookingStatus.pending)
            .toList();
      case 5: // Cancelled
        return _allBookings
            .where((b) => b.status == BookingStatus.cancelled)
            .toList();
      default:
        return _allBookings;
    }
  }

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
          AppLocalizations.of(context)?.bookings ?? 'Bookings',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications_outlined,
                  color: isDark ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/notifications');
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: isDark ? AppColors.dark : Colors.grey[50],
      body: Column(
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _getTabs(context).asMap().entries.map<Widget>((
                  entry,
                ) {
                  final isSelected = _tabController.index == entry.key;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _tabController.animateTo(entry.key);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isSelected
                            ? const Color(0xFF4A90E2)
                            : (isDark ? Colors.grey[800] : Colors.white),
                        foregroundColor: isSelected
                            ? Colors.white
                            : (isDark ? Colors.white : Colors.black),
                        elevation: isSelected ? 2 : 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: isSelected
                                ? const Color(0xFF4A90E2)
                                : Colors.transparent,
                          ),
                        ),
                      ),
                      child: Text(
                        entry.value,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _getTabs(context).asMap().entries.map<Widget>((entry) {
                final filteredBookings = _getFilteredBookings(entry.key);
                return _buildBookingsList(filteredBookings, isDark);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingsList(List<BookingModel> bookings, bool isDark) {
    if (bookings.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.no_bookings_found,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return _buildBookingCard(booking, isDark);
      },
    );
  }

  Widget _buildBookingCard(BookingModel booking, bool isDark) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.bookingDetails,
          arguments: booking,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? Colors.grey[800] : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header مع رقم الحجز والحالة
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${AppLocalizations.of(context)!.booking} ${booking.id}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                StatusChip(status: booking.status),
              ],
            ),
            const SizedBox(height: 12),

            // معلومات العميل والخدمة
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, color: Colors.grey[600]),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking.clientName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        booking.service,
                        style: TextStyle(
                          fontSize: 14,
                          color: isDark ? Colors.grey[300] : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  booking.price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A90E2),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // التاريخ والوقت
            Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 16,
                      color: isDark ? Colors.grey[400] : Colors.grey[600],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${booking.date} - ${booking.time}',
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildBookingActionButtons(booking, isDark),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingActionButtons(BookingModel booking, bool isDark) {
    switch (booking.status) {
      case BookingStatus.pending:
        return Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  final confirmed = await ConfirmationDialog.show(
                    context,
                    title: AppLocalizations.of(context)!.reject_booking,
                    message: AppLocalizations.of(
                      context,
                    )!.reject_booking_confirmation,
                    confirmText: AppLocalizations.of(context)!.reject,
                    confirmColor: const Color(0xFFdc3545),
                    icon: Icons.close,
                    iconBackground: Colors.red,
                  );
                  if (confirmed == true && mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          AppLocalizations.of(context)!.booking_rejected,
                        ),
                        backgroundColor: const Color(0xFFdc3545),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFdc3545), // Red
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.reject,
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  final confirmed = await ConfirmationDialog.show(
                    context,
                    title: AppLocalizations.of(context)!.accept_booking,
                    message: AppLocalizations.of(
                      context,
                    )!.accept_booking_confirmation,
                    confirmText: AppLocalizations.of(context)!.accept,
                    confirmColor: const Color(0xFF28a745),
                    icon: Icons.check,
                    iconBackground: Colors.green,
                  );
                  if (confirmed == true && mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          AppLocalizations.of(
                            context,
                          )!.booking_accepted_successfully,
                        ),
                        backgroundColor: const Color(0xFF28a745),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF28a745), // Green
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.accept,
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        );
      case BookingStatus.accepted:
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              final confirmed = await ConfirmationDialog.show(
                context,
                title: AppLocalizations.of(context)!.start_service,
                message: AppLocalizations.of(
                  context,
                )!.start_service_confirmation,
                confirmText: AppLocalizations.of(context)!.start_service,
                confirmColor: const Color(0xFF4A90E2),
                icon: Icons.play_arrow,
                iconBackground: const Color(0xFF4A90E2),
              );
              if (confirmed == true && mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AppLocalizations.of(
                        context,
                      )!.service_started_successfully,
                    ),
                    backgroundColor: const Color(0xFF4A90E2),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF007bff), // Blue
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              AppLocalizations.of(context)!.start_service,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      case BookingStatus.inProgress:
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              // أولاً، نعرض نافذة تأكيد إنهاء الخدمة
              final confirmed = await ConfirmationDialog.show(
                context,
                title: AppLocalizations.of(context)!.finish_service,
                message: AppLocalizations.of(context)!.end_service_confirmation,
                confirmText: AppLocalizations.of(context)!.completed,
                confirmColor: const Color(0xFF20c997),
                icon: Icons.check,
                iconBackground: Colors.green,
              );

              if (confirmed == true && mounted) {
                // إذا تم التأكيد، نعرض نافذة تأكيد المبلغ
                final paymentResult = await PaymentConfirmationDialog.show(
                  context,
                  servicePrice: booking.price,
                  serviceName: booking.service,
                  clientName: booking.clientName,
                );

                if (paymentResult != null &&
                    paymentResult['confirmed'] == true &&
                    mounted) {
                  // عرض رسالة نجاح مع تفاصيل المبلغ
                  final totalAmount = paymentResult['totalAmount'] as double;
                  final additionalCost =
                      paymentResult['additionalCost'] as double;

                  String message = AppLocalizations.of(
                    context,
                  )!.service_completed_successfully;
                  if (additionalCost > 0) {
                    message +=
                        '\n${AppLocalizations.of(context)!.additional_cost}: ${additionalCost.toStringAsFixed(0)} د.ع';
                  }
                  message +=
                      '\n${AppLocalizations.of(context)!.total_amount}: ${totalAmount.toStringAsFixed(0)} د.ع';

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: const Color(0xFF20c997),
                      duration: const Duration(seconds: 4),
                    ),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF20c997), // Teal
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              AppLocalizations.of(context)!.finish_service,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      case BookingStatus.confirmed:
        return const SizedBox.shrink(); // لا تظهر أي أزرار للحجوزات المكتملة
      case BookingStatus.cancelled:
        return const SizedBox.shrink(); // لا تظهر أي أزرار للحجوزات الملغية
    }
  }

  // Status chip now uses shared widget

  // legacy dialog methods removed; unified ConfirmationDialog is used instead
}

// Models
class BookingModel {
  final String id;
  final String clientName;
  final String clientPhone;
  final String service;
  final String date;
  final String time;
  final String price;
  final BookingStatus status;
  final String clientAddress;
  final double? latitude;
  final double? longitude;
  final String notes;
  final List<String>? images;
  final String? cancellationReason;

  BookingModel({
    required this.id,
    required this.clientName,
    required this.clientPhone,
    required this.service,
    required this.date,
    required this.time,
    required this.price,
    required this.status,
    required this.clientAddress,
    this.latitude,
    this.longitude,
    required this.notes,
    this.images,
    this.cancellationReason,
  });
}

// BookingStatus moved to domain/entities/booking_status.dart
