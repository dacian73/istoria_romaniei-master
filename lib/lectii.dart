
import 'package:flutter/material.dart';
import 'package:istoria_romaniei/data/continut/liste.dart';
import 'package:istoria_romaniei/data/continut/culori.dart';
import 'package:istoria_romaniei/data/epoca.dart';
import 'package:istoria_romaniei/data/continut/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:istoria_romaniei/services/crudOperations.dart';
import 'package:istoria_romaniei/ui/citeste.dart';
import 'package:istoria_romaniei/data/LectieContentProvider.dart';




class Lectie extends StatefulWidget {
  List<Epoca> lista;
  String title;

  Lectie(this.lista, this.title);

  int currentPage = 0;
  int complet = 0;


  @override
  _Lectie createState() => _Lectie();
}

class _Lectie extends State<Lectie> {

  @override
  Widget build(BuildContext context) {


 updateFromFirebase(widget.lista);

    return Material(child: Container(
      color: Color.fromRGBO(120, 90, 115, 1),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(2, 22, 2, 2),
        child: Hero(
          tag: 'titluHero',
          child: Text(
      widget.title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'Comfortaa',
            fontWeight: FontWeight.w900,
            fontSize: 24,
            color: Colors.white),
      ),),),
              Container(
                child: Image.asset("p1.png"),
                padding: EdgeInsets.fromLTRB(30, 50, 0, 0),
              ),
              Container(
                child: Image.asset("p2.png"),
                padding: EdgeInsets.fromLTRB(20, 60, 0, 0),
              ),
              Expanded(child: Image.asset("p3.png")),
            ],
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: widget.lista.length,
                itemBuilder: (context, position) {
                  return CustomListItem(
                    nume: widget.lista[position].nume,
                    position: position,
                    lastItem: widget.lista.length,
                    epocaTitlu: widget.title,
                    complet: widget.lista[position].complet,
                  );
                },
              ),
            ),
          ),
          Container(
            width: 30,
          ),
        ],
      ),
    ),);
  }

  updateFromFirebase(List<Epoca> lista) async {
    DocumentSnapshot documentSnapshot = await crud.getData();
    switch (lista[0].nume){
      case Strings.e1_l1:{
        lista[0].complet = documentSnapshot.data['e1_l1'];
        lista[1].complet = documentSnapshot.data['e1_l2'];
        lista[2].complet = documentSnapshot.data['e1_l3'];
        lista[3].complet = documentSnapshot.data['e1_l4'];
        lista[4].complet = documentSnapshot.data['e1_l5'];
        lista[5].complet = documentSnapshot.data['e1_l6'];
        lista[6].complet = documentSnapshot.data['e1_l7'];
        break;
      }
      case Strings.e2_l1:{
        lista[0].complet = documentSnapshot.data['e2_l1'];
        lista[1].complet = documentSnapshot.data['e2_l2'];
        lista[2].complet = documentSnapshot.data['e2_l3'];
        lista[3].complet = documentSnapshot.data['e2_l4'];
        lista[4].complet = documentSnapshot.data['e2_l5'];
        lista[5].complet = documentSnapshot.data['e2_l6'];
        lista[6].complet = documentSnapshot.data['e2_l7'];
        lista[7].complet = documentSnapshot.data['e2_l7'];
        break;
      }

    }

     setState(() {
      widget.lista = lista;
     });
  }
}

class CustomListItem extends StatelessWidget {
  
  
  const CustomListItem({
    this.nume,
    this.position,
    this.lastItem,
    this.epocaTitlu,
    this.complet,
  });

  final String nume;
  final int position;
  final int lastItem;
  final String epocaTitlu;
  final int complet;

  @override
  Widget build(BuildContext context) {

    Icon iconComplet = Icon(Icons.remove_circle_outline, color: Culori.galben,);
    String stringComplet = Strings.incomplet;
    if (complet == 1) {
      stringComplet = Strings.complet;
      iconComplet = Icon(Icons.check_circle, color: Culori.galben,);
    }


    if (position != (lastItem - 1)) {
      return Padding(
        padding: EdgeInsets.all(0),
        child: Material(
            child: InkWell(
              onTap: () {

                Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      Citeste(getContinutLectie(position, epocaTitlu))));
              },
          child: Container(
            color: Culori.verde,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 80,
                  width: 200,
                  color: Culori.verde,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 30, 8, 0),
                    child: Text(
                      nume,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: Column(
                        children: <Widget>[

                            iconComplet,


                          Text(stringComplet + complet.toString(), style: TextStyle(color: Culori.alb),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Culori.galben,
                          ),
                          Text(Strings.test, style: TextStyle(color: Culori.alb),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Culori.galben,
                          ),
                          Text(Strings.print, style: TextStyle(color: Culori.alb),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(2, 2, 2, 2),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Culori.galben,
                          ),
                          Text(Strings.share, style: TextStyle(color: Culori.alb),),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    height: 20,
                    color: Culori.galben,
                  ),
                ),
              ],
            ),
          ),
        )),
      );
    } else
      return Container(
        margin: EdgeInsets.all(0),
        child: Image.asset(
          "ciucur.png",
          alignment: Alignment.topCenter,
        ),
      );
  }
}