import 'package:flutter/material.dart';
import 'package:flutter_estado_imc/setState/imc_setstate_page.dart';

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
            ElevatedButton(onPressed: (){}, child: const Text('ValueNotifier')),
            ElevatedButton(onPressed: (){}, child: const Text('ChangeNotifier')),
            ElevatedButton(onPressed: (){}, child: const Text('Bloc Pattern (Stremas)')),
          ],
        ),
      ),
    );
  }
}
