import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({Key? key}) : super(key: key);

  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _register() async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    context.push('/');
  } catch (e) {
    context.push('/registro');
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
                  'Les comarques de la comunitat Registro',
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
                    _register();
                  },
                  child: const Text("Registar"),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () {
                    context.push("/");
                  },
                  child: const Text("Iniciar sesión"),
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