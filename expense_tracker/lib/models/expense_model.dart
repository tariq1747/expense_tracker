import 'dart:convert';

class ExpenseModel {
  final num? id;
  final String date;
  final num amount;
  final String description;
  ExpenseModel({
    this.id,
    required this.date,
    required this.amount,
    required this.description,
  });

  ExpenseModel copyWith({
    num? id,
    String? date,
    num? amount,
    String? description,
  }) {
    return ExpenseModel(
      id: id ?? this.id,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date,
      'amount': amount,
      'description': description,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'] as num,
      date: map['date'] as String,
      amount: map['amount'] as num,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseModel.fromJson(String source) =>
      ExpenseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExpenseModel(id: $id, date: $date, amount: $amount, description: $description)';
  }

  @override
  bool operator ==(covariant ExpenseModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.date == date &&
        other.amount == amount &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^ date.hashCode ^ amount.hashCode ^ description.hashCode;
  }
}
