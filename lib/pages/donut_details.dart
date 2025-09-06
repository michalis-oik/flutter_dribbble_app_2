import 'package:dribbble_app_2/utils/CaloriesBox.dart';
import 'package:flutter/material.dart';

class DonutDetails extends StatelessWidget {
  const DonutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 178, 122, 191), Color.fromARGB(255, 202, 161, 205)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [ 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_back, color: Colors.grey[800], size: 30),
                        const Spacer(),
                        Icon(Icons.favorite_border, color: Colors.grey[800], size: 30),
                      ],
                    ),
                    //const SizedBox(height: 20),
                    Center(
                      child: Image.asset('lib/assets/images/donut2.png', width: 250, height: 200),
                    ),
                    //const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '4.5',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 8),
                        Text(
                          '(50 reviews)',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        'Cream-Filled',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Vanilla-Sprinkle',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      children: const [
                        Expanded(child: Caloriesbox(title: 'Calories', value: '300')),
                        SizedBox(width: 10), // Explicit spacing
                        Expanded(child: Caloriesbox(title: 'Fat', value: '25%')),
                        SizedBox(width: 10), // Explicit spacing
                        Expanded(child: Caloriesbox(title: 'Salt', value: '3%')),
                        SizedBox(width: 10), // Explicit spacing
                        Expanded(child: Caloriesbox(title: 'Sugars', value: '16g')),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}