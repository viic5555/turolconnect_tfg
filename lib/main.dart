import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:turolconnect_tfg/pages/login_page.dart';
import 'package:turolconnect_tfg/pages/dashboard_page.dart';
import 'package:turolconnect_tfg/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:turolconnect_tfg/themes/custom_theme.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyAuthProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Turolconnect",
          theme: customTheme,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              // Si nos hemos registrado / logueado anteriormente
              if (snapshot.hasData) {
                // Directos a la página principal
                return DashboardPage();
                // si no
              } else {
                // Pasamos por la página del Login / Registro
                return const LoginPage();
              }
            },
          )),
    );
  }
}
