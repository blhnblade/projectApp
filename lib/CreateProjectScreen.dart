import 'package:flutter/material.dart';
import 'DataControl.dart';

class CreateProjectScreen extends StatefulWidget {
  @override
  _CreateProjectScreenState createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  int _pid = 0;
  int _selectedZid = 0;
  String _projectName = '';
  String _opisanie = '';

  void _createProject() {
    // Создаем новый заказ и добавляем его в массив projects
    Map<String, dynamic> newProject = {
      'pid': _pid,
      'zid': _selectedZid,
      'projectName': _projectName,
      'opisanie': _opisanie,
      'complete': false,
    };
    DataControl.projects.add(newProject);

    // Увеличиваем значение _pid для следующего заказа
    _pid++;

    // Очищаем поля ввода
    setState(() {
      _selectedZid = 0;
      _projectName = '';
      _opisanie = '';
    });

    // Выводим уведомление об успешном создании заказа
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Заказ успешно создан'),
      ),
    );
    Navigator.pop(context);
    print(DataControl.projects);
  }

  @override
  Widget build(BuildContext context) {
    Map<int, String> zakazchikMap = Map.fromIterable(
      DataControl.zakazchiki,
      key: (zakazchik) => zakazchik['zid'],
      value: (zakazchik) => zakazchik['fio'],
    );

    List<DropdownMenuItem<int>> dropdownItems = zakazchikMap.entries.map((entry) {
      return DropdownMenuItem<int>(
        value: entry.key,
        child: Text(entry.value),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Создать заказ'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<int>(
              value: _selectedZid,
              onChanged: (int? newValue) {
                setState(() {
                  _selectedZid = newValue!;
                });
              },
              items: dropdownItems,
              decoration: InputDecoration(
                labelText: 'Выберите заказчика',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _projectName = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Название проекта',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _opisanie = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Описание',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _createProject,
              child: Text('Создать заказ'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
