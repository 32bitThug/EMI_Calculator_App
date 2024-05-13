import 'dart:math';

import 'package:emi_calculator/bloc/calculate_installment_bloc.dart';
import 'package:emi_calculator/ui/widgets/results_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculateInstallmentBloc, CalculateInstallmentState>(
      listener: (context, state) {},
      builder: (context, state) {
        int loanAmount = state.loanAmount.roundToDouble().toInt();
        double monthlyInterestRate = (state.interest) / 1200;
        double tenureInMonths = state.tenure * 12;
        double emi = (loanAmount *
                monthlyInterestRate *
                pow(1 + monthlyInterestRate, tenureInMonths)) /
            (pow(1 + monthlyInterestRate, tenureInMonths) - 1);
        int roundedEmi = emi.round();

        return Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ResultsWidget(
                    title: 'Monthly Home Loan EMI',
                    value: roundedEmi,
                    flag: true,
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  ResultsWidget(
                    title: 'Principal Amount',
                    value: loanAmount,
                  ),
                ],
              ),
              Row(
                children: [
                  ResultsWidget(
                    title: 'Total Amount Payable',
                    value: (emi * tenureInMonths).round(),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  ResultsWidget(
                    title: 'Interest Amount',
                    value: (emi * tenureInMonths).round() - loanAmount,
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

// class RupeeSuperScript extends