import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estado_imc/widgets/imc_gauge_range.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
  var imc = 23.0;

  void _calcularIMC({ required double peso, required double altura}){
    setState(() {
      imc = peso / pow(altura, 2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Imc SetState')),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ImcGauge(imc: imc),
                SizedBox(height: 20,),
                TextFormField(
                  controller: pesoEC,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Peso'),
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
                  decoration: InputDecoration(labelText: 'Altura'),
                  inputFormatters: [
                    CurrencyTextInputFormatter( locale: 'pt_BR', symbol: '', decimalDigits: 2, turnOffGrouping: true),
                  ],
                  validator: (String? value){
                    if(value == null || value.isEmpty){
                      return 'Altura Obrigatória!';
                    }
                  },
                ),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: (){
                  var formValid = formKey.currentState?.validate() ?? false;

                  if(formValid){
                    var formatter = NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2);
                    double peso = formatter.parse(pesoEC.text) as double;
                  }


                }, child: Text('Calcular IMC'))
              ],
            ),
          ),
        ),

      ),
    );
  }
}
