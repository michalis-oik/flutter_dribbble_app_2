// lib/utils/CaloriesBox.dart

import 'package:flutter/material.dart';

class Caloriesbox extends StatelessWidget {
  final String title;
  final String value;

  const Caloriesbox({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    // REMOVED the fixed width from this Container
    return Container(
      height: 130, 
      // width: 90, // <--- REMOVED THIS LINE
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(128),
            blurRadius: 5,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center, // Good practice for wrapped text
              ),
            ),
            const Spacer(),
            Container(
              height: 50,
              // width: 90, // <--- ALSO REMOVED THIS LINE
              decoration: BoxDecoration(
                color: Colors.purple[200],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  value,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}