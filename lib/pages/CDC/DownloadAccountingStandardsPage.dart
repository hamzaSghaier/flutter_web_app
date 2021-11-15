import 'package:ecommerce_admin_tut/widgets/custom_text.dart';
import 'package:ecommerce_admin_tut/widgets/page_header.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class DownloadAccountingStandardsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Center(
              child: PageHeader(
                text: "Télécharger Normes Comptables",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DownloadCard45(),
              DownloadCard41(),
              DownloadCard32(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DownloadCardB(),
            ],
          ),
        ],
      ),
    );
  }
}

class DownloadCardB extends StatelessWidget {
  const DownloadCardB({
    Key key,
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
        color: Colors.redAccent,
        elevation: 10,
        child: Container(
          margin: EdgeInsets.all(50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(height: 10),
              CustomText(
                text: "Balance ",
                size: 30,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class DownloadCard41 extends StatelessWidget {
  const DownloadCard41({
    Key key,
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
        color: Colors.blueAccent,
        elevation: 10,
        child: Container(
          margin: EdgeInsets.all(50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomText(
                text: "Norme comptable 41 ",
                size: 30,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
              CustomText(
                text: "-Etats financier ",
                size: 25,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
              CustomText(
                text: "-Tableau d'eclaircissement ",
                size: 25,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
              CustomText(
                text: "-Tableau d'utilisarion de subventions ",
                size: 25,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DownloadCard32 extends StatelessWidget {
  const DownloadCard32({
    Key key,
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
        color: Colors.greenAccent,
        elevation: 10,
        child: Container(
          margin: EdgeInsets.all(50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomText(
                text: "Norme comptable 32 ",
                size: 30,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
              CustomText(
                text: "-Etats financier ",
                size: 25,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
              CustomText(
                text: "-Tableau d'eclaircissement ",
                size: 25,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
              CustomText(
                text: "-Tableau d'utilisarion de subventions ",
                size: 25,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DownloadCard45 extends StatelessWidget {
  const DownloadCard45({
    Key key,
  }) : super(key: key);
  void downloadFile(String url) {
    html.AnchorElement anchorElement = new html.AnchorElement(href: url);
    anchorElement.download = url;
    anchorElement.click();
  }

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
        color: Colors.pink,
        elevation: 10,
        child: Container(
          margin: EdgeInsets.all(50),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CustomText(
                text: "Norme comptable 45 ",
                size: 30,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
              RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: "-Etats financier ",
                      style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              // RichText(
              //  text :  "-Etats financier ",
              //   style: TextStyle(
              //       fontSize: 25,
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold),
              // ),
              // CustomText(
              //   text: "-Etats financier ",
              //   size: 25,
              //   weight: FontWeight.bold,
              //   color: Colors.white,
              // ),
              CustomText(
                text: "-Tableau d'eclaircissement ",
                size: 25,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
              CustomText(
                text: "-Tableau d'utilisarion de subventions ",
                size: 25,
                weight: FontWeight.bold,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
