import 'package:dribbble_app_2/utils/categoryBox.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;
  final List<String> categories = ["All", "Basic", "Frosted", "Cream-filled", "Chocolate", "Other"];
  int cartItemCount = 2; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
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
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                child: Column(
                  children: [
                    // Top row
                    Row(
                      children: [
                        Icon(
                          Icons.menu_rounded,
                          color: Colors.grey[800],
                          size: 30,
                        ),
                        const Spacer(),
                        // Shopping bag with badge
                        Stack(
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.grey[800],
                              size: 30,
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                //padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.pink[300],
                                  shape: BoxShape.circle,
                                ),
                                constraints: BoxConstraints(
                                  minWidth: 16,
                                  minHeight: 16,
                                ),
                                child: Text(
                                  '$cartItemCount',
                                  style: TextStyle(
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

                    // Introduction Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 250,
                          child: Text(
                            "We Offer Happiness In Circles",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 54, 53, 53),
                            ),
                          ),
                        ),
                      ],
                    ), 

                    const SizedBox(height: 30),

                    // Search Bar row
                    Row(
                      children: [
                        //Spacer(),
                        Container(
                          width: 300,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Search for donut",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.pink[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.filter_list,
                            color: Colors.white,
                          ),
                        ),
                      ]
                    ),

                    const SizedBox(height: 30),

                    // Horizontal Layout for categories
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
                              });
                            },
                          );
                        },
                      ),
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
