import 'package:bmi_calculator/Screens/result_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import '../components/icon_content.dart';
import '../components/reuseable_card.dart';
import '../components/age_weight_input.dart';
import '../constants.dart';

enum Gender {
  female,
  male,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 150;
  int weight = 45;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('BMI Calculator')),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        color: selectedGender == Gender.female
                            ? activeCardColor
                            : cardPrimaryColor,
                        child: const IconContent(
                          icon: Icons.female,
                          iconText: 'Female',
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                          onTap: () {
                            setState(() {
                              selectedGender = Gender.male;
                            });
                          },
                          color: selectedGender == Gender.male
                              ? activeCardColor
                              : cardPrimaryColor,
                          child: const IconContent(
                            icon: Icons.male,
                            iconText: 'Male',
                          )),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: ReusableCard(
                  color: activeCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Height',
                        style: textStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: numericalTextStyle,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'cm',
                            style: textStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 30),
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15.0,
                                disabledThumbRadius: 10.0)),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            activeColor: bottomButtonColor,
                            inactiveColor: sliderInactiveColor,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            }),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        color: activeCardColor,
                        child: AgeWeightInput(
                          weight: weight,
                          label: 'Weight',
                          plusClick: () {
                            setState(() {
                              weight++;
                            });
                          },
                          minusClick: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        color: activeCardColor,
                        child: AgeWeightInput(
                          weight: age,
                          label: 'Age',
                          plusClick: () {
                            setState(() {
                              age++;
                            });
                          },
                          minusClick: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  height: bottomButtonHeight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: bottomButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    onPressed: () {
                      CalculatorBrain calculatorBrain =
                          CalculatorBrain(height: height, weight: weight);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(
                                  result: calculatorBrain.calculateResult(),
                                  bmi: calculatorBrain.calculateBMI(),
                                  caption: calculatorBrain.getcaption())));
                    },
                    child: const Center(
                      child: Text(
                        'Calculate',
                        style: textStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
