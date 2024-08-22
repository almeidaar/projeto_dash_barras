import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<double> barValues = [50, 150, 200, 80, 120];
  List<String> barDescription = ["Comercial", "Financeiro", "Juridico", "Produtos", "TI"];
  double maxBarHeight = 300; // Altura máxima disponível para as barras

  @override
  Widget build(BuildContext context) {
    double maxValue = barValues.reduce((a, b) => a > b ? a : b);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: barValues.map((value) {
              // Calcula a altura proporcional
              double height = (value / maxValue) * maxBarHeight;

              return AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                width: 30,
                height: height,
                color: const Color.fromARGB(255, 59, 16, 129),
                
              );
            }).toList(),
          ),
          const SizedBox(height: 30,),
          ElevatedButton(
            onPressed: () {
              setState(() {
                // Exemplo: Alterando os valores das barras para simular atualização
                barValues = [50, 100, 180, 120, 140];
              });
            },
            child: const Text('Atualizar Gráfico'),
          ),
        ],
      ),
    );
  }
}
