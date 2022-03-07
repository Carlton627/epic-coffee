import 'package:flutter/material.dart';
import 'constants.dart';
import 'coffee_maker.dart';

void main() {
  return runApp(const MaterialApp(
    home: EpicCoffeeApp(),
  ));
}

class EpicCoffeeApp extends StatelessWidget {
  const EpicCoffeeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primaryColor,
      body: Column(children: [
        const SizedBox(height: 100),
        Container(
          child: const InputField(),
          padding: const EdgeInsets.all(20),
        ),
      ]),
    );
  }
}

class InputField extends StatefulWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late double coffeeWeight;
  late double waterRequired;

  final TextEditingController _coffeeController = TextEditingController();
  final TextEditingController _waterInputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _coffeeController.text =
          calculateRecipe(waterRequiredInGms: 1000).toString();
      _waterInputController.text =
          calculateRecipe(coffeeWeightInGms: 60).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final coffeeInputTheme = setInputTheme(coffeeHintString, coffeeLabelString);
    final waterInputTheme = setInputTheme(waterHintString, waterLabelString);

    return Column(
      children: [
        const LabelText(labelString: coffeeLabelString),
        TextField(
            style: textInputColor,
            controller: _coffeeController,
            decoration: coffeeInputTheme,
            keyboardType: TextInputType.number,
            cursorColor: Colors.brown,
            cursorHeight: 20,
            onTap: () {
              setState(() {
                coffeeWeight = 0;
                _coffeeController.clear();
                _waterInputController.clear();
              });
            },
            onChanged: (value) {
              setState(() {
                waterRequired = calculateRecipe(
                    coffeeWeightInGms: isNumeric(value) ? int.parse(value) : 0);
                _waterInputController.text = waterRequired.toString();
              });
            }),
        const SizedBox(height: 10),
        const LabelText(labelString: waterLabelString),
        TextField(
            style: textInputColor,
            controller: _waterInputController,
            decoration: waterInputTheme,
            keyboardType: TextInputType.number,
            onTap: () {
              setState(() {
                waterRequired = 0;
                _coffeeController.clear();
                _waterInputController.clear();
              });
            },
            onChanged: (value) {
              setState(() {
                coffeeWeight = calculateRecipe(
                    waterRequiredInGms:
                        isNumeric(value) ? int.parse(value) : 0);
                _coffeeController.text = coffeeWeight.toString();
              });
            }),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _coffeeController.dispose();
    _waterInputController.dispose();
  }
}

class LabelText extends StatelessWidget {
  final String labelString;
  const LabelText({required this.labelString ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(labelString,
        style: const TextStyle(
          color: Colors.brown,
          fontFamily: fontFamilyKanit,
          fontWeight: FontWeight.bold,
          fontSize: 45,
        )
    );
  }
}
