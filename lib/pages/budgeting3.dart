import 'package:flutter/material.dart';
import 'budgeting2.dart';
import 'custom_bordered_progress_bar.dart' as custom_bar;
import 'budgeting4.dart';

class Budgeting3Page extends StatefulWidget {
  final String name;

  const Budgeting3Page({Key? key, required this.name}) : super(key: key);

  @override
  _Budgeting3PageState createState() => _Budgeting3PageState();
}

class _Budgeting3PageState extends State<Budgeting3Page> {
  // Options to drag
  final List<String> options = [
    'Salary 💵',
    'Food 🍔',
    'Gift Money 🎁',
    'Shopping 🛍️',
    'Rent 🏠',
    'Side Hustle 🚀',
  ];

  // Track if an option is currently being dragged
  bool isDragging = false;

  // Map to track where each option is dropped
  Map<String, String?> droppedOn = {
    'Salary 💵': null,
    'Food 🍔': null,
    'Gift Money 🎁': null,
    'Shopping 🛍️': null,
    'Rent 🏠': null,
    'Side Hustle 🚀': null,
  };

  // Lists to hold dropped options for each container
  List<String> incomeDropped = [];
  List<String> expensesDropped = [];

  // Correct answers mapping
  final Map<String, String> correctAnswers = {
    'Salary 💵': 'Income',
    'Food 🍔': 'Expenses',
    'Gift Money 🎁': 'Income',
    'Shopping 🛍️': 'Expenses',
    'Rent 🏠': 'Expenses',
    'Side Hustle 🚀': 'Income',
  };

  // Feedback message
  String feedbackMessage = '';

  void checkAnswer() {
    bool allAnswered = droppedOn.values.every((element) => element != null);
    if (!allAnswered) {
      setState(() {
        feedbackMessage = 'Please drag all options to a container.';
      });
      return;
    }

    bool allCorrect = true;
    droppedOn.forEach((option, container) {
      if (container != correctAnswers[option]) {
        allCorrect = false;
      }
    });

    setState(() {
      feedbackMessage = allCorrect ? 'Correct! 🎉' : 'Wrong. try again,';
    });
  }

  void checkSingleAnswer(String option, String container) {
    bool isCorrect = false;
    if (correctAnswers.containsKey(option)) {
      if (correctAnswers[option] == container) {
        isCorrect = true;
      }
    }
    setState(() {
      feedbackMessage = isCorrect ? 'Correct! 🎉' : 'Wrong. try again,';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text('Drag the income sources and expenses '),
        backgroundColor: Colors.green[100],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: custom_bar.CustomBorderedProgressBar(
              progress: 0.15,
              width: 280,
              height: 8,
              borderColor: Colors.green[900]!,
              backgroundColor: Colors.grey[300]!,
              progressColor: Colors.orange,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Left side: draggable options
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          options.map((option) {
                            return Draggable<String>(
                              data: option,
                              onDragStarted: () {
                                setState(() {
                                  isDragging = true;
                                });
                              },
                              onDragEnd: (details) {
                                setState(() {
                                  isDragging = false;
                                });
                              },
                              maxSimultaneousDrags: isDragging ? 0 : 1,
                              feedback: Material(
                                color: Colors.transparent,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.green[700],
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    option,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              childWhenDragging: Container(
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  option,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.green[700],
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  option,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                  ),
                  // Right side: drop targets
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Center container - Income
                        DragTarget<String>(
                          onAccept: (data) {
                            if (correctAnswers[data] == 'Income') {
                              setState(() {
                                droppedOn[data] = 'Income';
                                if (!incomeDropped.contains(data)) {
                                  incomeDropped.add(data);
                                }
                                checkSingleAnswer(data, 'Income');
                              });
                            } else {
                              setState(() {
                                feedbackMessage = 'Wrong. try again,';
                              });
                            }
                          },
                          builder: (context, candidateData, rejectedData) {
                            return Container(
                              padding: const EdgeInsets.all(8),
                              height: 160,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.green[600],
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.green[900]!,
                                  width: 3,
                                ),
                              ),
                              alignment: Alignment.topCenter,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Income 💰',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  ...incomeDropped.map(
                                    (item) => Container(
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 2,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.green[500],
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        // Bottom container - Expenses
                        DragTarget<String>(
                          onAccept: (data) {
                            if (correctAnswers[data] == 'Expenses') {
                              setState(() {
                                droppedOn[data] = 'Expenses';
                                if (!expensesDropped.contains(data)) {
                                  expensesDropped.add(data);
                                }
                                checkSingleAnswer(data, 'Expenses');
                              });
                            } else {
                              setState(() {
                                feedbackMessage = 'Wrong. try again,';
                              });
                            }
                          },
                          builder: (context, candidateData, rejectedData) {
                            return Container(
                              padding: const EdgeInsets.all(8),
                              height: 160,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.green[600],
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.green[900]!,
                                  width: 3,
                                ),
                              ),
                              alignment: Alignment.topCenter,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Expenses 💸',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  ...expensesDropped.map(
                                    (item) => Container(
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 2,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.green[500],
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: const Color.fromARGB(255, 185, 242, 187),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              feedbackMessage,
              style: TextStyle(
                fontSize: 20,
                color:
                    feedbackMessage == 'Correct! 🎉'
                        ? Colors.green
                        : Colors.red,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 120,
              height: 48,
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
                      builder: (context) => Budgeting4(name: widget.name),
                    ),
                  );
                },
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
