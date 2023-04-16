// import 'package:flutter/material.dart';
// import 'package:flutter_googlecalendar/flutter_googlecalendar.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:googleapis/calendar/v3.dart';
//
// class CalendarService {
//   late final GoogleCalendar calendarClient;
//   late final GoogleSignIn googleSignIn;
//
//   CalendarService() {
//     calendarClient = GoogleCalendar();
//     googleSignIn = GoogleSignIn.standard(scopes: [CalendarApi.calendarScope]);
//   }
//
//   Future<void> signIn() async {
//     await googleSignIn.signIn();
//     await calendarClient.signIn(googleSignIn.currentUser!);
//   }
//
//   Future<List<Event>> getAllEvents() async {
//     // Fetch all events from the user's primary calendar
//     final events = await calendarClient.getEvents(DateTime.now().subtract(Duration(days: 365)), DateTime.now(), calendarId: 'primary');
//     return events.items;
//   }
// }
//
// class EventsPage extends StatefulWidget {
//   const EventsPage({Key? key}) : super(key: key);
//
//   @override
//   _EventsPageState createState() => _EventsPageState();
// }
//
// class _EventsPageState extends State<EventsPage> {
//   final CalendarService _calendarService = CalendarService();
//   List<Event> _events = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadEvents();
//   }
//
//   Future<void> _loadEvents() async {
//     await _calendarService.signIn();
//     final events = await _calendarService.getAllEvents();
//     setState(() {
//       _events = events;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Events'),
//       ),
//       body: _events.isNotEmpty
//           ? ListView(
//         children: _events
//             .map((event) => ListTile(
//           title: Text(event.summary ?? ''),
//           subtitle: Text(
//               '${event.start?.dateTime} - ${event.end?.dateTime}'),
//         ))
//             .toList(),
//       )
//           : Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
