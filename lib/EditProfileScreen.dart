import 'package:flutter/material.dart';
import 'DataControl.dart';

class EditProfileScreen extends StatefulWidget {
  final int uid;

  EditProfileScreen({required this.uid});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    initializeFields();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void initializeFields() {

      // Заполняем текстовые поля текущими значениями name и password
      _nameController.text = DataControl.members[DataControl.uidAuth]['name'];
      _passwordController.text = DataControl.members[DataControl.uidAuth]['password'];
  }

  void _saveChanges() {

      // Обновляем значения name и password у пользователя
    DataControl.members[DataControl.uidAuth]['name'] = _nameController.text;
    DataControl.members[DataControl.uidAuth]['password'] = _passwordController.text;

      // Выводим обновленные данные пользователя в консоль
      print('Updated user: $DataControl.members[DataControl.uidAuth]');

      // Переходим назад на предыдущий экран
      Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Редактирование профиля'),
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
              onPressed: _saveChanges,
              child: Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}
