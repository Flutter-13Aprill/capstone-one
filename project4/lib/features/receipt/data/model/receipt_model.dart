class ReceiptModel {
  final String? supplierName;
  final String? phoneNumber;
  final String? receiptNumber;
  final String? documentType;
  final String? category;
  final String? subcategory;
  final String? date;
  final String? time;
  final String? totalAmount;
  final String? totalNet;
  final String? totalTax;
  final String? currency;

  ReceiptModel({
    this.supplierName,
    this.totalAmount,
    this.totalNet,
    this.totalTax,
    this.date,
    this.time,
    this.receiptNumber,
    this.documentType,
    this.category,
    this.subcategory,
    this.phoneNumber,
    this.currency,
  });

  factory ReceiptModel.fromJson(Map<String, dynamic> json) {
    final prediction = json['document']['inference']['prediction'];

    return ReceiptModel(
      supplierName: prediction['supplier_name']['value'] ?? 'غير معروف',
      phoneNumber: prediction['supplier_phone_number']['value'] ?? 'غير معروف',
      receiptNumber: prediction['receipt_number']['value'] ?? 'غير معروف',
      documentType: prediction['document_type']['value'] ?? 'غير معروف',
      category: prediction['category']['value'] ?? 'غير معروف',
      subcategory: prediction['subcategory']['value'] ?? 'غير معروف',
      date: prediction['date']['value'] ?? 'غير معروف',
      time: prediction['time']['value'] ?? 'غير معروف',
      totalAmount: prediction['total_amount']['value'].toString(),
      totalNet: prediction['total_net']['value'].toString(),
      totalTax: prediction['total_tax']['value'].toString(),
      currency: prediction['locale']['currency'] ?? 'غير معروف',
    );
  }
}
