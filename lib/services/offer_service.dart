import '../models/offer.dart';

class OfferService {
  List<PartnerOffer> getPartnerOffers() => const [
        PartnerOffer(
          id: 'o1',
          title: '20% på spa-behandlingar',
          partner: 'Grand Hôtel Spa',
          description: 'Exklusivt för medlemmar. Gäller alla behandlingar över 60 min.',
          imageAsset: 'assets/images/editorial_luxury.webp',
          validUntil: '30 jun 2026',
        ),
        PartnerOffer(
          id: 'o2',
          title: 'Privat visning — nya modeller',
          partner: 'Porsche Center',
          description: 'Boka en privat visning av 911 och Taycan Turbo S.',
          imageAsset: 'assets/images/editorial_cars.webp',
          validUntil: '15 sep 2026',
        ),
        PartnerOffer(
          id: 'o3',
          title: 'Medlemspris på charter',
          partner: 'Scandinavian Air Charter',
          description: '10% rabatt på alla inrikes charter under sommaren.',
          imageAsset: 'assets/images/editorial_travel.webp',
          validUntil: '31 aug 2026',
        ),
        PartnerOffer(
          id: 'o4',
          title: 'Vinprovning med sommelier',
          partner: 'Systembolaget Privatimport',
          description: 'Kvällsprovning av sällsynta Bordeaux-viner.',
          imageAsset: 'assets/images/editorial_plain.webp',
          validUntil: '1 okt 2026',
        ),
      ];
}
