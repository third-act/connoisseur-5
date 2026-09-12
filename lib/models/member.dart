class Member {
  const Member({
    required this.name,
    required this.memberSince,
    required this.interests,
    this.listingsCount = 0,
    this.purchasesCount = 0,
  });

  final String name;
  final String memberSince;
  final List<String> interests;
  final int listingsCount;
  final int purchasesCount;
}
