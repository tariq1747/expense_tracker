import 'dart:convert';

class ExpenseModel {
  final num? id;
  final String date;
  final num amount;
  final num sessions;
  final String name;
  ExpenseModel({
    this.id,
    required this.date,
    required this.amount,
    required this.sessions,
    required this.name,
  });

  ExpenseModel copyWith({
    num? id,
    String? date,
    num? amount,
    int? sessions,
    String? name,
  }) {
    return ExpenseModel(
      id: id ?? this.id,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      sessions: sessions ?? this.sessions,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date,
      'amount': amount,
      'sessions': sessions,
      'name': name,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'],
      date: map['date'] as String,
      amount: map['amount'] as num,
      sessions: map['sessions'] as num,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExpenseModel.fromJson(String source) =>
      ExpenseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ExpenseModel(id: $id, date: $date, amount: $amount, sessions: $sessions, name: $name)';
  }

  @override
  bool operator ==(covariant ExpenseModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.date == date &&
        other.amount == amount &&
        other.sessions == sessions &&
        other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        date.hashCode ^
        amount.hashCode ^
        sessions.hashCode ^
        name.hashCode;
  }
}
