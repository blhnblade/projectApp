import 'package:flutter/material.dart';
import 'DataControl.dart';
import 'auth_screen.dart';
import 'helloScreen.dart';
// class RegScreen extends StatelessWidget {
//   RegScreen();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Регистрация'),
//       ),
//       body: Container(
//         child: Center(
//           child: Text('Экран регистрации'),
//         ),
//       ),
//     );
//   }
// }

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _registerUser() {
    String name = _nameController.text;
    String password = _passwordController.text;

    // Генерация uid для нового пользователя
    int uid = DataControl.generateUid();

    // Регистрация нового пользователя
    DataControl.registerUser(uid, name, password);

    // Переключение на страницу авторизации
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => firstScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация'),
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
              onPressed: _registerUser,
              child: Text('Зарегистрироваться'),
            ),
          ],
        ),
      ),
    );
  }
}