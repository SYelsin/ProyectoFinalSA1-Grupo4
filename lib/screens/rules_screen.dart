import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: RulesScreen(),
    );
  }
}

class RulesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reglas del Juego'),
        backgroundColor: Color.fromARGB(255, 47, 12, 165),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tic Tac Toe - Reglas del juego',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Jugar con IA:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              _buildRule(
                  '1. Selecciona "Jugar Tic Tac Toe con IA" desde el menú principal. 🤖'),
              _buildRule(
                  '2. Elige tu símbolo, "X" o "O". La IA tomará el símbolo restante. 🙋‍♂️'),
              _buildRule(
                  '3. Comienza el juego con tu movimiento. La IA realizará su movimiento automáticamente. 🚀'),
              _buildRule(
                  '4. El objetivo es conseguir tres de tus símbolos en línea: ya sea horizontal, vertical o diagonal. ⭐'),
              _buildRule(
                  '5. Si logras alinear tres de tus símbolos antes que la IA, ¡ganarás! 🎉'),
              _buildRule(
                  '6. Si el tablero se llena y ninguno de los jugadores ha logrado tres en línea, el juego termina en empate. 🙃'),
              SizedBox(height: 20),
              Text(
                'Jugar con Amigos:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              _buildRule(
                  '1. Selecciona "Jugar Tic Tac Toe con amigos" desde el menú principal. 👫'),
              _buildRule(
                  '2. Cada jugador elige su propio símbolo, "X" o "O". 🤝'),
              _buildRule(
                  '3. Comienza el juego con el primer jugador realizando un movimiento. Luego, los jugadores alternan turnos. ⏰'),
              _buildRule(
                  '4. El objetivo es conseguir tres de tus símbolos en línea: ya sea horizontal, vertical o diagonal. ⚡'),
              _buildRule(
                  '5. El primer jugador que logre alinear tres de sus símbolos antes que el oponente, ¡ganará! 🏆'),
              _buildRule(
                  '6. Si el tablero se llena y ninguno de los jugadores ha logrado tres en línea, el juego termina en empate. 🤷‍♀️'),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRule(String ruleText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            '•',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(width: 8),
          Flexible(
            child: Text(
              ruleText,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
