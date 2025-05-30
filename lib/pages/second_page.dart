import 'package:flutter/material.dart';
import 'budgeting1.dart';

class SecondPage extends StatelessWidget {
  final String name;

  const SecondPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Budgeting1(name: name),
                      ),
                    );
                  },
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.green[300] ?? Colors.green,
                        width: 2.0,
                      ),
                    ),
                    margin: const EdgeInsets.all(15),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Budgeting and Saving',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Manrope',
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Icon(
                                  Icons.savings,
                                  size: 50,
                                  color: Colors.green[800],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Icon(
                            Icons.calculate,
                            size: 40, // Increased size
                            color: Colors.green[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 30), // Increased spacing
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.blue[300] ?? Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  margin: const EdgeInsets.all(15),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Taxes',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Manrope',
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Center(
                                child: Icon(
                                  Icons.note,
                                  size: 50,
                                  color: Colors.blue[800],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 16,
                        right: 16,
                        child: Icon(
                          Icons.account_balance,
                          size: 40,
                          color: Colors.blue[800],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30), // Increased spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.red[300] ?? Colors.red,
                      width: 2.0,
                    ),
                  ),
                  margin: const EdgeInsets.all(15),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Credit and Debit card',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Icon(
                                Icons.credit_card,
                                size: 50,
                                color: Colors.red[800],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 50,
                        right: 16,
                        child: Icon(
                          Icons.wallet,
                          size: 40,
                          color: Colors.red[800],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 30),
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.yellow[200],
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.yellow[400] ?? Colors.yellow,
                      width: 2.0,
                    ),
                  ),
                  margin: const EdgeInsets.all(15),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Fiat Money vs Crypto',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Manrope',
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Icon(
                                  Icons.attach_money,
                                  size: 50,
                                  color: Colors.yellow[800],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: Icon(
                          Icons.currency_bitcoin,
                          size: 40,
                          color: Colors.yellow[800],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
