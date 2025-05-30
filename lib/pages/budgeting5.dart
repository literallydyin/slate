import 'package:flutter/material.dart';
import 'custom_bordered_progress_bar.dart' as custom_bar;
import 'budgeting6.dart';

class Budgeting5 extends StatelessWidget {
  final String name;

  const Budgeting5({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Center(
          child: custom_bar.CustomBorderedProgressBar(
            progress: 0.5,
            width: 280,
            height: 8,
            borderColor: Colors.green[900]!,
            backgroundColor: Colors.grey[300]!,
            progressColor: Colors.orange,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 80,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(
                255,
                185,
                242,
                187,
              ), // color from budgeting1.dart
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color.fromARGB(255, 0, 100, 0),
                width: 2,
              ), // dark green border
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  '📊 50/30/20 Rule',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 180,
            margin: const EdgeInsets.fromLTRB(16, 80, 16, 8),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 185, 242, 187),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color.fromARGB(255, 0, 100, 0),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'you just got ₹10,000—exciting, right? But before it disappears on food, shopping, and “just one more” order, let’s give it a plan💸',
                style: const TextStyle(
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black87,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 40.0),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Budgeting6(name: name),
                    ),
                  );
                },
                child: const Text(
                  'Quize and Budget!',
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
