import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../custom_text.dart';

class CardItem extends StatelessWidget {
  final String title;
  final String value;
  final Color color1;
  final Color color2;
  final IconData icon;
  final VoidCallback onPressed ;

  const CardItem({
    Key key,
    this.title,
    this.value,
    this.color1,
    this.color2,
    this.icon, this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      style: ElevatedButton.styleFrom(
          primary: Color(0x2E6CF3), // background
          onPrimary: Colors.black,
          minimumSize: Size(300, 80) // foreground
          ),
      onPressed: onPressed,
      child: Row(
        children: [
          CustomText(
            text: title,
            size: 22,
            weight: FontWeight.bold,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
