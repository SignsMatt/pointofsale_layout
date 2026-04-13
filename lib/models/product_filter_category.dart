enum ProductFilterCategory {
  allItems('All Items'),
  food('Food'),
  alcohol('Alcohol'),
  coldDrinks('Cold Drinks'),
  hotDrinks('Hot Drinks');

  const ProductFilterCategory(this.label);
  final String label;
}
