import 'package:dribbble_app_2/models/donut_model.dart'; // <-- 1. IMPORT THE MODEL
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
  int cartItemCount = 0;

  // Master List of all Donuts
  final List<Donut> _allDonuts = [
    Donut(title: "Glazed Ring", subtitle: "Classic, sweet, and simple.", price: "\$1.99", imagePath: "lib/assets/images/donut1.png", category: "Basic"),
    Donut(title: "Strawberry Frost", subtitle: "A fruity delight with sprinkles.", price: "\$2.49", imagePath: "lib/assets/images/donut2.png", category: "Frosted"),
    Donut(title: "Boston Kreme", subtitle: "Bavarian cream filling.", price: "\$2.99", imagePath: "lib/assets/images/donut3.png", category: "Cream-filled"),
    Donut(title: "Chocolate Glaze", subtitle: "For the chocolate lovers.", price: "\$2.49", imagePath: "lib/assets/images/donut4.png", category: "Chocolate"),
    Donut(title: "Cinnamon Twist", subtitle: "A warm, spiced treat.", price: "\$2.29", imagePath: "lib/assets/images/donut5.png", category: "Other"),
    Donut(title: "Blueberry Cake", subtitle: "A dense, flavorful cake donut.", price: "\$2.99", imagePath: "lib/assets/images/donut6.png", category: "Basic"),
    Donut(title: "Vanilla Sprinkle", subtitle: "Perfect for a celebration.", price: "\$2.49", imagePath: "lib/assets/images/donut7.png", category: "Frosted"),
    Donut(title: "Jelly Filled", subtitle: "Classic raspberry jelly.", price: "\$2.99", imagePath: "lib/assets/images/donut8.png", category: "Cream-filled"),
    Donut(title: "Double Chocolate", subtitle: "Chocolate on chocolate.", price: "\$2.99", imagePath: "lib/assets/images/donut9.png", category: "Chocolate"),
    Donut(title: "Maple Bar", subtitle: "A long john with maple icing.", price: "\$2.79", imagePath: "lib/assets/images/donut10.png", category: "Other"),
  ];

  // A list to hold all the displayed donuts
  List<Donut> _filteredDonuts = [];

  @override
  void initState() {
    super.initState();
    // Initially, show all donuts
    _filteredDonuts = _allDonuts;
  }

  // Filter Donuts
  void _filterDonuts() {
    setState(() {
      // Get the string of the selected category
      final selectedCategory = categories[selectedIndex];

      if (selectedCategory == "All") {
        _filteredDonuts = _allDonuts;
      } else {
        _filteredDonuts = _allDonuts
            .where((donut) => donut.category == selectedCategory)
            .toList();
      }
    });
  }


  void _addToCart() {
    setState(() {
      cartItemCount++;
    });
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.menu_rounded, color: Colors.grey[800], size: 30),
                        const Spacer(),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Icon(Icons.shopping_bag_outlined, color: Colors.grey[800], size: 30),
                            if (cartItemCount > 0)
                              Positioned(
                                right: -4,
                                top: -4,
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: Colors.pink[300],
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white, width: 1.5)
                                  ),
                                  constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
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
                    Center(
                      child: SizedBox(
                        width: 250,
                        child: const Text("We Offer Happiness In Circles", textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 54, 53, 53),),),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(color: Colors.pink[50], borderRadius: BorderRadius.circular(10),),
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
                          decoration: BoxDecoration(color: Colors.pink[300], borderRadius: BorderRadius.circular(10),),
                          child: const Icon(Icons.filter_list, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

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
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                                _filterDonuts(); // Filter the list when a category is tapped
                              });
                            },
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
                  child: ClipRect(
                    child: GridView.builder(
                      clipBehavior: Clip.none,
                      itemCount: _filteredDonuts.length, // Use the length of the filtered list
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10, 
                        mainAxisSpacing: 5, 
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        // Get the specific donut from the filtered list
                        final donut = _filteredDonuts[index];

                        return DonutCard(
                          // Pass properties from the donut model object
                          title: donut.title,
                          subtitle: donut.subtitle,
                          price: donut.price,
                          imagePath: donut.imagePath,
                          isFavorited: donut.isFavorited,
                          onFavoritePressed: () {
                            setState(() {
                              // Toggle the favorite status on the model itself
                              donut.isFavorited = !donut.isFavorited;
                            });
                          },
                          onTap: () => print("Tapped ${donut.title}"),
                          onAddToCartPressed: _addToCart,
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