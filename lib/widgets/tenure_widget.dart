// import 'package:emi_calculator/bloc/loan_amount_bloc.dart';
import 'package:emi_calculator/bloc/calculate_interest_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';

class Tenure extends StatefulWidget {
  const Tenure({super.key});

  @override
  State<Tenure> createState() => _TenureState();
}

class _TenureState extends State<Tenure> {
  TextEditingController tenureController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tenureController.text = '30';
  }

  @override
  Widget build(BuildContext context) {
    final tenureBloc = BlocProvider.of<CalculateInterestBloc>(context);
    return BlocConsumer<CalculateInterestBloc, CalculateInterestState>(
      listener: (context, state) {
        tenureController.text = state.tenure.toStringAsFixed(0);
      },
      builder: (context, state) {
        double tenure = state.tenure;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Tenure (Years)'),
                  SizedBox(
                    height: 35,
                    width: 60,
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(bottom: 3, left: 8),
                      ),

                      controller: tenureController,
                      keyboardType: TextInputType.number,

                      // used to set loan amount
                      onChanged: (value) {
                        double v = double.tryParse(value) ?? 0;
                        if (v <= 30 && v >= 1) {
                          tenureBloc.add(
                            TenureUpdated(double.tryParse(value) ?? 0),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: Colors.blue,
                thumbColor: Colors.blue, // Change the color of the thumb
                overlayColor: Colors.blue.withOpacity(0.3),
              ),
              child: Slider(
                value: tenure,
                onChanged: (newTenure) {
                  tenureBloc.add(TenureUpdated(newTenure));
                },
                max: 30,
                min: 1,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 21, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1'),
                  Text('30'),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    tenureController.dispose();
    super.dispose();
  }
}
