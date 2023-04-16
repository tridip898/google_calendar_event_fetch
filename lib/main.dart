import 'package:flutter/material.dart';
import 'package:calender_data_gmail/screen/home_page.dart';
import './firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final _googleSignIn = GoogleSignIn(
//     scopes: [
//       'email',
//       calendar.CalendarApi.calendarReadonlyScope,
//     ],
//   );
//   late calendar.CalendarApi _calendarApi;
//   List<calendar.Event> _events = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _initCalendarApi();
//     _loadEvents();
//   }
//
//   Future<void> _initCalendarApi() async {
//     final account = await _googleSignIn.signIn();
//     final authHeaders = await account?.authHeaders;
//     calendar.CalendarApi()
//     _calendarApi = calendar.CalendarApi(
//       http.Client(),
//       rootUrl: 'https://www.googleapis.com',
//       headers: authHeaders,
//     );
//   }
//
//   Future<void> _loadEvents() async {
//     final events = await _calendarApi.events.list('<calendar_id>');
//     setState(() {
//       _events = events.items ?? [];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Calendar Demo'),
//       ),
//       body: _events.isEmpty
//           ? Center(child: CircularProgressIndicator())
//           : EventsList(events: _events),
//     );
//   }
// }
//
// class EventsList extends StatelessWidget {
//   final List<calendar.Event> events;
//
//   const EventsList({Key? key, required this.events}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: events.length,
//       itemBuilder: (BuildContext context, int index) {
//         final event = events[index];
//         final eventStart = event.start?.dateTime;
//         final eventEnd = event.end?.dateTime;
//         final dateFormatter = DateFormat('MMMM dd, yyyy');
//         final timeFormatter = DateFormat.jm();
//         return ListTile(
//           title: Text(event.summary ?? ''),
//           subtitle: Text('${dateFormatter.format(eventStart!)}\n'
//               '${timeFormatter.format(eventStart)} - ${timeFormatter.format(eventEnd!)}'),
//         );
//       },
//     );
//   }
// }
//
