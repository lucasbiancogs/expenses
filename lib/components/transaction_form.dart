import 'adaptatives/adaptative_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'adaptatives/adaptative_text_input.dart';
import 'adaptatives/adaptative_button.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit) {
    print('Constructor TransactionForm');
  }

  @override
  _TransactionFormState createState() {
    print('createState() _TransactionFormState');
    return _TransactionFormState();
  }
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleControler = TextEditingController();
  final _valueControler = MoneyMaskedTextController(decimalSeparator: '.');
  double valueChanged = 0;
  DateTime _selectedDate = DateTime.now();

// ...Entendendo métodos de ciclo de vida de um Widget...

  _TransactionFormState() {
    print('Constructor _TransactionFormState');
  }

  @override
  void initState() {
    print('initState() _TransactionFormState');
    super.initState();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    print('didUpdateWidget() _TransactionFormState');
    print(widget);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose() _TransactionFormState');
    super.dispose();
  }

  _submitForm() {
    final title = _titleControler.text;
    /*
    Um jeito muito interessante de tentar realizar uma ação
    e se não conseguir atribuir um valor padrão
    */
    final value = double.tryParse(_valueControler.text) ?? 0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    print('build() _TransactionFormState');
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          margin: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AdaptativeTextInput(
                controller: _titleControler,
                onSubmitted: (_) => _submitForm(),
                label: 'Título',
              ),
              AdaptativeTextInput(
                controller: _valueControler,
                onSubmitted: (_) => _submitForm(),
                label: 'Valor (R\$)',
                keyboardType: TextInputType.number,
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeButton(
                    label: 'Salvar',
                    onPressed: _submitForm,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
