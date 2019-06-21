import 'package:flutter/material.dart';
import 'package:istoria_romaniei/data/epoca.dart';
import 'package:istoria_romaniei/data/continut/liste.dart';
import 'package:istoria_romaniei/data/continut/strings.dart';
import 'package:istoria_romaniei/data/continut/culori.dart';

class MyMeniu extends StatefulWidget {
  MyMeniu({Key key}) : super(key: key);


  String title = Strings.main_title;
  List<Epoca> lista = Liste.listaEpoci;


  @override
  _MyMeniu createState() => _MyMeniu();
}

class _MyMeniu extends State<MyMeniu> {

  backToMain() {
    setState(() {
      widget.lista = Liste.listaEpoci;
      widget.title = Strings.main_title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  new CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: new FlexibleSpaceBar(
              background: Container(color: Culori.verde,),
            ),
          ),
          new SliverGrid(delegate: new SliverChildBuilderDelegate((context, position) =>
          new Container(
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              child: InkWell(
                  child: widget.lista[position].image,
                  onTap: () {

                  }
              ),

          ),
              childCount: widget.lista.length
          ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              crossAxisCount: 2),),
        ],
        ),


    );
  }}