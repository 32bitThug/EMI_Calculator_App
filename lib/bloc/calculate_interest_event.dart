// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'calculate_interest_bloc.dart';

sealed class CalculateInstallmentEvent {}

class LoanAmountUpdated extends CalculateInstallmentEvent {
  final double loanAmount;
  LoanAmountUpdated(this.loanAmount);
}

class InterestUpdated extends CalculateInstallmentEvent {
  final double interest;

  InterestUpdated(
    this.interest,
  );
}

class TenureUpdated extends CalculateInstallmentEvent {
  final double tenure;

  TenureUpdated(this.tenure);
}
