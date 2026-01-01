import 'package:flutter/material.dart';
class custom_text extends StatelessWidget {
  const custom_text({super.key,
    required this.text,
    this.color,
     this.size,
     this.fontWeight});

  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;


  @override
  Widget build(BuildContext context) {
    return  Text(
        text ,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontWeight: fontWeight,
        ),
    );
  }
}
