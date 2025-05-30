import 'package:flutter/material.dart';
import 'budgeting1.dart' as budgeting1;
import 'budgeting3.dart';
import 'custom_bordered_progress_bar.dart' as custom_bar;
import 'budgeting3.dart';

class Budgeting2Page extends StatefulWidget {
  final String name;

  const Budgeting2Page({Key? key, required this.name}) : super(key: key);

  @override
  State<Budgeting2Page> createState() => _Budgeting2PageState();
}

class _Budgeting2PageState extends State<Budgeting2Page> {
  double progress = 0.1; // Small progress value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: custom_bar.CustomBorderedProgressBar(
              progress: progress,
              width: 280,
              height: 8,
              borderColor: Colors.green[900]!,
              backgroundColor: Colors.grey[300]!,
              progressColor: Colors.orange,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Container(
              height: 80, // Height for "What is a Budget?" container
              width: 360,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 185, 242, 187),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.green[900]!, width: 2),
              ),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  '💡 What is a Budget?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 340,
                height: 200, // Increased height to fill screen more
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 185, 242, 187),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.green[900]!, width: 2),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'A budget is just a plan for your money. Without a budget, money disappears like magic! 🎩✨',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SizedBox(
              width: 280,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[600],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // Navigate to Budgeting3Page on button press
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Budgeting3Page(name: widget.name),
                    ),
                  );
                },
                child: const Text(
                  '🛠 Drag & Drop Game',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
