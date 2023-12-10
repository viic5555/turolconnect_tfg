import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:turolconnect_tfg/pages/dashboard_page.dart';
import 'package:turolconnect_tfg/provider/auth_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyAuthProvider>(context);
    String _email = "";
    String _password = "";
    return Consumer<MyAuthProvider>(builder: (context, model, _) {
      return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                flexibleSpace: FlexibleSpaceBar(
                  title: Image.asset(
                    'assets/title1.png', // Ruta de tu imagen en el proyecto
                    height: 40, // Altura deseada
                  ),
                  centerTitle: true,
                ),
                backgroundColor: Colors.redAccent,
              ),
              body: Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        child: TextField(
                          decoration:
                              InputDecoration(prefixIcon: Icon(Icons.email)),
                          onChanged: (value) {
                            _email = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.password),
                          ),
                          obscureText: true,
                          onChanged: (value) {
                            _password = value;
                          },
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          provider.loguearUsuario(context, _email, _password);
                        },
                        child: const Text('Sign in'),
                      ),
                      TextButton(
                        child: const Text('Sign up'),
                        onPressed: () {
                          provider.registrarUsuario(context, _email, _password);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return DashboardPage();
          }
        },
      );
    });
  }
}
