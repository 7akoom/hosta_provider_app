import 'package:hosta_provider/domain/entities/booking_status.dart';

class BookingDto {
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

  BookingDto({
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

  factory BookingDto.fromJson(Map<String, dynamic> json) {
    return BookingDto(
      id: json['id']?.toString() ?? '',
      clientName: json['client_name'] ?? json['clientName'] ?? '',
      clientPhone: json['client_phone'] ?? json['clientPhone'] ?? '',
      service: json['service'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      price: (json['price'] ?? '').toString(),
      status: _parseStatus(json['status']),
      clientAddress: json['client_address'] ?? json['clientAddress'] ?? '',
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      notes: json['notes'] ?? '',
      images: (json['images'] as List?)?.map((e) => e.toString()).toList(),
      cancellationReason:
          json['cancellation_reason'] ?? json['cancellationReason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'client_name': clientName,
      'client_phone': clientPhone,
      'service': service,
      'date': date,
      'time': time,
      'price': price,
      'status': status.name,
      'client_address': clientAddress,
      'latitude': latitude,
      'longitude': longitude,
      'notes': notes,
      'images': images,
      'cancellation_reason': cancellationReason,
    };
  }

  static BookingStatus _parseStatus(dynamic value) {
    final str = value?.toString().toLowerCase() ?? '';
    switch (str) {
      case 'confirmed':
      case 'completed':
        return BookingStatus.confirmed;
      case 'pending':
        return BookingStatus.pending;
      case 'accepted':
        return BookingStatus.accepted;
      case 'in_progress':
      case 'inprogress':
      case 'in-progress':
        return BookingStatus.inProgress;
      case 'cancelled':
      case 'canceled':
        return BookingStatus.cancelled;
      default:
        return BookingStatus.pending;
    }
  }
}
