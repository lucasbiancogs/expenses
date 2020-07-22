import 'package:flutter/material.dart';

import 'transaction_card.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemoveTransactions;

  TransactionList(this.transactions, this.onRemoveTransactions);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Nenhuma Transação Cadastrada',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            /*
      Ao carregar uma lista, dependendo do seu tamanho, pode custar muita memória do celular
      carregar toda a lista

      O ListView por padrão constrói toda a lista, mesmo que não esteja na tela
      usando o builder ele constrói por demanda, muito melhor pra listas grandes
      */
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];

              return TransactionCard(
                tr: tr,
                onRemoveTransactions: onRemoveTransactions,
              );
            },
          );
  }
}
