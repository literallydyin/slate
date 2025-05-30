import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'second_page.dart';

class FirstPage extends StatelessWidget {
  final String name;

  const FirstPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'hello, $name',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Manrope',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 200,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 170, 243, 173),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.green,
                        minimumSize: const Size(200, 60),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondPage(name: name),
                          ),
                        );
                      },
                      child: const Text(
                        'Start Learning',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20, // Position the icon 20 pixels from the bottom
            right: 20, // Position the icon 20 pixels from the right
            child: Row(
              children: [
                Text(
                  'Understand Money, Finally',
                  style: GoogleFonts.roboto(
                    fontSize: 20, // Smaller font size
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8), // Add spacing between text and icon
                Icon(
                  Icons.attach_money, // Money icon
                  size: 40, // Icon size
                  color: Colors.green, // Icon color
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
