double calculateRecipe({coffeeWeightInGms = 0, waterRequiredInGms = 0}) {
  if (coffeeWeightInGms == 0 && waterRequiredInGms != 0) {
    return double.parse(((60 * waterRequiredInGms) / 1000).toStringAsFixed(2));
  } else if (waterRequiredInGms == 0 && coffeeWeightInGms != 0) {
    return double.parse(((1000 * coffeeWeightInGms) / 60).toStringAsFixed(2));
  }
  return 0;
}

bool isNumeric(String s) {
  return double.tryParse(s) != null;
}