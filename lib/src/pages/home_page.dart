import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {

    return FutureBuilder(
      future: menuProvider.cargaData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
        
        //print(snapshot.data);

        return ListView(
         children: _listaItems(snapshot.data, context),
        );


      },
      );
  }

  List<Widget> _listaItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> opciones = [];
    if(data != null){
      data.forEach((opc) {
      final widgetTemp = ListTile(
        title: Text(opc['texto']),
        leading: getIcon(opc['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
        onTap: (){
          Navigator.pushNamed(context, opc['ruta']);
          /*
          final route = MaterialPageRoute(
            builder: (context){
              return AlertPage();
            }
            );
          Navigator.push(context, route);
          */
        },
        );

        opciones..add(widgetTemp)
                ..add(Divider());

     });
    }
    
     return opciones;
  }

}