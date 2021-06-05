import 'package:ecommerce_admin_tut/data_table/data_table.dart';
import 'package:ecommerce_admin_tut/widgets/page_header.dart';
import 'package:flutter/material.dart';

class FinancielManagmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Center(
            child: PageHeader(
              text: "Financiel Managment Page",
            ),
          ),
        ),
        Container(
            color: Colors.black, child: DataTableScreen())
      ],
    );
  }
}
