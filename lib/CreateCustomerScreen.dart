import 'package:flutter/material.dart';
import 'DataControl.dart';

class CreateCustomerScreen extends StatefulWidget {
  @override
  _CreateCustomerScreenState createState() => _CreateCustomerScreenState();
}

class _CreateCustomerScreenState extends State<CreateCustomerScreen> {
  // final TextEditingController uidController = TextEditingController();
  final TextEditingController fioController = TextEditingController();
  final TextEditingController nomerController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  // final TextEditingController projectController = TextEditingController();

  void createCustomer() {
    int zid = DataControl.zakazchiki.length;
    int uid = DataControl.uidAuth; // Присвоение авторизованному пользователю

    String fio = fioController.text;
    String nomer = nomerController.text;
    String email = emailController.text;
    // String project = projectController.text;

    Map<String, dynamic> customer = {
      'zid': zid,
      'uid': uid,
      'fio': fio,
      'nomer': nomer,
      'email': email,
      // 'project': project,
    };

    DataControl.zakazchiki.add(customer);

    // Очищаем поля ввода после добавления заказчика
    // uidController.clear();
    fioController.clear();
    nomerController.clear();
    emailController.clear();
    // projectController.clear();

    // Возвращаемся на предыдущий экран
    Navigator.pop(context);
    print(DataControl.zakazchiki);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Создание заказчика'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fioController,
              decoration: InputDecoration(labelText: 'ФИО'),
            ),
            TextField(
              controller: nomerController,
              decoration: InputDecoration(labelText: 'Номер телефона'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            // TextField(
            //   controller: projectController,
            //   decoration: InputDecoration(labelText: 'Название'),
            //   keyboardType: TextInputType.number,
            // ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: createCustomer,
              child: Text('Создать заказчика'),
            ),
          ],
        ),
      ),
    );
  }
}
