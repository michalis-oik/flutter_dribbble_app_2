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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_back, color: Colors.grey[800], size: 30),
                        const Spacer(),
                        Icon(Icons.favorite_border, color: Colors.grey[800], size: 30),
                      ],
                    ),
                    SizedBox(height: 20),

                    //show donut image big
                    Center(
                      child: Image.asset('lib/assets/images/donut2.png', width: 300, height: 300),
                    ),
                    //SizedBox(height: 10),

                    //review row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, 
                      spacing: 10,
                      children: [
                        Text(
                          '4.5',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Icon(Icons.star, color: Colors.amber), 
                        Text(
                          '(50 reviews)',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14,
                          ), 
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    //donut type
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

                    
                    //donut name
                    Center(
                      child: Text(
                        'Vanilla-Sprinkle',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    //horizontal layout
                    


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