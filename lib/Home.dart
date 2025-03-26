import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _digitado = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preferencias")),
      body: Container(
        child: Column(
          children: [
            Text(""),
            TextField(
              decoration: InputDecoration(label: Text("Digite algo")),
              controller: _digitado,
            ),
            TextButton(onPressed: () {}, child: Text("salvar")),
            TextButton(onPressed: () {}, child: Text("ler")),
          ],
        ),
      ),
    );
  }
}
