import 'package:flutter/foundation.dart';
import 'package:hosta_provider/data/models/booking_model.dart';
import 'package:hosta_provider/data/repositories/booking_repository.dart';

class BookingProvider extends ChangeNotifier {
  final BookingRepository _repository;

  BookingProvider(this._repository);

  bool _isLoading = false;
  String? _error;
  List<BookingDto> _bookings = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<BookingDto> get bookings => List.unmodifiable(_bookings);

  Future<void> loadBookings() async {
    _setLoading(true);
    try {
      _bookings = await _repository.fetchBookings();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _setLoading(false);
    }
  }

  Future<void> accept(String id) async {
    await _repository.acceptBooking(id);
    await loadBookings();
  }

  Future<void> reject(String id, {String? reason}) async {
    await _repository.rejectBooking(id, reason: reason);
    await loadBookings();
  }

  Future<void> start(String id) async {
    await _repository.startService(id);
    await loadBookings();
  }

  Future<void> end(String id) async {
    await _repository.endService(id);
    await loadBookings();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}






