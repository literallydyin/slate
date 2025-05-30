import 'package:flutter/material.dart';
import 'custom_bordered_progress_bar.dart' as custom_bar;
import 'budgeting9.dart';

class Budgeting8 extends StatefulWidget {
  final Color backgroundColor;

  const Budgeting8({Key? key, this.backgroundColor = Colors.white})
    : super(key: key);

  @override
  State<Budgeting8> createState() => _Budgeting8State();
}

class _Budgeting8State extends State<Budgeting8>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      appBar: AppBar(
        backgroundColor: widget.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            custom_bar.CustomBorderedProgressBar(
              progress: 1.0,
              width: double.infinity,
              height: 8,
              borderColor: Colors.green[900]!,
              backgroundColor: Colors.grey[300]!,
              progressColor: Colors.orange,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: FadeTransition(
                opacity: _animation,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: [
                    _buildInfoContainer(
                      '50% Needs\n(₹5,000) – Rent, groceries, bills—aka the “keep life running” fund.',
                      '🏠',
                    ),
                    _buildInfoContainer(
                      '30% Wants\n(₹3,000) – Fun money! Shopping, movies, that latte you swear you need.',
                      '🎉',
                    ),
                    _buildInfoContainer(
                      '20% Savings\n(₹2,000) – Future-you’s golden ticket! Save, invest, or clear debts.',
                      '💰',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 160,
              height: 40,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.celebration, color: Colors.white),
                label: const Text(
                  'Finish Lesson',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  softWrap: false,
                  overflow: TextOverflow.visible,
                ),
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
                      builder:
                          (context) => Budgeting9(
                            backgroundColor: widget.backgroundColor,
                          ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoContainer(String text, String emoji) {
    return Container(
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
