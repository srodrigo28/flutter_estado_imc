import 'package:flutter/material.dart';
import 'package:flutter_estado_imc/change_notifier/imc_change_notfier.dart';
import 'package:flutter_estado_imc/setState/imc_setstate_page.dart';
import 'package:flutter_estado_imc/value_notifier/imc_setstate_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _goToPage(BuildContext context, Widget page){
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => page
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){ _goToPage(context, ImcSetstatePage());  }, child: const Text('SetState')),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){ _goToPage(context, ValueNofifierPage()); }, child: const Text('ValueNotifier')),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){ _goToPage(context, ChaverNotifierPage());  }, child: const Text('ChangeNotifier')),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){}, child: const Text('Bloc Pattern (Stremas)')),
          ],
        ),
      ),
    );
  }
}
