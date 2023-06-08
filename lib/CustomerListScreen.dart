import 'package:flutter/material.dart';
import 'DataControl.dart';

class CustomerListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredCustomers = DataControl.zakazchiki
        .where((customer) => customer['uid'] == DataControl.uidAuth)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Список заказчиков'),
      ),
      body: ListView.builder(
        itemCount: filteredCustomers.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> customer = filteredCustomers[index];
          return Card(
            child: ListTile(
              title: Text(customer['fio']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomerDetailsScreen(customer: customer),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class CustomerDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> customer;

  CustomerDetailsScreen({required this.customer});

  @override
  _CustomerDetailsScreenState createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {
  List<Map<String, dynamic>> filteredProjects = [];

  @override
  void initState() {
    super.initState();
    filteredProjects = DataControl.projects
        .where((project) => project['zid'] == widget.customer['zid'])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Информация о заказчике'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Имя: ${widget.customer['fio']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Номер телефона: ${widget.customer['nomer']}'),
            SizedBox(height: 8.0),
            Text('Email: ${widget.customer['email']}'),
            SizedBox(height: 16.0),
            Text(
              'Проекты заказчика',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProjects.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> project = filteredProjects[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 16.0),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Название проекта: ${project['projectName']}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.0),
                          Text('Описание: ${project['opisanie']}'),
                          SizedBox(height: 8.0),
                          Text(
                            'Статус: ${project['complete'] ? 'Завершен' : 'Не завершен'}',
                            style: TextStyle(
                              color: project['complete'] ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          TextFormField(
                            initialValue: project['projectName'],
                            decoration: InputDecoration(
                              labelText: 'Изменить название',
                            ),
                            enabled: !project['complete'],
                            onChanged: (value) {
                              setState(() {
                                project['projectName'] = value;
                              });
                            },
                          ),
                          SizedBox(height: 8.0),
                          TextFormField(
                            initialValue: project['opisanie'],
                            decoration: InputDecoration(
                              labelText: 'Изменить описание',
                            ),
                            enabled: !project['complete'],
                            onChanged: (value) {
                              setState(() {
                                project['opisanie'] = value;
                              });
                            },
                          ),
                          SizedBox(height: 8.0),
                          SwitchListTile(
                            title: Text('Статус заказа'),
                            value: project['complete'],
                            onChanged: (value) {
                              setState(() {
                                project['complete'] = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
