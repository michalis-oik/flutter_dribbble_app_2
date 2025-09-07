import 'package:dribbble_app_2/models/donut_model.dart';
import 'package:dribbble_app_2/utils/CaloriesBox.dart';
import 'package:dribbble_app_2/utils/dropdownBox.dart';
import 'package:flutter/material.dart';

class DonutDetails extends StatefulWidget {
  final Donut donut;
  final VoidCallback onFavoriteChanged;
  final VoidCallback onAddToCartPressed;

  const DonutDetails({
    super.key,
    required this.donut,
    required this.onFavoriteChanged,
    required this.onAddToCartPressed,
  });

  @override
  State<DonutDetails> createState() => _DonutDetailsState();
}

class _DonutDetailsState extends State<DonutDetails> {
  late bool _isFavorited;

  @override
  void initState() {
    super.initState();
    _isFavorited = widget.donut.isFavorited;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
    widget.onFavoriteChanged();
  }

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
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back, color: Colors.grey[800], size: 30),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: _toggleFavorite,
                      child: AnimatedCrossFade(
                        duration: const Duration(milliseconds: 200),
                        crossFadeState: _isFavorited ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                        firstChild: Icon(Icons.favorite_border, color: Colors.grey[800], size: 30),
                        secondChild: Icon(Icons.favorite, color: Colors.pink[300], size: 30),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Center(child: Image.asset(widget.donut.imagePath, width: 230, height: 180)),
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
                      const SizedBox(height: 10),
                      Center(child: Text(widget.donut.category, style: TextStyle(color: Colors.grey[800], fontSize: 28, fontWeight: FontWeight.bold))),
                      Center(child: Text(widget.donut.title, style: TextStyle(color: Colors.grey[800], fontSize: 20))),
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
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  children: [
                    Text(widget.donut.price, style: TextStyle(color: Colors.grey[800], fontSize: 24, fontWeight: FontWeight.bold)),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        // Call the function passed from HomePage
                        widget.onAddToCartPressed();

                        // Show a confirmation message to the user
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${widget.donut.title} added to cart!'),
                            duration: const Duration(seconds: 2),
                            backgroundColor: Colors.green[600],
                          ),
                        );
                      },
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