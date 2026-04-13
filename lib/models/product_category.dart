enum ProductCategory {
  allItems('All Items'),
  food('Food'),
  alcohol('Alcohol'),
  coldDrinks('Cold Drinks'),
  hotDrinks('Hot Drinks');

  const ProductCategory(this.label);
  final String label;
}
