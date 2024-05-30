import 'package:flutter/material.dart';

class MyRealButton extends StatelessWidget{
  
  final String text;
  final Function()? onTap;
  final Color color;
  final double borderRadius;
  final double width;
  final double height;

  const MyRealButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.width,
    required this.height,
    this.color = Colors.black,
    this.borderRadius = 15,
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}