import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _valorSalvo = "nada salvooo";

  TextEditingController _digitado = TextEditingController();

  _salver() async {
    String _valorDigitado = _digitado.text;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("nome", _valorDigitado);

    print(_valorDigitado);
  }

  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _valorSalvo = prefs.getString("nome") ?? "nenhum valor salvo";
    });
  }

  _remover() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("nome");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preferencias")),
      body: Container(
        child: Column(
          children: [
            Text(_valorSalvo),
            TextField(
              decoration: InputDecoration(label: Text("Digite algo")),
              controller: _digitado,
            ),
            TextButton(
              onPressed: () {
                _salver();
              },
              child: Text("salvar"),
            ),
            TextButton(
              onPressed: () {
                _recuperar();
              },
              child: Text("recuperar"),
            ),
            TextButton(
              onPressed: () {
                _remover();
              },
              child: Text("remover"),
            ),
          ],
        ),
      ),
    );
  }
}
