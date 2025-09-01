import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class DonutCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String price;
  final IconData icon;
  final VoidCallback onTap;

  const DonutCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.icon,
    required this.onTap,
  });

  @override
  State<DonutCard> createState() => _DonutCardState();
}

class _DonutCardState extends State<DonutCard> {
  double _scale = 1.0;
  bool _isFavorited = false;

  void _onTapDown(_) => setState(() => _scale = 1.1);
  void _onTapUp(_) => setState(() => _scale = 1.0);

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
    print('Favorite ${_isFavorited ? 'added' : 'removed'} for ${widget.title}');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () => setState(() => _scale = 1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(128),
                blurRadius: 5,
                offset: const Offset(3, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Main content
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(widget.icon, size: 50, color: Colors.pink[300]),
                    const SizedBox(height: 10),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      maxLines: 2, // Limit to 2 lines
                      overflow: TextOverflow.ellipsis, // Show ellipsis
                      textAlign: TextAlign.center, // Center align
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Bottom left button - Favorite with toggle
              Positioned(
                left: 12,
                bottom: 12,
                child: GestureDetector(
                  onTap: _toggleFavorite,
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 200),
                    crossFadeState: _isFavorited ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    firstChild: Icon(Icons.favorite_border, size: 22, color: Colors.grey[600]),
                    secondChild: Icon(Icons.favorite, size: 22, color: Colors.pink[300]),
                  ),
                ),
              ),
              
              // Bottom right button - Add to cart
              Positioned(
                right: 12,
                bottom: 12,
                child: GestureDetector(
                  onTap: () {
                    print('Add to cart button pressed for ${widget.title}');
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Icon(Icons.add_shopping_cart, size: 22, color: Colors.pink[300]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}