class Operation {
  String name;
  Duration time;
  double price;
  bool isSelected;

  Operation({
    required this.name,
    required this.time,
    required this.price,
    this.isSelected = false,
  });

  bool get selected => isSelected;
  set selected(bool value) {
    isSelected = value;
  }
}
