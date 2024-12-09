import 'package:flutter/material.dart';
import '../widgets/button_widget.dart';
import '../widgets/display_widget.dart';
import '../utils/operations.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _operando1 = "";
  String _operando2 = "";
  String _operacao = "";
  List<String> _historico = [];

  void _pressionarBotao(String valor) {
    setState(() {
      if (valor == "C") {
        _output = "0";
        _operando1 = "";
        _operando2 = "";
        _operacao = "";
      } else if (valor == "+" || valor == "-" || valor == "×" || valor == "÷" || valor == "^") {
        _operando1 = _output;
        _operacao = valor;
        _output = "0";
      } else if (valor == "=") {
        _operando2 = _output;
        _output = calcularResultado(_operando1, _operando2, _operacao);
        _historico.add("$_operando1 $_operacao $_operando2 = $_output");
        _operando1 = "";
        _operando2 = "";
        _operacao = "";
      } else {
        _output = (_output == "0") ? valor : _output + valor;
      }
    });
  }

  void _mostrarHistorico() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _historico.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(_historico[index]),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora"),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: _mostrarHistorico,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            DisplayWidget(output: _output),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      ButtonWidget("C", Colors.red, onTap: _pressionarBotao),
                      ButtonWidget("^", Colors.green, onTap: _pressionarBotao),
                      ButtonWidget("√", Colors.green, onTap: _pressionarBotao),
                      ButtonWidget("÷", Colors.green, onTap: _pressionarBotao),
                    ],
                  ),
                  Row(
                    children: [
                      ButtonWidget("7", Colors.grey, onTap: _pressionarBotao),
                      ButtonWidget("8", Colors.grey, onTap: _pressionarBotao),
                      ButtonWidget("9", Colors.grey, onTap: _pressionarBotao),
                      ButtonWidget("×", Colors.green, onTap: _pressionarBotao),
                    ],
                  ),
                  Row(
                    children: [
                      ButtonWidget("4", Colors.grey, onTap: _pressionarBotao),
                      ButtonWidget("5", Colors.grey, onTap: _pressionarBotao),
                      ButtonWidget("6", Colors.grey, onTap: _pressionarBotao),
                      ButtonWidget("-", Colors.green, onTap: _pressionarBotao),
                    ],
                  ),
                  Row(
                    children: [
                      ButtonWidget("1", Colors.grey, onTap: _pressionarBotao),
                      ButtonWidget("2", Colors.grey, onTap: _pressionarBotao),
                      ButtonWidget("3", Colors.grey, onTap: _pressionarBotao),
                      ButtonWidget("+", Colors.green, onTap: _pressionarBotao),
                    ],
                  ),
                  Row(
                    children: [
                      ButtonWidget("0", Colors.grey, isLarge: true, onTap: _pressionarBotao),
                      ButtonWidget(".", Colors.grey, onTap: _pressionarBotao),
                      ButtonWidget("=", Colors.green, onTap: _pressionarBotao),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
