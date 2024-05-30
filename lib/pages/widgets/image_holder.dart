import 'package:flutter/material.dart';

class ImageHolder extends StatelessWidget{
  final String imagePath;
  final double height;
  const ImageHolder({
    super.key,
    required this.imagePath,
    required this.height,
  });

  @override 
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset(
        imagePath,
        height: height,
        ),
    );
  }
}