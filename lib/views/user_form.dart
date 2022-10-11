// ignore_for_file: unrelated_type_equality_checks

import 'package:contato/modelo/usuario.dart';
import 'package:contato/provider/users.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Usuario? usuario) {
    if (usuario != null) {
      _formData['id'] = usuario.id!;
      _formData['nome'] = usuario.nome!;
      _formData['numero'] = usuario.numero!;
      _formData['foto'] = usuario.foto!;
    }
  }
  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
  return OutlineInputBorder( //Outline border type for TextFeild
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(
        color:Color.fromARGB(255, 82, 151, 255),
        width: 3,
      )
  );
}

OutlineInputBorder myfocusborder(){
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(
        color:Colors.greenAccent,
        width: 3,
      )
  );
}

  @override
  Widget build(BuildContext context) {
    final usuario = ModalRoute.of(context)?.settings.arguments as Usuario?;

    _loadFormData(usuario);

    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar Contato"),
        actions: <Widget>[
           IconButton(
                icon: Icon(Icons.call),
                color: Color.fromARGB(255, 17, 17, 17),
                onPressed: () {
                
                }),
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState?.save();
                Provider.of<Users>(context, listen: false).put(Usuario(
                  id: _formData['id'],
                  nome: _formData['nome'],
                  numero: _formData['numero'],
                  foto: _formData['foto'],
                ));
                Navigator.of(context).pop();
              })
        ],
      ),
      body: Padding(
        
        padding: EdgeInsets.all(15),
        child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _formData['nome'],
                  decoration: InputDecoration(labelText: 'Nome', prefixIcon: const Icon(Icons.person_add), border: myinputborder(), enabledBorder: myinputborder(),focusedBorder: myfocusborder(),
                  ),
                  onSaved: (value) => _formData['nome'] = value!,
                ),
                TextFormField(
                  initialValue: _formData['numero'],
                  decoration: InputDecoration(labelText: 'Número',  prefixIcon: const Icon(Icons.numbers), border: myinputborder(), enabledBorder: myinputborder(),focusedBorder: myfocusborder(),),
                  onSaved: (value) => _formData['numero'] = value!,
                ),
                TextFormField(
                  initialValue: _formData['foto'],
                  decoration: InputDecoration(labelText: 'Foto',  prefixIcon: const Icon(Icons.image), border: myinputborder(), enabledBorder: myinputborder(),focusedBorder: myfocusborder(),),
                  onSaved: (value) => _formData['foto'] = value!,
                ),
              ],
            )),
      ),
    );
  }
}
