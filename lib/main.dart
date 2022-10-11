import 'package:contato/provider/users.dart';
import 'package:contato/routes/app_routes.dart';
import 'package:contato/views/user_form.dart';
import 'package:contato/views/usuario_lista.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     final ThemeData tema = ThemeData(
      brightness: Brightness.dark,
    );
 
    return ChangeNotifierProvider(
      create: (ctx) => Users(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: tema.copyWith(
        colorScheme: tema.colorScheme.copyWith(
         
        ),
      ),
        routes: {
          AppRoutes.Home: (_) => UsuarioLista(),
          AppRoutes.User_Form: (_) => UserForm()
        },
      ),
    );
  }
}
