class ClubEvent {
  const ClubEvent({
    required this.id,
    required this.title,
    required this.date,
    required this.location,
    required this.imageAsset,
    this.spotsLeft,
  });

  final String id;
  final String title;
  final String date;
  final String location;
  final String imageAsset;
  final int? spotsLeft;
}
