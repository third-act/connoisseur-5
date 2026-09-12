class PartnerOffer {
  const PartnerOffer({
    required this.id,
    required this.title,
    required this.partner,
    required this.description,
    required this.imageAsset,
    this.validUntil,
  });

  final String id;
  final String title;
  final String partner;
  final String description;
  final String imageAsset;
  final String? validUntil;
}
