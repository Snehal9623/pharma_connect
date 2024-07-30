class Order {
  final int orderId;
  final String imageUrl;
  final String deliveryDate;
  final String numberOfItems;
  final String status;

  Order({
    required this.orderId,
    required this.imageUrl,
    required this.deliveryDate,
    required this.numberOfItems,
    required this.status,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderId: json['order_id'],
      imageUrl: json['image_url'],
      deliveryDate: json['delivery_date'],
      numberOfItems: json['no_of_items'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderId,
      'image_url': imageUrl,
      'delivery_date': deliveryDate,
      'no_of_items': numberOfItems,
      'status': status,
    };
  }
}
