import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class kalenderPage extends StatelessWidget {
  const kalenderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00f1f1f1),
        title: Text('Kalender'),
      ),
      body: SfCalendar(
        view: CalendarView.month,
        // dataSource: MeetingDataSource(getAppointments()),
      ),
    );
  }
}
