import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback? onTap;

  const CategoryBox({
    super.key,
    required this.title,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: selected ? Colors.pink[300] : Colors.pink[50],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.pink[200]!,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: selected ? Colors.white : Colors.grey[800],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
