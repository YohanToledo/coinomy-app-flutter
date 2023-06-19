class TransactionEntity {
  final int? id;
  final String type;
  final double value;
  final String description;
  final DateTime date;
  final String category;

  TransactionEntity({
    this.id,
    required this.type,
    required this.value,
    required this.description,
    required this.date,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'value': value,
      'description': description,
      'date': date.toIso8601String(),
      'category': category,
    };
  }
}
