import 'dart:io';

import 'package:flutter/material.dart';
import 'package:istoria_romaniei/data/continut/strings_text_content.dart';
import 'package:istoria_romaniei/data/epoca.dart';
import 'package:istoria_romaniei/data/continut/liste.dart';
import 'package:istoria_romaniei/data/continut/strings.dart';
import 'package:istoria_romaniei/meniu.dart';
import 'package:istoria_romaniei/data/continut/culori.dart';
import 'package:istoria_romaniei/lectii.dart';
import 'package:istoria_romaniei/services/crudOperations.dart';
import 'package:istoria_romaniei/ui/cont.dart';
import 'package:istoria_romaniei/services/ads.dart';

const String APP_ID = 'ca-app-pub-7342631777280181~1472905836';
const String BANNER_COD = 'ca-app-pub-7342631777280181/5620814650';
crudMedthods crud = new crudMedthods();

String lectie;

class Citeste extends StatefulWidget {
  List<Epoca> lista;

  Citeste(this.lista);

  @override
  _Citeste createState() => _Citeste();
}

class _Citeste extends State<Citeste> {

  @override
  void initState() {
    super.initState();
    Ads.init(APP_ID, testing: true);

  }

  @override
  void dispose() {
    Ads.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    lectie = widget.lista[1].nume;
    return Scaffold(
      body: Container(
        color: Culori.verde,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.lista.length,
          itemBuilder: (context, position) {
            return CustomListItem(
              nume: widget.lista[position].nume,
              description: widget.lista[position].description,
              image: widget.lista[position].image,
              length: widget.lista.length,
              position: position,
              lectie: widget.lista[0].nume,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Culori.movDeschis,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('Cont'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Învață'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Badges'),
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Culori.galben,
        onTap: _onBottomNavigationBarTap,
      ),
    );
  }

  void _onBottomNavigationBarTap(int position) {
    switch (position) {
      case 0:
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) => Cont()));
    }
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.nume,
    this.position,
    this.description,
    this.image,
    this.length,
    this.lectie,
  });

  final String nume;
  final int position;
  final String description;
  final Image image;
  final int length;
  final String lectie;
  @override
  Widget build(BuildContext context) {
    if (position == (length - 1)) {
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(24),
            child: image,
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              nume,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Culori.alb,
                fontSize: 18.0,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w900,
              ),
            ),
            alignment: Alignment.topCenter,
          ),
          RaisedButton(onPressed: (){_complete(lectie);}, child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[Text('Complet'), Icon(Icons.check_circle_outline)],),),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Culori.alb,
                fontSize: 18.0,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          FlatButton(onPressed: null, child: Text('Test'),),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(24),
            child: Text(
              nume,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Culori.alb,
                fontSize: 24.0,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w900,
              ),
            ),
            alignment: Alignment.topCenter,
          ),
          image,
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Culori.alb,
                fontSize: 16.0,
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      );
    }
  }
}

_complete(String lectie) {
switch (lectie) {
  case (StringsTextContent.e1_l1_1_titlu):
    {
      crud.setData({"e1_l1": 1}).then((result) {
        debugPrint("setat lectia e1 l1 ca si completa");
      }).catchError((e) {
        print(e);
      }); break;
    }
  case (StringsTextContent.e1_l2_1_titlu):
    {
      crud.setData({"e1_l2": 1}).then((result) {
        debugPrint("setat lectia e1 l2 ca si completa");
      }).catchError((e) {
        print(e);
      }); break;
    }
  case (StringsTextContent.e1_l3_1_titlu):
    {
      crud.setData({"e1_l3": 1}).then((result) {
        debugPrint("setat lectia e1 l3 ca si completa");
      }).catchError((e) {
        print(e);
      }); break;
    }
}
Ads.showFullScreenAd();
}
