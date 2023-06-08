import 'package:flutter/material.dart';
import 'reg_screen.dart';
import 'DataControl.dart';
import 'helloScreen.dart';
import 'screen.dart';

// class AuthScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Авторизация'),
//       ),
//       body: Container(
//         child: Center(
//           child: Text('Экран авторизации'),
//         ),
//       ),
//     );
//   }
// }


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isAuthenticated = false;

  void _authenticateUser() {
    String name = _nameController.text;
    String password = _passwordController.text;

    // Проверка имени пользователя и пароля
    bool isAuthenticated = DataControl.authenticateUser(name, password);

    if (isAuthenticated) {
      setState(() {
        _isAuthenticated = true;
      });

      // Переключение на другой экран
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Ошибка'),
          content: Text('Неправильное имя пользователя или пароль.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('ОК'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Авторизация'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Имя пользователя',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Пароль',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _authenticateUser,
              child: Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}