import 'package:dribbble_app_2/utils/CaloriesBox.dart';
import 'package:dribbble_app_2/utils/dropdownBox.dart';
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
          // This is the main layout Column that holds the three sections
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.grey[800], size: 30),
                    const Spacer(),
                    Icon(Icons.favorite_border, color: Colors.grey[800], size: 30),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  // We only need horizontal padding here now
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      // The content now starts with the image
                      Center(
                        child: Image.asset('lib/assets/images/donut2.png', width: 230, height: 180),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('4.5', style: TextStyle(color: Colors.grey[800], fontSize: 24, fontWeight: FontWeight.bold)),
                          const SizedBox(width: 8),
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(width: 8),
                          Text('(50 reviews)', style: TextStyle(color: Colors.grey[800], fontSize: 14)),
                        ],
                      ),
                      const SizedBox(height: 10), // A little extra space
                      Center(
                        child: Text('Cream-Filled', style: TextStyle(color: Colors.grey[800], fontSize: 28, fontWeight: FontWeight.bold)),
                      ),
                      Center(
                        child: Text('Vanilla-Sprinkle', style: TextStyle(color: Colors.grey[800], fontSize: 20)),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: const [
                          Expanded(child: Caloriesbox(title: 'Calories', value: '300')),
                          SizedBox(width: 10),
                          Expanded(child: Caloriesbox(title: 'Fat', value: '25%')),
                          SizedBox(width: 10),
                          Expanded(child: Caloriesbox(title: 'Salt', value: '3%')),
                          SizedBox(width: 10),
                          Expanded(child: Caloriesbox(title: 'Sugars', value: '16g')),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Dropdownbox(title: 'Ingredients'),
                      const SizedBox(height: 20),
                      Dropdownbox(title: 'Reviews(50)'),
                       const SizedBox(height: 20), // Padding at the end of the scroll
                    ],
                  ),
                ),
              ),

              Padding(
                //top 10 bottom 15
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  children: [
                    Text('\$3.99', style: TextStyle(color: Colors.grey[800], fontSize: 24, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[300],
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text('Add to Cart', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
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