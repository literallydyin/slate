import 'package:flutter/material.dart'; // Import Flutter's material design package
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package for custom fonts

import 'first_page.dart'; // Import FirstPage for navigation

void main() {
  runApp(const MyApp()); // Entry point of the app, runs the MyApp widget
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  }); // Constructor with const for optimization, ensures immutability

  @override
  MyAppState createState() => MyAppState(); // Creates the state for the MyApp widget
}

class MyAppState extends State<MyApp> {
  // Controller for the TextField to manage user input
  final TextEditingController _nameController = TextEditingController();

  // Method to handle the submission of the name
  void _submitName() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FirstPage(), // Navigate to FirstPage
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner in the app
      home: Scaffold(
        backgroundColor:
            Colors.white, // Set the background color of the app to white
        body: Stack(
          children: [
            Align(
              alignment:
                  Alignment.topCenter, // Align the widget to the top center
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 80,
                ), // Add padding from the top
                child: Text(
                  "welcome, from slate", // Display a welcome message
                  style: GoogleFonts.manrope(
                    // Use a custom font for the text
                    fontSize: 30, // Set the font size
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center, // Align the widget to the center
              child: Padding(
                padding: const EdgeInsets.all(
                  16.0,
                ), // Add padding around the widget
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .center, // Center the children vertically
                  children: [
                    TextField(
                      controller:
                          _nameController, // Connect the TextField to the controller
                      decoration: InputDecoration(
                        labelText:
                            "Enter your name", // Placeholder text for the TextField
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12.0,
                          ), // Add rounded corners
                          borderSide: const BorderSide(
                            color:
                                Colors.green, // Set the border color to green
                            width: 2.0, // Set the border thickness
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12.0,
                          ), // Add rounded corners
                          borderSide: const BorderSide(
                            color:
                                Colors.green, // Set the border color to green
                            width: 2.0, // Set the border thickness
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            12.0,
                          ), // Add rounded corners
                          borderSide: const BorderSide(
                            color:
                                Colors.green, // Set the border color to green
                            width: 2.0, // Set the border thickness
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Add vertical spacing
                    ElevatedButton(
                      onPressed:
                          _submitName, // Call _submitName when the button is pressed
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors
                                .lightGreen, // Set the button background color
                        padding: const EdgeInsets.symmetric(
                          horizontal:
                              40.0, // Add horizontal padding for a larger button
                          vertical:
                              20.0, // Add vertical padding for a larger button
                        ),
                      ),
                      child: const Text(
                        "Submit", // Button text
                        style: TextStyle(
                          color: Colors.black, // Set the text color to black
                          fontWeight: FontWeight.bold, // Make the text bold
                          fontSize: 18.0, // Set the font size
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
