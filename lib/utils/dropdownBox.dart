import 'package:flutter/material.dart';

class Dropdownbox extends StatelessWidget {
  final String title;
  
  const Dropdownbox({
    required this.title,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20.0), 
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey[800],
            size: 28,
          ),
        ],
      ),
    );
  }
}