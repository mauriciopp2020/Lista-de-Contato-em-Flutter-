import 'package:contato/dummy_usuario.dart';
import 'package:contato/modelo/usuario.dart';
import 'package:contato/provider/users.dart';
import 'package:contato/routes/app_routes.dart';
import 'package:contato/widget/usuario_tilte.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:group_list_view/group_list_view.dart';

import 'package:provider/provider.dart';

class UsuarioLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users usuario = Provider.of(context);
  
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add_circle_sharp),
                color: Color.fromARGB(255, 248, 250, 248),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.User_Form);
                }),
           
          ],
          title: Text("Contatos  "),
        ),
  
       drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network('https://www.cest.edu.br/novosite2020/wp-content/uploads/2020/12/Logo_CEST-500x354-1.png',
                  width: 80,
                  height: 80,),
                  SizedBox(height: 15,),
                  Text("Usuário Cest",
                  style: TextStyle(color: Color.fromARGB(255, 12, 12, 12)),)
                ],
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 62, 155, 231),
              ),
            ),
             ListTile(
              leading: Icon(Icons.person,color: Colors.black,),
              title: Text('Total de Contatos                             '+usuario.count.toString()),
             
            ),
            ListTile(
              leading: Icon(Icons.group,color: Colors.black,),
              title: Text('Grupos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.group_work,color: Colors.black),
              title: Text('Gerenciar Contatos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.delete,color: Colors.black),
              title: Text('lixeira'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
             
          ],
        ),
        
       ),
       
        body: ListView.builder(
        
         itemCount: usuario.count,
          itemBuilder: ((ctx, i) => UserTitle(usuario.byIndex(i))),
        ));
        
  }
}



