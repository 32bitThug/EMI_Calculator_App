import 'dart:math';

import 'package:emi_calculator/bloc/calculate_interest_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyPieChart extends StatefulWidget {
  const MyPieChart({super.key});

  @override
  State<MyPieChart> createState() => _MyPieChartState();
}

class _MyPieChartState extends State<MyPieChart> {
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

        int totalAmountPayable = (emi * tenureInMonths).round();
        int interestAmount = (emi * tenureInMonths).round() - loanAmount;
        return Center(
          child: SizedBox(
            width: 300, // Set a fixed width for the PieChart
            height: 250, // Set a fixed height for the PieChart
            child: PieChart(
              PieChartData(
                sections: pieChartSections(
                    (loanAmount / totalAmountPayable) * 100,
                    (interestAmount / totalAmountPayable) * 100),
                centerSpaceRadius: 0,
                sectionsSpace: 6,
                startDegreeOffset: -50,
              ),
            ),
          ),
        );
      },
    );
  }

  List<PieChartSectionData> pieChartSections(double value1, double value2) {
    return [
      PieChartSectionData(
        showTitle: false,
        value: value2,
        color: const Color.fromARGB(255, 32, 136, 220),
        // title: '$value1%',
        radius: 98,
      ),
      PieChartSectionData(
        showTitle: false,
        value: value1,
        color: const Color.fromARGB(255, 127, 180, 224),
        // title: '$value2%',
        radius: 100,
        // titleStyle: TextStyle(
        //     fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ];
  }
}
