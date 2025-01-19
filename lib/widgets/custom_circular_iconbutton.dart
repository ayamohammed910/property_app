import 'package:flutter/material.dart';

class CustomCircularIconButton extends StatelessWidget {
  final Widget icon; // Allow either Icon or Image as the icon
  final VoidCallback onPressed;
  final double size;
  final Color iconColor;
  final Color backgroundColor;

  // Constructor for the custom circular icon button
  CustomCircularIconButton({
    required this.icon,
    required this.onPressed,
    this.size = 40.0, // Default size of the button
    this.iconColor = Colors.white, // Default icon color
    this.backgroundColor = Colors.white, // Default background color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.all(8), // Padding inside the circle (adjust for size)
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor, // Background color of the circle
      ),
      child: IconButton(
        icon: icon, // This allows both Icon or Image widget
        onPressed: onPressed, // Action when button is pressed
      ),
    );
  }
}