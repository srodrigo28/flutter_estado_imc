import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_estado_imc/widgets/imc_gauge_range.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcSetstatePage extends StatefulWidget {
  const ImcSetstatePage({Key? key}) : super(key: key);

  @override
  State<ImcSetstatePage> createState() => _ImcSetstatePageState();
}

class _ImcSetstatePageState extends State<ImcSetstatePage> {
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Imc SetState')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SfRadialGauge(
                axes: [
                  RadialAxis(
                    showLabels: false,
                    showAxisLine: false,
                    showTicks: false,
                    minimum: 12.5,
                    maximum: 47.9,
                    ranges: [
                      ImcGaugeRange(color: Colors.blue, start: 12.5, end: 18.5, label: 'Magreza'),
                      ImcGaugeRange(color: Colors.green, start: 18.5, end: 24.5, label: 'Normal'),
                      ImcGaugeRange(color: Colors.yellow[600]!, start: 24.5, end: 29.9, label: 'Sobre Peso'),
                      ImcGaugeRange(color: Colors.red[400]!, start: 29.9, end: 39.9, label: 'OBESIDADE'),
                      ImcGaugeRange(color: Colors.red[800]!, start: 39.9, end: 47.9, label: 'OBESIDADE GRAVE'),
                    ],
                    pointers: const [
                      NeedlePointer(
                        value: 24,
                        enableAnimation: true,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: pesoEC,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Peso'),
                inputFormatters: [
                  CurrencyTextInputFormatter( locale: 'pt_BR', symbol: '', decimalDigits: 2, turnOffGrouping: true),
                ],
              ),
              TextFormField(
                controller: alturaEC,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Altura'),
                inputFormatters: [
                  CurrencyTextInputFormatter( locale: 'pt_BR', symbol: '', decimalDigits: 2, turnOffGrouping: true),
                ],
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){}, child: Text('Calcular IMC'))
            ],
          ),
        ),

      ),
    );
  }
}
