import 'package:flutter/material.dart';

class DonutCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imagePath;
  final bool isFavorited;
  final VoidCallback onFavoritePressed;
  final VoidCallback onTap;
  final VoidCallback onAddToCartPressed;

  const DonutCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imagePath,
    required this.isFavorited,
    required this.onFavoritePressed,
    required this.onTap,
    required this.onAddToCartPressed,
  });

  @override
  State<DonutCard> createState() => _DonutCardState();
}

class _DonutCardState extends State<DonutCard> with SingleTickerProviderStateMixin {
  double _scale = 1.0;
  late AnimationController _cartController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _cartController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: _cartController,
        curve: Curves.elasticOut,
      ),
    );
    
    _colorAnimation = ColorTween(
      begin: Colors.pink[300],
      end: Colors.green,
    ).animate(
      CurvedAnimation(
        parent: _cartController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _cartController.dispose();
    super.dispose();
  }

  void _onTapDown(_) => setState(() => _scale = 1.1);
  void _onTapUp(_) => setState(() => _scale = 1.0);

  void _toggleFavorite() {
    widget.onFavoritePressed();
  }

  void _animateCart() {
    _cartController.forward().then((_) {
      _cartController.reverse();
    });
    widget.onAddToCartPressed();
    print('Add to cart button pressed for ${widget.title}');
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
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        widget.imagePath,
                        height: 60,
                        width: 80,
                      ),
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey[800],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        widget.price,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom left - Favorite
              Positioned(
                left: 15,
                bottom: 15,
                child: GestureDetector(
                  onTap: _toggleFavorite,
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 200),
                    crossFadeState: widget.isFavorited
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    firstChild: Icon(Icons.favorite_border, size: 20, color: Colors.grey[600]),
                    secondChild: Icon(Icons.favorite, size: 20, color: Colors.pink[300]),
                  ),
                ),
              ),

              // Bottom right - Add to cart
              Positioned(
                right: 15,
                bottom: 15,
                child: GestureDetector(
                  onTap: _animateCart,
                  behavior: HitTestBehavior.opaque,
                  child: AnimatedBuilder(
                    animation: _cartController,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Icon(
                          Icons.add_shopping_cart,
                          size: 20,
                          color: _colorAnimation.value,
                        ),
                      );
                    },
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