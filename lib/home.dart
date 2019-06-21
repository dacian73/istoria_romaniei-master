import 'dart:io';

import 'package:flutter/material.dart';
import 'package:istoria_romaniei/data/epoca.dart';
import 'package:istoria_romaniei/data/continut/liste.dart';
import 'package:istoria_romaniei/data/continut/strings.dart';
import 'package:istoria_romaniei/meniu.dart';
import 'package:istoria_romaniei/data/continut/culori.dart';
import 'package:istoria_romaniei/lectii.dart';
import 'package:istoria_romaniei/ui/cont.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:istoria_romaniei/services/ads.dart';




class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);



  String title = Strings.main_title;
  List<Epoca> lista = Liste.listaEpoci;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  backToMain() {
    setState(() {
      widget.lista = Liste.listaEpoci;
      widget.title = Strings.main_title;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Container(
        color: Culori.verde,
        child: ListView.builder(
          itemCount: widget.lista.length,
          itemBuilder: (context, position) {
            return CustomListItem(
              nume: widget.lista[position].nume,
              position: position,
              image: widget.lista[position].image,
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
      case 0: {
        Navigator.push(context,
            new MaterialPageRoute(builder: (BuildContext context) => Cont())); break;}
      case 1: {  break; }
    }
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({this.nume, this.position, this.image});

  final String nume;
  final int position;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Culori.mov,
        ),
        padding: EdgeInsets.all(0.0),
margin: EdgeInsets.fromLTRB(16, 4, 16, 4),
        height: 250,
        child: Row(
          children: <Widget>[
            ClipRRect(
                borderRadius: new BorderRadius.circular(12.0), child: image),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Column(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        _onPressInvata(nume, position, context);
                      },
                      child: Text(Strings.invata),
                      color: Culori.galben),
                ),
                Expanded(
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        debugPrint('abc');
                      },
                      child: Text(Strings.test),
                      color: Culori.galben),
                ),
                Expanded(
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {
                        debugPrint('abc');
                      },
                      child: Text(Strings.share),
                      color: Culori.galben),
                ),
              ],
            ),),),
          ],
        ),

    );
  }

  void _onPressInvata(String title, int position, BuildContext context) {

    List<Epoca> lista;
    switch (position) {
      case 0: {
        lista = Liste.listaLectiiE1;
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Lectie(lista, title)));
      } break;
      case 1: {
        lista = Liste.listaLectiiE2;
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Lectie(lista, title)));
      } break;
      case 2: {
        lista = Liste.listaLectiiE3;
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Lectie(lista, title)));
      } break;
      case 3: {
        lista = Liste.listaLectiiE4;
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Lectie(lista, title)));
      } break;
      case 4: {
        lista = Liste.listaLectiiE5;
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Lectie(lista, title)));
      } break;
      case 5: {
        lista = Liste.listaLectiiE6;
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Lectie(lista, title)));
      } break;
      case 6: {
        lista = Liste.listaLectiiE7;
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Lectie(lista, title)));
      } break;
      case 7: {
        lista = Liste.listaLectiiE8;
        Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Lectie(lista, title)));
      } break;
    }


  }

}
