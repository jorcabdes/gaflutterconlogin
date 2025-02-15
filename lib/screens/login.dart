import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navegar a la pantalla principal
      context.push("/provincias");
      // Aquí puedes redirigir al usuario a otra pantalla
    } catch (e) {
      context.push("/registro");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
      appBar: AppBar(
              title: const Text(
                'Comarcas',
              ),
              centerTitle: false, // Esto centrará el título en la AppBar
          ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/img/web-movil-02.png',width: 100,height: 200),
                const SizedBox(height: 16.0),
                Text(
                  'Les comarques de la comunitat',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const SizedBox(height: 120.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
                
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            // spacer
            const SizedBox(height: 12.0),
           TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    _login();
                  },
                  child: const Text("Iniciar"),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () {
                    context.push("/register");
                  },
                  child: const Text("Registro"),
                ),
                TextButton(
                  onPressed: () {
                    context.push("/register");
                  },
                  child: const Text("Iniciar con Google"),
                ),
              ],
            ),
          ],
        ),
      ),
    )
    );
  }
}