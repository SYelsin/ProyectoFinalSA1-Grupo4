import 'package:flutter/material.dart';
import 'package:tictactoe_game/screens/desafios_screen.dart';
import 'package:tictactoe_game/screens/desarolladores_screen.dart';
import 'package:tictactoe_game/screens/join_room_screen.dart';
import 'package:tictactoe_game/screens/menu_screen.dart';
import 'package:tictactoe_game/screens/rules_screen.dart';
import 'package:tictactoe_game/screens/tictactoeIA_screen.dart';
import 'package:tictactoe_game/screens/tutorial_screen.dart';

import 'main_menu_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double availableScreenWidth = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(children: [
        // Header Section
        Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          alignment: Alignment.bottomCenter,
          height: 170,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 47, 12, 165)),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "TicTacGo",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  "Game",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: const Image(
                        image: AssetImage('assets/logo.png'),
                        width: 60,
                        height: 60,
                      )),
                ],
              ),
            ),
          ]),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: const TextSpan(
                      text: "Tu Estadistica ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      children: [])),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              buildWinLossChart("Victorias", "🎉", Colors.green, 5),
              const SizedBox(width: 2),
              buildWinLossChart("Empates", "🤝", Colors.grey, 4),
              const SizedBox(width: 2),
              buildWinLossChart("Derrotas", "😞", Colors.red, 2),
            ],
          ),
        ),
        const SizedBox(height: 15),
        const Divider(
          height: 20,
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(25),
            children: [
              const Text(
                "Maestros de TicTacGo ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              Container(
                padding: const EdgeInsets.only(left: 5, top: 5),
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildAvatar('Mia', 'avatarm', '10'),
                    buildAvatar('Adam', 'avatarh', '5'),
                    buildAvatar('Jess', 'avatarm', '4'),
                    buildAvatar('Mike', 'avatarh', '3'),
                    buildAvatar('Brandon', 'avatarh', '2'),
                    buildAvatar('Alie', 'avatarm', '1'),
                  ],
                ),
              ),
              const Divider(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Academia del Juego ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Explora y Desafía",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 47, 12, 165)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // Folder List
              buildProjectRow("Desafíos Diario", "desafio", "orange",
                  DailyChallengesScreen()),
              buildProjectRow(
                  "Reglas del juego", "rule", "green", RulesScreen()),
              buildProjectRow("Tutorial", "tutorial", "red", TutorialScreen()),
              buildProjectRow(
                  "Desarrolladores", "dev", "blue", DevelopersScreen()),
            ],
          ),
        )
      ]),
      floatingActionButton: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(color: Colors.white, spreadRadius: 7, blurRadius: 1)
        ]),
        child: FloatingActionButton(
          onPressed: () {
            _showGameOptions(context);
          },
          child: const Icon(Icons.games),
          backgroundColor: Color.fromARGB(255, 47, 12, 165),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor:
              Color.fromARGB(255, 47, 12, 165), // Color del ícono seleccionado
          unselectedItemColor: Colors.grey, // Color del ícono no seleccionado
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Time',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Folder',
            ),
          ]),
    );
  }

  Widget buildProjectRow(
      String name, String iconName, String color, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 65,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  _getIconData(iconName),
                  color: _getColorFromString(color),
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_circle_right,
                color: Color.fromARGB(255, 47, 12, 165),
              ),
            )
          ],
        ),
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case "desafio":
        return Icons.calendar_month;
      case "rule":
        return Icons.rule;
      case "tutorial":
        return Icons.play_circle_fill_rounded;
      case "dev":
        return Icons.developer_mode;
      // Agrega más casos según sea necesario para otros nombres de íconos.
      default:
        return Icons
            .error; // Icono de error si el nombre no coincide con ninguno conocido.
    }
  }

  Color _getColorFromString(String colorString) {
    switch (colorString) {
      case "orange":
        return Colors.orange;
      case "green":
        return Colors.green;
      case "red":
        return Colors.red;
      case "blue":
        return Colors.blue;
      // Agrega más casos según sea necesario para otros nombres de colores.
      default:
        return Color.fromARGB(255, 47, 12,
            165); // Color predeterminado si el nombre no coincide con ninguno conocido.
    }
  }

  Column buildFileSizeChart(
      String title, Color? color, double widthPercentage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: availableScreenWidth * widthPercentage,
          height: 4,
          color: color,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget buildAvatar(String name, String avatar, String ganes) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: Image.asset('assets/$avatar.png').image,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "🏆" + ganes,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildWinLossChart(
      String label, String icon, Color color, double dato) {
    return Expanded(
      child: Container(
        height: 100, // Ajusta la altura según tus necesidades
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              icon,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "${(dato).toInt()}",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showGameOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Elige un modo de juego',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _buildOptionButton(
                context,
                'Jugar con IA',
                '🤖',
                () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => TicTacToeScreen()),
                  );
                },
              ),
              SizedBox(height: 16),
              _buildOptionButton(
                context,
                'Jugar con amigos',
                '👫',
                () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => FriendMenuScreen()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOptionButton(
      BuildContext context, String text, String emoji, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 47, 12, 165),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.all(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10),
          Text(
            emoji,
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
