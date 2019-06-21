import 'package:flutter/material.dart';
import 'package:istoria_romaniei/data/epoca.dart';
import 'package:istoria_romaniei/data/continut/culori.dart';

class PageTest extends StatefulWidget {
  List<Epoca> lista;

  PageTest(this.lista);

  int currentPage = 0;


  @override
  _PageTest createState() => _PageTest();
}

class _PageTest extends State<PageTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(120, 90, 115, 1),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
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


//
//                          onTap: () =>
//                              _onTapItem(context, widget.lista[position]),

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
    );
  }

  _onTapItem(BuildContext context, Epoca lista) {
    debugPrint("da");
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.nume,
    this.position,
    this.lastItem,
  });

  final String nume;
  final int position;
  final int lastItem;

  @override
  Widget build(BuildContext context) {

    if (position != (lastItem - 1)) {
      return Padding(
        padding: EdgeInsets.all(0),
        child: Material(
            child: InkWell(
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
                      ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: Container(
                    height: 20,
                    color: Culori.galben,
                  ),),
                ],
              ),
            )),
      );
    } else return Container(
      margin: EdgeInsets.all(0),
      child: Image.asset("ciucur.png", alignment: Alignment.topCenter,),);
  }
}
