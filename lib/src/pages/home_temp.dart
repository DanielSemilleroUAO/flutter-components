import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _createItemsCorto(),
      ),
    );
  }

  List<Widget> _createItems(){

    List<Widget> lista = [];

    for (var opt in opciones) {
      
        final tempWidget = ListTile(
          title: Text(opt),
        );

        //Operadores en cascada
        lista..add(tempWidget)
             ..add(Divider());
        //lista.add(Divider());
    }

    return lista;
  }

  List<Widget> _createItemsCorto(){

    return opciones.map((item){
      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('CUALQUIER COSA'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();

  }


}