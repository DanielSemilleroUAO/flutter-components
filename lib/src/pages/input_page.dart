import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {

  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionSelecionada = 'volar';

  List<String> _poderes = ['volar', 'Rayos x', 'Pecueca'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
      return TextField(
          //autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            counter: Text('Letras ${ _nombre.length }'),
            hintText: 'Nombre de la persona',
            helperText: 'Sólo es el nombre',
            suffixIcon: Icon(Icons.accessibility),
            icon: Icon(Icons.account_circle),
          ),
        onChanged: (valor){
          setState(() {
            _nombre = valor;
          });
          print(_nombre);
        },
      );
  }

  Widget _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            hintText: 'email',
            helperText: 'Email',
            suffixIcon: Icon(Icons.alternate_email),
            icon: Icon(Icons.email)
          ),
        onChanged: (valor){
          setState(() {
            _email = valor;
          });
          print(_email);
        },
      );
  }

  Widget _crearPassword() {
    return TextField(
        obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            hintText: 'Password',
            helperText: 'Password',
            suffixIcon: Icon(Icons.lock_open),
            icon: Icon(Icons.lock)
          ),
        onChanged: (valor){
          setState(() {
            _email = valor;
          });
          print(_email);
        },
      );
  }

  Widget _crearFecha(BuildContext context) {
     return TextField(
       enableInteractiveSelection: false,
       controller: _inputFieldDateController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            hintText: 'Fecha de nacimiento',
            helperText: 'Fecha de nacimiento',
            suffixIcon: Icon(Icons.perm_contact_cal),
            icon: Icon(Icons.calendar_today),
          ),
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
      );
  }


  _selectDate(BuildContext context) async {
    DateTime? picked =  await showDatePicker(
      context: context,
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(2018), 
      lastDate: new DateTime(2025)
      locale: Locale('es', 'ES'),
      ); 

      if(picked != null){
        setState(() {
          _fecha = picked.toString();
          _inputFieldDateController.text = _fecha;
        });
      }
  }

    Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es $_nombre'),
      subtitle: Text('Email: $_email'),
      leading: Text(_opcionSelecionada),
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropDown() {
    List<DropdownMenuItem<String>> lista = [];
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
        ));
    });
    return lista;
  }

  Widget _crearDropDown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        Expanded(
          child: DropdownButton(
            value: _opcionSelecionada,
            items: getOpcionesDropDown(),
            onChanged: (opt){
              setState(() {
                _opcionSelecionada = opt.toString();
              });
            },
          ),
        ),
      ],
    );
  }

 

}