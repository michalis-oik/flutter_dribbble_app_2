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
  late Color _cardColor; 

  // State for the "add to cart" icon animation
  late AnimationController _cartController;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  static final Color _defaultColor = Colors.purple[100]!;
  static final Color _tappedColor = Colors.pink[200]!;

  @override
  void initState() {
    super.initState();
    // Initialize the card color to its default state
    _cardColor = _defaultColor;

    _cartController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _cartController, curve: Curves.elasticOut),
    );
    
    _colorAnimation = ColorTween(begin: Colors.pink[300], end: Colors.green)
        .animate(CurvedAnimation(parent: _cartController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _cartController.dispose();
    super.dispose();
  }

  void _onTapDown(_) {
    setState(() {
      _scale = 1.1;
      _cardColor = _tappedColor; // Change to tapped color
    });
  }

  void _onTapUp(_) {
    setState(() {
      _scale = 1.0;
      _cardColor = _defaultColor; // Change back to default color
    });
  }

  void _onTapCancel() {
     setState(() {
      _scale = 1.0;
      _cardColor = _defaultColor; // Also reset on cancel
    });
  }

  void _toggleFavorite() {
    widget.onFavoritePressed();
  }

  void _animateCart() {
    _cartController.forward().then((_) {
      _cartController.reverse();
    });
    widget.onAddToCartPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut, // Add a curve
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _cardColor, 
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