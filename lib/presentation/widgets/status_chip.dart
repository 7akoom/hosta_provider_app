import 'package:flutter/material.dart';
import 'package:hosta_provider/domain/entities/booking_status.dart';
import 'package:hosta_provider/generated/app_localizations.dart';

class StatusChip extends StatelessWidget {
  final BookingStatus status;
  const StatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final color = _backgroundColor(status);
    final text = _text(context, status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Color _backgroundColor(BookingStatus status) {
    switch (status) {
      case BookingStatus.confirmed:
        return const Color(0xFF20c997);
      case BookingStatus.pending:
        return const Color(0xFFfd7e14);
      case BookingStatus.accepted:
        return const Color(0xFF28a745);
      case BookingStatus.inProgress:
        return const Color(0xFF007bff);
      case BookingStatus.cancelled:
        return const Color(0xFFdc3545);
    }
  }

  String _text(BuildContext context, BookingStatus status) {
    final l10n = AppLocalizations.of(context)!;
    switch (status) {
      case BookingStatus.confirmed:
        return l10n.completed;
      case BookingStatus.pending:
        return l10n.pending;
      case BookingStatus.accepted:
        return l10n.accepted;
      case BookingStatus.inProgress:
        return l10n.in_progress;
      case BookingStatus.cancelled:
        return l10n.cancelled;
    }
  }
}
