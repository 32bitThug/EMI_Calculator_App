// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'calculate_interest_bloc.dart';

sealed class CalculateInterestEvent {}

class LoanAmountUpdated extends CalculateInterestEvent {
  final double loanAmount;
  LoanAmountUpdated(this.loanAmount);
}

class InterestUpdated extends CalculateInterestEvent {
  final double interest;

  InterestUpdated(
    this.interest,
  );
}

class TenureUpdated extends CalculateInterestEvent {
  final double tenure;

  TenureUpdated(this.tenure);
}
