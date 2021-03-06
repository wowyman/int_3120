import 'package:intl/intl.dart';

class Expense {
  final int id;
  final double amount;
  final DateTime date;
  final String category;

  String get formattedDate {
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  static final columns = ['id', 'amount', 'date', 'category'];

  Expense(this.id, this.amount, this.date, this.category);

  factory Expense.fromMap(Map<dynamic, dynamic> data) {
    return Expense(
      data['id'],
      data['amount'],
      DateTime.parse(data['date']),
      data['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "amount": amount,
      "date": date.toString(),
      "category": category,
    };
  }
}