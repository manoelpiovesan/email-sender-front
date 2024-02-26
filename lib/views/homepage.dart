import 'package:emailsenderfront/views/lists/email_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            const Icon(Icons.email),
            const SizedBox(width: 10),
            Text(
              'EmailSender',
              style: TextStyle(
                fontFamily: GoogleFonts.ibmPlexMono().fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: const EmailList(),
    );
  }
}
