class Data {
  final String topLevelAccount;
  final double totalBalance;

  Data({required this.topLevelAccount, required this.totalBalance});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        topLevelAccount: json['top_Level_Account'],
        totalBalance: json['total_Balance']);
  }
}
