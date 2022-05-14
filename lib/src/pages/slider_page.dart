import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valor = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _checkBox(),
            _checkSwitch(),
            Expanded(
              child: _crearImagen()
              ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      value: _valor,
      min: 10.0,
      max: 400.0,
     onChanged: _bloquearCheck ? null : (valor){
       setState(() {
         _valor = valor;
         print(valor);
       });
     }
     );
  }

  Widget _crearImagen() {
    return Image(
      width: _valor,
      height: _valor,
      fit: BoxFit.cover,
      image: NetworkImage('https://media-exp1.licdn.com/dms/image/C5603AQHZWHtBvDGHyw/profile-displayphoto-shrink_200_200/0/1606771784225?e=1632960000&v=beta&t=Kk5g4fM64vdkouxN3gCJZwH2Ml9BvJ83lb1Sw5CRGq8'),
      );
  }

  Widget _checkBox() {
    //Opcion 1
    /*
    return Checkbox(
      value: _bloquearCheck, 
      onChanged: (valor){
        setState(() {
           if(valor != null){
          _bloquearCheck = valor;
        }
        });
      }
      );*/
      return CheckboxListTile(
        title: Text('Bloquear Stile'),
        value: _bloquearCheck, 
        onChanged: (valor){
          setState(() {
            if(valor != null){
              _bloquearCheck = valor;
            }
          });
        }
        );
  }

  _checkSwitch() {
    return SwitchListTile(
        title: Text('Bloquear Stile'),
        value: _bloquearCheck, 
        onChanged: (valor){
          setState(() {
            if(valor != null){
              _bloquearCheck = valor;
            }
          });
        }
        );
  }
}