import 'package:expense_tracker/res/theme/dimens.dart';
import 'package:flutter/material.dart';

class ExpenseCart extends StatelessWidget {
  const ExpenseCart({
    super.key,
    required this.discription,
    required this.date,
    required this.amount,
    required this.onTapEdit,
    required this.onTapDelete,
  });

  final String discription;
  final String date;
  final num amount;
  final VoidCallback onTapEdit;
  final VoidCallback onTapDelete;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink[200],
      child: ListTile(
        title: Text(
          discription,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '\$ $amount',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Dimens.boxWidth10,
            Text(
              date,
              style: TextStyle(color: Colors.blueGrey.shade100),
            )
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onTapEdit,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: onTapDelete,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
