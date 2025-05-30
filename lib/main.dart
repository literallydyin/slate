import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/first_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Welcome from Slate',
            style: GoogleFonts.manrope(fontSize: 30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Input Box
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ), // Slightly curved edges
                  borderSide: const BorderSide(
                    color: Colors.green,
                  ), // Green border
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.green, width: 2.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0), // Space between input box and button
            // Submit Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[400], // Green button
                padding: const EdgeInsets.symmetric(
                  horizontal: 23.0,
                  vertical: 15.0,
                ), // Larger button size
              ),
              onPressed: () {
                final name = _nameController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstPage(name: name),
                  ),
                );
              },
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.black, // Black text color
                  fontWeight: FontWeight.bold, // Bold text
                  fontSize: 20, // Larger font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
