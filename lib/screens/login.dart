import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            // spacer
            const SizedBox(height: 12.0),
           TextField(
              decoration: const InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    context.push("/provincias");
                  },
                  child: const Text("Iniciar"),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () {
                    context.push("/provincias");
                  },
                  child: const Text("Registro"),
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