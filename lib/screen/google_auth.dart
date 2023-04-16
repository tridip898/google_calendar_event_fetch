import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart';

class CalendarService {
  static Future<List<Event>> getEvents(GoogleSignInAccount? user) async {
    final headers = await user?.authHeaders ?? {};
    final httpHeaders = (headers['http_headers'] as Map?)?.cast<String, String>() ?? {};
    final client = http.Client();
    final accessCredentials = AccessCredentials(
      AccessToken(
        'Bearer',
        headers['Authorization'].toString().replaceFirst('Bearer ', ''),
        DateTime.now().toUtc().add(Duration(hours: 1)),
      ),
      null,
      ['https://www.googleapis.com/auth/calendar.events.readonly'],
    );
    final authClient = authenticatedClient(client, accessCredentials);

    final calendar = CalendarApi(authClient);
    final now = DateTime.now().toUtc();
    final endOfDay = DateTime(now.year, now.month, now.day, 23, 59, 59).toUtc();
    final events = await calendar.events.list(
      'tridip15-11898@diu.edu.bd',
      timeMin: DateTime.parse(now.toIso8601String()),
      timeMax: DateTime.parse(endOfDay.toIso8601String()),
      maxResults: 10,
      singleEvents: true
    );

    return events.items ?? [];

  }
}

// import 'package:googleapis/calendar/v3.dart';
// import 'package:googleapis_auth/googleapis_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// Future<List<Event>> fetchCalendarEvents(GoogleSignIn googleSignIn) async {
//   final authClient = await googleSignIn.currentUser?.authenticatedClient();
//   final calendar = CalendarApi(authClient);
//
//   final now = DateTime.now().toUtc();
//   final nextWeek = now.add(Duration(days: 7));
//
//   final events = await calendar.events.list(
//     'primary',
//     timeMin: now.toIso8601String(),
//     timeMax: nextWeek.toIso8601String(),
//   );
//
//   return events.items;
// }
