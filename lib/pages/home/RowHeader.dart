import 'package:flutter/material.dart';

class RowHeader extends StatelessWidget {
  const RowHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/logocdc.png',
          fit: BoxFit.contain,
          height: 260,
        ),
        Text(
            "La cour des comptes pilier de transparence et de responsabilisation   \n  dans l\'utilisation des fonds publics au service des citoyens.",
            maxLines: 2,
            //overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white)),
        Image.asset(
          'images/tunisflag.png',
          fit: BoxFit.contain,
          height: 300,
        ),
      ],
    );
  }
}