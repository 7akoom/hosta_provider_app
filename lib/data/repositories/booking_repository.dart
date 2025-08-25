import 'package:dio/dio.dart';
import 'package:hosta_provider/data/datasources/api_service.dart';
import 'package:hosta_provider/data/endpoints/bookings_endpoints.dart';
import 'package:hosta_provider/data/models/booking_model.dart';

class BookingRepository {
  final ApiService _api;

  BookingRepository(this._api);

  Future<List<BookingDto>> fetchBookings({
    int page = 1,
    int pageSize = 20,
  }) async {
    final Response res = await _api.get(
      BookingsEndpoints.bookings,
      queryParameters: {'page': page, 'page_size': pageSize},
    );
    final data = res.data;
    final List list = (data is Map && data['data'] is List)
        ? data['data']
        : (data as List? ?? []);
    return list
        .map((e) => BookingDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<BookingDto> fetchBookingById(String id) async {
    final Response res = await _api.get(BookingsEndpoints.bookingById(id));
    final data = (res.data is Map && res.data['data'] != null)
        ? res.data['data']
        : res.data;
    return BookingDto.fromJson(Map<String, dynamic>.from(data as Map));
  }

  Future<void> acceptBooking(String id) async {
    await _api.post(BookingsEndpoints.accept(id));
  }

  Future<void> rejectBooking(String id, {String? reason}) async {
    await _api.post(BookingsEndpoints.reject(id), data: {'reason': reason});
  }

  Future<void> startService(String id) async {
    await _api.post(BookingsEndpoints.start(id));
  }

  Future<void> endService(String id) async {
    await _api.post(BookingsEndpoints.end(id));
  }
}






