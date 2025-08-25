class BookingsEndpoints {
  static const String bookings = '/bookings';
  static String bookingById(String id) => '/bookings/$id';
  static String accept(String id) => '/bookings/$id/accept';
  static String reject(String id) => '/bookings/$id/reject';
  static String start(String id) => '/bookings/$id/start';
  static String end(String id) => '/bookings/$id/end';
}






