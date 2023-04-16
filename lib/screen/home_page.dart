import 'package:googleapis/calendar/v3.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../screen/google_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleSignIn? _googleSignIn;
  List<Event>? _events;

  @override
  void initState() {
    super.initState();
    _googleSignIn = GoogleSignIn(
      //serverClientId: '117886159421114254775',
      scopes: [
        //'email',
        'https://www.googleapis.com/auth/calendar.events.readonly',
      ],
    );
    _getUser();
  }
  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn?.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _getUser() async {
    final user = await _googleSignIn?.signIn();
    final events = await CalendarService.getEvents(user);
    setState(() {
      _events = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Calendar Events'),
      ),
      body: ListView.builder(
        itemCount: _events?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final event = _events?[index];
          return event == null
              ? Center(
            child: CircularProgressIndicator(),
          ): ListTile(
            title: Text(event.summary ?? ''),
            subtitle: Text(event.start?.dateTime?.toLocal().toString() ?? ''),
          );
        },
      ),
    );
  }
}

