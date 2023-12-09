import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

Future<List<DateTime?>?> showCalendarDialog(
    BuildContext context, {DateTime? lastDate}) async {
  return await showCalendarDatePicker2Dialog(
    context: context,
    config: CalendarDatePicker2WithActionButtonsConfig(
      calendarType: CalendarDatePicker2Type.range,
      buttonPadding: const EdgeInsets.all(16),
      lastDate: lastDate ?? DateTime.now(),
    ),
    dialogSize: const Size(325, 400),
    borderRadius: BorderRadius.circular(16),
    dialogBackgroundColor: Colors.white,
  );
}
