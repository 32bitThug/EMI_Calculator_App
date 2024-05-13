// import 'package:emi_calculator/bloc/loan_amount_bloc.dart';
import 'package:emi_calculator/bloc/calculate_interest_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Interest extends StatefulWidget {
  const Interest({super.key});

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  // Initial loan amount value
  TextEditingController interestController = TextEditingController();
  @override
  void initState() {
    super.initState();
    interestController.text = '8.75';
  }

  @override
  Widget build(BuildContext context) {
    final calculateInterestBloc =
        BlocProvider.of<CalculateInstallmentBloc>(context);
    return BlocConsumer<CalculateInstallmentBloc, CalculateInstallmentState>(
      listener: (context, state) {
        String str = state.interest.toString();
        if (str.length > 4) {
          interestController.text =
              (double.tryParse(str)!.toStringAsFixed(2)).toString();
        }
      },
      builder: (context, state) {
        double interest = state.interest;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Interest Rate (% P.A.)'),
                  SizedBox(
                    height: 35,
                    width: 80,
                    child: TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.only(bottom: 3, left: 8),
                          suffixText: ' % '),

                      controller: interestController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),

                      // used to set loan amount
                      onChanged: (value) {
                        double v = double.tryParse(value) ?? 0;
                        if (v <= 15 && v >= 0.5) {
                          calculateInterestBloc.add(
                            InterestUpdated(double.tryParse(value) ?? 0),
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
                value: interest,
                onChanged: (newLoanAmount) {
                  calculateInterestBloc.add(InterestUpdated(newLoanAmount));
                },
                max: 15,
                min: 0.5,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 21, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('0.5'),
                  Text('15'),
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
    interestController.dispose();
    super.dispose();
  }
}
