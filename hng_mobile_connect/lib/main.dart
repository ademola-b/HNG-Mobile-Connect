import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HNG Mobile Connect',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // URLs
  final String repoLink = "https://github.com/ademola-b/HNG-Mobile-Connect";
  final String hngBackLinks = "http://hng.tech/hire/mobile-ui-ux-developers";
  final String telex = "https://Telex.im";
  final String delve = "https://delve.fun";

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception("Can't launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HNG Mobile Connect"),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Welcome to HNG Mobile Connect!\n\n"
              "Explore our hiring opportunities and GitHub repository.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("Visit Github Repo", repoLink, Colors.blue),
                _buildButton(
                    "Mobile Backlink", hngBackLinks, Colors.deepPurple),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton("Visit Telex", telex, Colors.purple),
                _buildButton("Visit Delve", delve, Colors.indigo),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, String url, Color color) {
    return ElevatedButton(
      onPressed: () => _launchURL(url),
      style: ElevatedButton.styleFrom(
          backgroundColor: color, foregroundColor: Colors.white),
      child: Text(text),
    );
  }
}
