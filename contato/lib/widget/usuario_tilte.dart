import 'package:contato/modelo/usuario.dart';
import 'package:contato/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../routes/app_routes.dart';

class UserTitle extends StatelessWidget {
  final Usuario usuario;
  const UserTitle(this.usuario);
  @override
  Widget build(BuildContext context) {
    final foto = usuario.foto == null || usuario.foto!.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(usuario.foto!));
    return ListTile(
      leading: foto,
      title: Text(usuario.nome!),
      subtitle: Text(usuario.numero!),
      trailing: Container(
        width: 120,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.call),
              color: Color.fromARGB(255, 6, 228, 6),
              onPressed: () {
                
              },
            ),
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.User_Form,
                  arguments: usuario,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete_outline),
              color: Colors.red,
              onPressed: () {
                Provider.of<Users>(context, listen: false).remove(usuario);
              },
            ),
          ],
        ),
      ),
    );
  }
}
