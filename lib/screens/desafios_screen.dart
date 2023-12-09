import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: DailyChallengesScreen(),
    );
  }
}

class DailyChallengesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desafíos Diarios'),
        backgroundColor: Color.fromARGB(255, 47, 12, 165),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Desafíos Diarios',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              DailyChallengeCard(
                title: 'Gana 3 partidas seguidas',
                description:
                    'Demuestra tu destreza ganando 3 partidas consecutivas en el juego.',
                reward: '50 puntos',
                icon: Icons.star,
                color: Colors.orange,
              ),
              SizedBox(height: 16),
              DailyChallengeCard(
                title: 'Gana en una partida con IA',
                description:
                    'Demuestra tu agilidad realizando 10 movimientos en una sola partida.',
                reward: '30 puntos',
                icon: Icons.gesture,
                color: Colors.blue,
              ),
              SizedBox(height: 16),
              DailyChallengeCard(
                title: 'Juega una partida con amigos',
                description:
                    'Invita a tus amigos y juega una emocionante partida juntos.',
                reward: '20 puntos',
                icon: Icons.people,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DailyChallengeCard extends StatelessWidget {
  final String title;
  final String description;
  final String reward;
  final IconData icon;
  final Color color;

  DailyChallengeCard({
    required this.title,
    required this.description,
    required this.reward,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(
                  icon,
                  color: color,
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recompensa: $reward',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Acción al hacer clic en el botón de completar
                  },
                  style: ElevatedButton.styleFrom(
                    primary: color,
                  ),
                  child: Text('Completar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
