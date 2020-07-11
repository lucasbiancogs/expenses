import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleControler = TextEditingController();
  final valueControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleControler,
              decoration: InputDecoration(
                labelText: 'Título',
              ),
            ),
            TextField(
              controller: valueControler,
              decoration: InputDecoration(
                labelText: 'Valor (R\$)',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Cancelar'),
                  textColor: Colors.purple,
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text(
                    'Salvar',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  textColor: Colors.purple,
                  onPressed: () {
                    print(titleControler.text);
                    print(valueControler.text);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
