import 'package:flutter/material.dart';
import 'package:tictactoe_game/responsive/responsive.dart';
import 'package:tictactoe_game/screens/create_room_screen.dart';
import 'package:tictactoe_game/screens/join_room_screen.dart';

class FriendMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const FriendMenuScreen({Key? key}) : super(key: key);

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 47, 12, 165),
              Colors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Responsive(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bienvenido a TicTacGo',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 30),
              Text(
                'Elige una opción:',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 30),
              CustomButton(
                onTap: () => createRoom(context),
                text: 'Crear Sala 🎮',
                neon: true, // Agregado para efecto neon
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () => joinRoom(context),
                text: 'Unirse a Sala 🚪',
                neon: true, // Agregado para efecto neon
              ),
              const SizedBox(height: 20),
              Text(
                '¿Listo para la diversión? 😄',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool neon; // Nuevo parámetro para el efecto neon

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.neon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200, // Tamaño uniforme
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), // Redondeado
          color: neon ? Colors.transparent : Color.fromARGB(255, 47, 12, 165),
          boxShadow: neon
              ? [
                  BoxShadow(
                    color: Colors.blue,
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: Colors.red,
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: neon ? Colors.white : Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
