class Item {
  String title;
  int quantity;
  double price;

  Item(this.title, this.quantity, this.price);

  double getTotal() {
    return quantity * price;
  }

  static double getTotalItems(List<Item> items) {
    double total = 0.0;
    for (var item in items) {
      total += item.getTotal();
    }
    return total;
  }
}