import 'package:flutter/material.dart';
import 'dart:async';
import 'about_contact_page.dart';

class AboutPage extends StatefulWidget {
  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/company.jpg',
              fit: BoxFit.cover,
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text("公司介绍"),
            ),
            Divider(
              height: 0.0,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("公司优势"),
            ),
            Divider(
              height: 0.0,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.not_interested),
              title: Text("公司介绍"),
              onTap: () {
                Navigator.of(context).pushReplacementNamed("complay_info");
              },
            ),
            Divider(
              height: 0.0,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("联系我们"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => AboutContactPage()));
              },
            ),
            Divider(
              height: 0.0,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
