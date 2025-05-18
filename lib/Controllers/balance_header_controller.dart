// lib/controllers/categories_header_controller.dart

class BalanceHeaderController {
  BalanceData balanceData = BalanceData(
    expense: 0,
    income: 0,
    goalAmount: 20000,
    progressPercent: 0,
    progressLabel: '',
  );
  void addExpense(String amount) {
    double currentBalance = balanceData.getBalance();
    balanceData.expense =
        balanceData.expense + (double.parse(amount.trim()) ?? 0);
    double newBalance = currentBalance - (double.parse(amount.trim()) ?? 0);

    balanceData.setBalance(newBalance);
  }

  void addIncome(String amount) {
    double currentBalance = balanceData.getBalance();
    double newBalance = currentBalance + (double.tryParse(amount.trim()) ?? 0);
    balanceData.income =
        balanceData.income + (double.parse(amount.trim()) ?? 0);
    balanceData.setBalance(newBalance);
  }

  void setGoalAmount(String amount) {
    double newGoalAmount = double.parse(amount.trim());
    balanceData.goalAmount = newGoalAmount;
  }

  double getProgressPercent() {
    double currentBalance = balanceData.getBalance();
    double goalAmount = balanceData.goalAmount;
    double progressPercent = (currentBalance / goalAmount).clamp(0.0, 1.0);
    return progressPercent;
  }

  String getProgressLabel() {
    double progressPercent = getProgressPercent();
    if (progressPercent < 0.5) {
      return 'You are doing great!';
    } else if (progressPercent < 0.8) {
      return 'Keep it up!';
    } else {
      return 'Almost there!';
    }
  }

  void updateProgress() {
    balanceData.progressPercent = getProgressPercent();
    balanceData.progressLabel = getProgressLabel();
  }

  String getBalance() {
    return "\$${balanceData.getBalance().toStringAsFixed(1)}";
  }

  String getIncome() {
    return "\$${balanceData.income.toStringAsFixed(1)}";
  }

  String getExpense() {
    return "\$${balanceData.expense.toStringAsFixed(1)}";
  }

  String getGoalAmount() {
    return "\$${balanceData.goalAmount.toStringAsFixed(1)}";
  }
}

class BalanceData {
  late double _balance;
  double income;
  double expense;
  double goalAmount;
  double progressPercent;
  String progressLabel;
  double getBalance() {
    _balance = income - expense;
    return _balance;
  }

  void setBalance(double value) {
    _balance = value;
  }

  BalanceData({
    required this.income,
    required this.expense,
    required this.goalAmount,
    required this.progressPercent,
    required this.progressLabel,
  });
}
