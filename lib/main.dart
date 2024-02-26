import 'package:emailsenderfront/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:window_size/window_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getWindowInfo().then((PlatformWindow window) {
    if (window.screen != null) {
      setWindowMinSize(const Size(800, 800));
      setWindowFrame(
        Rect.fromCenter(
          center: window.screen!.visibleFrame.center,
          width: 800,
          height: 800,
        ),
      );
      setWindowMaxSize(Size.infinite);
      setWindowTitle('Email Sender');
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.ibmPlexMono().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const Homepage(),
    );
  }
}
