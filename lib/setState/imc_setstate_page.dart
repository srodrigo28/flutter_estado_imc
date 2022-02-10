import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/imc_gauge.dart';

class ImcSetstatePage extends StatefulWidget {
  const ImcSetstatePage({Key? key}) : super(key: key);

  @override
  State<ImcSetstatePage> createState() => _ImcSetstatePageState();
}

class _ImcSetstatePageState extends State<ImcSetstatePage> {
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var imc = 0.0;

  Future<void> _calcularIMC({ required double peso, required double altura}) async{
    setState(() {
      imc = 0;
    });
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      imc = peso / pow(altura, 2);
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Imc SetState')),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ImcGauge(imc: imc),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: pesoEC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Peso'),
                  inputFormatters: [
                    CurrencyTextInputFormatter( locale: 'pt_BR', symbol: '', decimalDigits: 2, turnOffGrouping: true),
                  ],
                  validator: (String? value){
                    if(value == null || value.isEmpty){
                      return 'Peso Obrigatório!';
                    }
                  },
                ),
                TextFormField(
                  controller: alturaEC,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Altura'),
                  inputFormatters: [
                    CurrencyTextInputFormatter( locale: 'pt_BR', symbol: '', decimalDigits: 2, turnOffGrouping: true),
                  ],
                  validator: (String? value){
                    if(value == null || value.isEmpty){
                      return 'Altura Obrigatória!';
                    }
                  },
                ),
                const SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  var formValid = formKey.currentState?.validate() ?? false;

                  if(formValid){
                    var formatter = NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2);
                    double peso = formatter.parse(pesoEC.text) as double;
                    double altura = formatter.parse(alturaEC.text) as double;
                    _calcularIMC(peso: peso, altura: altura);
                  }
                }, child: const Text('Calcular IMC'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
