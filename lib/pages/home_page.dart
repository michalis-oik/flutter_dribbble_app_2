import 'package:dribbble_app_2/utils/categoryBox.dart';
import 'package:dribbble_app_2/utils/donut_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final List<String> categories = [
    "All",
    "Basic",
    "Frosted",
    "Cream-filled",
    "Chocolate",
    "Other"
  ];
  int cartItemCount = 2;
  List<bool> isFavoritedList = List.generate(10, (index) => false);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section (fixed)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Column(
                  children: [
                    // Top row: Menu + Shopping bag
                    Row(
                      children: [
                        Icon(Icons.menu_rounded, color: Colors.grey[800], size: 30),
                        const Spacer(),
                        Stack(
                          children: [
                            Icon(Icons.shopping_bag_outlined, color: Colors.grey[800], size: 30),
                            if (cartItemCount > 0)
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.pink[300],
                                    shape: BoxShape.circle,
                                  ),
                                  constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                                  child: Text(
                                    '$cartItemCount',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Introduction Text
                    Center(
                      child: SizedBox(
                        width: 250,
                        child: const Text(
                          "We Offer Happiness In Circles",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 54, 53, 53),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Search Bar + Filter
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: const [
                                SizedBox(width: 10),
                                Icon(Icons.search, color: Colors.grey),
                                SizedBox(width: 10),
                                Text("Search for donut", style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.pink[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.filter_list, color: Colors.white),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // Horizontal Categories
                    SizedBox(
                      height: 30,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          return CategoryBox(
                            title: categories[index],
                            selected: selectedIndex == index,
                            onTap: () => setState(() => selectedIndex = index),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Donut Grid (scrollable)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ClipRect( // Clip vertically but allow horizontal overflow
                    child: GridView.builder(
                      clipBehavior: Clip.none,
                      itemCount: 10,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15, 
                        mainAxisSpacing: 15, 
                        childAspectRatio: 0.8, // Increased from 0.75 to give more vertical space
                      ),
                      itemBuilder: (context, index) {
                        return DonutCard(
                          title: "Donut $index",
                          subtitle: "Delicious ${index % 2 == 0 ? 'chocolate' : 'vanilla'} donut",
                          price: "\$${((index + 1) * 2.99).toStringAsFixed(2)}",
                          icon: Icons.circle,
                          isFavorited: isFavoritedList[index], // Pass state
                          onFavoritePressed: () => setState(() {
                            isFavoritedList[index] = !isFavoritedList[index];
                          }),
                          onTap: () => print("Tapped Donut $index"),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
