import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/blocs/transactions/transactions_bloc.dart';
import 'package:tracker/consts/toast.dart';

import '../db_functions/transactions/transaction_db_functions.dart';
import '../problems/amount_totals.dart';

Future<void> alertMassege(BuildContext ctx, {required String id}) async {
  return showDialog(
    context: ctx,
    builder: (context) {
      return AlertDialog(
        title: const Text('Delete !'),
        content: const Text('Are you sure for delet?'),
        actions: [
          TextButton(
              onPressed: () async {
                //==================================After Bloc=========================================
                // await TransactionDB.instance.deleteTransactions(id);
                BlocProvider.of<TransactionsBloc>(context)
                    .add(TransactionsDeleteEvent(id: id));
                //==================================After Bloc=========================================
                showToast(message: 'Deleted');
                //==================================After Bloc=========================================
                // await Amounts.instance.totalAmount();
                // Amounts.instance.totalAmount();
                //==================================After Bloc=========================================
                Navigator.of(context).pop();
              },
              child: const Text('Yes')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'))
        ],
      );
    },
  );
}
