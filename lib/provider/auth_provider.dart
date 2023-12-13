import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAuthProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  AuthType _authType = AuthType.signIn;

  AuthType get authType => _authType;

  setAuthType() {
    _authType =
        _authType == AuthType.signIn ? AuthType.signUp : AuthType.signIn;
  }

  // REGISTRAR UN USUARIO
  registrarUsuario(BuildContext context, String email, String password) async {
    try {
      if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Debes escribir una dirección de correo'),
          backgroundColor: Colors.red,
        ));
      }
      if (password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Debes escribir una contraseña'),
          backgroundColor: Colors.red,
        ));
      }
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('La contraseña es muy débil'),
          backgroundColor: Colors.red,
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Este correo ya existe'),
          backgroundColor: Colors.red,
        ));
      }
    } catch (e) {
      print(e);
    } finally {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Usuario registrado correctamente'),
        backgroundColor: Colors.lightGreen,
      ));
    }
    notifyListeners();
  }

// LOGUEAR USUARIO CON EMAIL/PASSWORD
  loguearUsuario(BuildContext context, String email, String password) async {
    try {
      if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Debes introducir una direccion de correo'),
          backgroundColor: Colors.red,
        ));
      }
      if (password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Debes introducir una contraseña'),
          backgroundColor: Colors.red,
        ));
      }
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Usuario o contraseña incorrecta'),
          backgroundColor: Colors.red,
        ));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Usuario o contraseña incorrecta'),
          backgroundColor: Colors.red,
        ));
      }
      notifyListeners();
    }
  }

  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      print('Error al cerrar sesión: $e');
    }
    notifyListeners();
  }
}

enum AuthType { signUp, signIn }
