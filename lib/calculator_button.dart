import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget
{
  // declaring variables
  final color;
  final textColor;
  final String? buttonText ;
  final double? fontsize;
  final buttontapped;

  //Constructor
  CalculatorButton({this.color, this.textColor, this.buttonText, this.buttontapped, this.fontsize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 90,
            height:90,
            color: color,
            child: Center(
              child: Text(
                buttonText ?? '',
                style: TextStyle(
                  color: textColor,
                  fontSize: fontsize ?? 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Oswald'
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}