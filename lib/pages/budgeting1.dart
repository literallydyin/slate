import 'package:flutter/material.dart';
import 'budgeting2.dart';

class CustomBorderedProgressBar extends StatelessWidget {
  final double progress;
  final double width;
  final double height;
  final Color borderColor;
  final Color backgroundColor;
  final Color progressColor;

  const CustomBorderedProgressBar({
    super.key,
    required this.progress,
    this.width = 280,
    this.height = 8, // Adjusted height
    this.borderColor = const Color(0xFF004d00), // dark green
    this.backgroundColor = const Color(0xFFD6D6D6), // light grey
    this.progressColor = Colors.orange,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _ProgressBarPainter(
        progress: progress,
        borderColor: borderColor,
        backgroundColor: backgroundColor,
        progressColor: progressColor,
      ),
    );
  }
}

class _ProgressBarPainter extends CustomPainter {
  final double progress;
  final Color borderColor;
  final Color backgroundColor;
  final Color progressColor;

  _ProgressBarPainter({
    required this.progress,
    required this.borderColor,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final borderPaint =
        Paint()
          ..color = borderColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;

    final backgroundPaint =
        Paint()
          ..color = backgroundColor
          ..style = PaintingStyle.fill;

    final progressPaint =
        Paint()
          ..color = progressColor
          ..style = PaintingStyle.fill;

    // Draw border
    final borderRect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRRect(
      RRect.fromRectAndRadius(borderRect, Radius.circular(4)), // Curved corners
      borderPaint,
    );

    // Draw background inside border
    final backgroundRect = Rect.fromLTWH(1, 1, size.width - 2, size.height - 2);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        backgroundRect,
        Radius.circular(4),
      ), // Curved corners
      backgroundPaint,
    );

    // Draw progress bar inside background
    final progressWidth = (size.width - 3) * progress.clamp(0.0, 1.0);
    final progressRect = Rect.fromLTWH(1, 1, progressWidth, size.height - 3);
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        progressRect,
        Radius.circular(4),
      ), // Curved corners
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _ProgressBarPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.borderColor != borderColor ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.progressColor != progressColor;
  }
}

class Budgeting1 extends StatefulWidget {
  final String name;

  const Budgeting1({super.key, required this.name});

  @override
  State<Budgeting1> createState() => _Budgeting1State();
}

class _Budgeting1State extends State<Budgeting1> {
  double progress = 0.0; // Progress set to zero

  bool investIt = false;
  bool saveHalfSpendHalf = false;
  bool spendAllOnShopping = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[100],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: CustomBorderedProgressBar(
                        progress: progress,
                        width: 280,
                        height: 8, // Adjusted height
                        borderColor: Colors.green[900]!,
                        backgroundColor: Colors.grey[300]!,
                        progressColor: Colors.orange,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      height: 200, // Adjusted height
                      alignment: Alignment.center, // Center alignment
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 185, 242, 187),
                        borderRadius: BorderRadius.circular(
                          7,
                        ), // Increased curvature
                        border: Border.all(color: Colors.green[900]!, width: 2),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(24.0), // Increased padding
                        child: Text(
                          'Hey there! Let’s talk about Budgeting & Saving- but first, a quick Question',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center, // Center the text
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        '❓What would you do if you got ₹1000 today?',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    CheckboxListTile(
                      title: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            const TextSpan(text: 'Invest it! '),
                            TextSpan(
                              text: '📈',
                              style: TextStyle(color: Colors.green[700]),
                            ),
                          ],
                        ),
                      ),
                      value: investIt,
                      onChanged: (bool? value) {
                        setState(() {
                          investIt = value ?? false;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            const TextSpan(text: 'Save half, spend half! '),
                            TextSpan(
                              text: '💰',
                              style: TextStyle(color: Colors.amber[700]),
                            ),
                          ],
                        ),
                      ),
                      value: saveHalfSpendHalf,
                      onChanged: (bool? value) {
                        setState(() {
                          saveHalfSpendHalf = value ?? false;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            const TextSpan(text: 'Spend it all on shopping! '),
                            TextSpan(
                              text: '🛍️',
                              style: TextStyle(color: Colors.pink[700]),
                            ),
                          ],
                        ),
                      ),
                      value: spendAllOnShopping,
                      onChanged: (bool? value) {
                        setState(() {
                          spendAllOnShopping = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SizedBox(
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
                      builder: (context) => Budgeting2Page(name: widget.name),
                    ),
                  );
                },
                child: const Text(
                  'Next',
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
