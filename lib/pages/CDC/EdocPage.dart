import 'package:ecommerce_admin_tut/widgets/page_header.dart';
import 'package:flutter/material.dart';

class EdocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Center(
          child: PageHeader(
            text: "EdocPage",
          ),
        ),
        ),
      ],
    );
  }
}