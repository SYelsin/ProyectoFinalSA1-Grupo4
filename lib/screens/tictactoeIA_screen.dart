import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontFamily: 'Roboto', // Usa la fuente Roboto preinstalada
            fontSize: 16.0,
          ),
        ),
      ),
      home: TicTacToeScreen(),
    );
  }
}

class TicTacToeScreen extends StatefulWidget {
  @override
  _TicTacToeScreenState createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<List<String>> board = List.generate(3, (_) => List.filled(3, ''));
  bool isPlayerTurn = true;
  String playerName = 'Tú';
  String aiName = 'IA';
  int playerWins = 0;
  int aiWins = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe con IA'),
        backgroundColor: Colors.transparent, // Hace la AppBar transparente
        elevation: 0, // Elimina la sombra de la AppBar
      ),
      backgroundColor: Colors.black,
      // Color de fondo de la pantalla
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildScoreboard(),
              SizedBox(height: 20),
              buildBoard(),
              SizedBox(height: 80),
              TurnIndicator(
                  isPlayerTurn: isPlayerTurn,
                  playerName: playerName,
                  aiName: aiName),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildScoreboard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              '🤖 $aiName',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(
              '$aiWins',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
        SizedBox(width: 150),
        Column(
          children: [
            Text(
              '👤 $playerName',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Text(
              '$playerWins',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
        // Ajusta según tus preferencias
      ],
    );
  }

  Widget buildBoard() {
    return Container(
      color: Colors.black,
      child: Column(
        children: List.generate(3, (row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (col) {
              return GestureDetector(
                onTap: () {
                  makeMove(row, col);
                },
                child: Container(
                  width: 119,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: board[row][col] == ''
                          ? Color.fromARGB(255, 47, 12, 165)
                          : (board[row][col] == 'X' ? Colors.red : Colors.blue),
                      width: 1,
                    ),
                    color: Colors.black, // Fondo blanco
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Text(
                          board[row][col],
                          style: TextStyle(
                            fontSize: 102,
                            color: Colors.black, // Color del borde
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          board[row][col],
                          style: TextStyle(
                            fontSize: 102,
                            color: board[row][col] == 'X'
                                ? Colors.red
                                : Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        }),
      ),
    );
  }

  void makeMove(int row, int col) {
    if (isPlayerTurn && board[row][col] == '') {
      setState(() {
        board[row][col] = 'X';
        isPlayerTurn = false;
      });

      if (checkWinner('X')) {
        showResult('¡$playerName ha ganado!');
        playerWins++;
        return;
      }

      if (checkTie()) {
        showResult('¡Empate!');
        return;
      }

      makeAIMove();
    }
  }

  void makeAIMove() {
    Future.delayed(Duration(seconds: 1), () {
      List<int> bestMove = findBestMove();
      if (bestMove.isNotEmpty) {
        setState(() {
          board[bestMove[0]][bestMove[1]] = 'O';
          isPlayerTurn = true;
        });

        if (checkWinner('O')) {
          showResult('¡$aiName ha ganado!');
          aiWins++;
          return;
        }

        if (checkTie()) {
          showResult('¡Empate!');
        }
      }
    });
  }

  List<int> findBestMove() {
    int bestVal = -1000;
    List<int> bestMove = [];

    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          board[i][j] = 'O';
          int moveVal = minimax(board, 0, false);
          board[i][j] = '';

          if (moveVal > bestVal) {
            bestMove = [i, j];
            bestVal = moveVal;
          }
        }
      }
    }

    return bestMove;
  }

  int minimax(List<List<String>> board, int depth, bool isMaximizing) {
    int score = evaluate(board);

    if (score == 10 || score == -10) {
      return score;
    }

    if (!isMovesLeft(board)) {
      return 0;
    }

    if (isMaximizing) {
      int best = -1000;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[i][j] == '') {
            board[i][j] = 'O';
            best = max(best, minimax(board, depth + 1, !isMaximizing));
            board[i][j] = '';
          }
        }
      }
      return best;
    } else {
      int best = 1000;
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          if (board[i][j] == '') {
            board[i][j] = 'X';
            best = min(best, minimax(board, depth + 1, !isMaximizing));
            board[i][j] = '';
          }
        }
      }
      return best;
    }
  }

  int evaluate(List<List<String>> board) {
    for (int row = 0; row < 3; row++) {
      if (board[row][0] == board[row][1] && board[row][1] == board[row][2]) {
        if (board[row][0] == 'O') {
          return 10;
        } else if (board[row][0] == 'X') {
          return -10;
        }
      }
      if (board[0][row] == board[1][row] && board[1][row] == board[2][row]) {
        if (board[0][row] == 'O') {
          return 10;
        } else if (board[0][row] == 'X') {
          return -10;
        }
      }
    }

    if (board[0][0] == board[1][1] && board[1][1] == board[2][2]) {
      if (board[0][0] == 'O') {
        return 10;
      } else if (board[0][0] == 'X') {
        return -10;
      }
    }
    if (board[0][2] == board[1][1] && board[1][1] == board[2][0]) {
      if (board[0][2] == 'O') {
        return 10;
      } else if (board[0][2] == 'X') {
        return -10;
      }
    }

    return 0;
  }

  bool isMovesLeft(List<List<String>> board) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          return true;
        }
      }
    }
    return false;
  }

  bool checkWinner(String player) {
    for (int i = 0; i < 3; i++) {
      if (board[i][0] == player &&
          board[i][1] == player &&
          board[i][2] == player) {
        return true;
      }
      if (board[0][i] == player &&
          board[1][i] == player &&
          board[2][i] == player) {
        return true;
      }
    }

    if (board[0][0] == player &&
        board[1][1] == player &&
        board[2][2] == player) {
      return true;
    }
    if (board[0][2] == player &&
        board[1][1] == player &&
        board[2][0] == player) {
      return true;
    }

    return false;
  }

  bool checkTie() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          return false;
        }
      }
    }
    return true;
  }

  void showResult(String result) {
    String emoji = "";

    if (result.contains('$aiName ha ganado')) {
      emoji = '😢'; // Emoji de cara triste para la IA ganadora
    } else if (result.contains('$playerName ha ganado')) {
      emoji = '😄'; // Emoji de cara feliz para el jugador ganador
    } else if (result.contains('Empate')) {
      emoji = '😐'; // Emoji de cara neutral para empate
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultado', style: TextStyle(fontSize: 24)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(result, style: TextStyle(fontSize: 18)),
              if (emoji != null)
                Text(
                  emoji,
                  style: TextStyle(fontSize: 50),
                ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                resetGame();
              },
              child: Text('Aceptar', style: TextStyle(fontSize: 16)),
            ),
          ],
        );
      },
    );
  }

  void resetGame() {
    setState(() {
      board = List.generate(3, (_) => List.filled(3, ''));
      isPlayerTurn = true;
    });
  }
}

class TurnIndicator extends StatelessWidget {
  final bool isPlayerTurn;
  final String playerName;
  final String aiName;

  TurnIndicator({
    required this.isPlayerTurn,
    required this.playerName,
    required this.aiName,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      isPlayerTurn ? '$playerName tienes el turno' : '$aiName tiene el turno',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
