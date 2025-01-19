import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final bool isActionSelected;
  final VoidCallback onPressed;

  const CustomFloatingActionButton({
    Key? key,
    required this.isActionSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: FloatingActionButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        backgroundColor: Color.fromRGBO(14, 61, 180, 1),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (Widget add_icon, Animation<double> animation) {

            return ScaleTransition(
              scale: animation,
              child: add_icon,
            );
          },
          child: isActionSelected
              ? Transform.rotate(
            angle: -0.5, // Rotate the icon
            key: ValueKey<int>(1),
            child: Image.asset(
              'lib/assets/add.png',  // Your image asset path
              width: 30, // Set the width of the image
              height: 30, // Set the height of the image
              fit: BoxFit.cover,
              color: Colors.white,// Ensure the image fits inside the bounds
            ),
          )
              : Transform.rotate(
            angle: 0, // Rotate the image in the opposite direction
            key: ValueKey<int>(2),
            child: Image.asset(
              'lib/assets/add.png',  // Your image asset path
              width: 30, // Set the width of the image
              height: 30, // Set the height of the image
              fit: BoxFit.cover,
              color: Colors.white,// Ensure the image fits inside the bounds
            ),
          ),
        ),
      ),
    );
  }
}