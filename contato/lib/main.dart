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
 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Users(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
        ),
        routes: {
          AppRoutes.Home: (_) => UsuarioLista(),
          AppRoutes.User_Form: (_) => UserForm()
        },
      ),
    );
  }
}
