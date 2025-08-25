class WorkingHoursModel {
  final int dayOfWeek; // 1 = Monday, 7 = Sunday
  final String dayName;
  final bool isWorkingDay;
  final String? startTime; // Format: "HH:mm"
  final String? endTime; // Format: "HH:mm"

  WorkingHoursModel({
    required this.dayOfWeek,
    required this.dayName,
    required this.isWorkingDay,
    this.startTime,
    this.endTime,
  });

  factory WorkingHoursModel.fromJson(Map<String, dynamic> json) {
    return WorkingHoursModel(
      dayOfWeek: json['day_of_week'] ?? 1,
      dayName: json['day_name'] ?? '',
      isWorkingDay: json['is_working_day'] ?? false,
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day_of_week': dayOfWeek,
      'day_name': dayName,
      'is_working_day': isWorkingDay,
      'start_time': startTime,
      'end_time': endTime,
    };
  }

  WorkingHoursModel copyWith({
    int? dayOfWeek,
    String? dayName,
    bool? isWorkingDay,
    String? startTime,
    String? endTime,
  }) {
    return WorkingHoursModel(
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      dayName: dayName ?? this.dayName,
      isWorkingDay: isWorkingDay ?? this.isWorkingDay,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  @override
  String toString() {
    if (!isWorkingDay) {
      return '$dayName: إجازة';
    }
    return '$dayName: $startTime - $endTime';
  }
}


