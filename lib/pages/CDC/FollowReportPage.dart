import 'package:ecommerce_admin_tut/widgets/custom_text.dart';
import 'package:ecommerce_admin_tut/widgets/page_header.dart';
import 'package:flutter/material.dart';

class FollowReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Center(
            child: PageHeader(
              text: "Suivi rapports (E-doc)",
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            EDocCard(
              annee: '2019',
              backcolor: Colors.white70,
            ),
            EDocCard(
              annee: '2020',
              backcolor: Colors.white70,
            ),
            EDocCard(
              annee: '2021',
              backcolor: Colors.green.shade100,
            ),
          ],
        ),
      ],
    );
  }
}

class EDocCard extends StatelessWidget {
  final String annee;
  final Color backcolor;
  const EDocCard({
    Key key,
    @required this.annee,
    @required this.backcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      height: 400,
      width: 400,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: backcolor,
        elevation: 50,
        child: Container(
          margin: EdgeInsets.all(50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomText(
                text: "Rapport ",
                size: 30,
                weight: FontWeight.bold,
                color: Colors.black,
              ),
              CustomText(
                text: "Année : $annee ",
                size: 25,
                weight: FontWeight.bold,
                color: Colors.black,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'images/edoc.png',
                  fit: BoxFit.contain,
                  height: 120,
                ),
              ),
              Text(
                "Voir Plus",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              // CustomText(
              //   text: "Voir Plus",
              //   size: 25,
              //   weight: FontWeight.bold,

              //   color: Colors.blueAccent,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
