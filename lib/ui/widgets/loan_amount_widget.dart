// import 'package:emi_calculator/bloc/loan_amount_bloc.dart';
import 'package:emi_calculator/bloc/calculate_installment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoanAmount extends StatefulWidget {
  const LoanAmount({super.key});

  @override
  State<LoanAmount> createState() => _LoanAmountState();
}

class _LoanAmountState extends State<LoanAmount> {
  // Initial loan amount value
  TextEditingController loanAmountController = TextEditingController();
  @override
  void initState() {
    super.initState();
    loanAmountController.text = '2500000';
  }

  @override
  Widget build(BuildContext context) {
    final loanAmountBloc = BlocProvider.of<CalculateInstallmentBloc>(context);
    return BlocConsumer<CalculateInstallmentBloc, CalculateInstallmentState>(
      listener: (context, state) {
        // if (state is LoanAmountUpdatedState) {
        loanAmountController.text = state.loanAmount.toStringAsFixed(0);
        // }
      },
      builder: (context, state) {
        double loanAmount =
            2500000; // Default value if state is not LoanAmountUpdatedState
        // if (state is LoanAmountUpdatedState) {
        loanAmount = state.loanAmount;
        // }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Loan Amount'),
                  SizedBox(
                    height: 35,
                    width: 130,
                    child: TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.only(bottom: 3, left: 8),
                          prefixText: '\u20B9 '),

                      controller: loanAmountController,
                      keyboardType: TextInputType.number,

                      // used to set loan amount
                      onChanged: (value) {
                        double v = double.tryParse(value) ?? 0;
                        if (v <= 100000000 && v >= 100000) {
                          loanAmountBloc.add(
                            LoanAmountUpdated(double.tryParse(value) ?? 0),
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
                value: loanAmount,
                onChanged: (newLoanAmount) {
                  loanAmountBloc.add(LoanAmountUpdated(newLoanAmount));
                },
                max: 100000000,
                min: 100000,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 21, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\u20B91L'),
                  Text('\u20B910Cr'),
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
    loanAmountController.dispose();
    super.dispose();
  }
}
