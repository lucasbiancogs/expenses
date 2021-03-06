import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../models/transaction.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


class TransactionCard extends StatelessWidget {
  final Transaction tr;
  final void Function(String p1) onRemoveTransactions;


  const TransactionCard({
    @required this.tr,
    @required this.onRemoveTransactions,
  });


  @override
  Widget build(BuildContext context) {

    Intl.defaultLocale = 'pt_BR';
    initializeDateFormatting('pt_BR', null);

    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: Container(
          height: 35,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                NumberFormat.currency(customPattern: 'R\$#.##')
                    .format(tr.value),
                style: TextStyle(
                    color: Theme.of(context).textTheme.button.color),
              ),
            ),
          ),
        ),
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('d MMMM y').format(tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 450
            ? FlatButton.icon(
                onPressed: () => onRemoveTransactions(tr.id),
                icon: Icon(Icons.delete),
                label: Text('Excluir'),
                textColor: Theme.of(context).errorColor,)
            : IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => onRemoveTransactions(tr.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}