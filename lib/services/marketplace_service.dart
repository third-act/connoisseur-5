import '../models/listing.dart';

class MarketplaceService {
  static const _images = 'assets/images';

  List<Listing> getFeaturedListings() => [
        const Listing(
          id: '1',
          title: 'Rolex Submariner Date',
          category: 'Klockor',
          price: 145000,
          imageAsset: '$_images/watch_breitling.jpg',
          sellerName: 'Erik L.',
          location: 'Stockholm',
          description:
              'Rolex Submariner Date, referens 126610LN. Komplett med box och papper. Servad 2025.',
          condition: 'Utmärkt',
        ),
        const Listing(
          id: '2',
          title: 'Porsche 911 Carrera S',
          category: 'Bilar',
          price: 1295000,
          imageAsset: '$_images/editorial_cars.webp',
          sellerName: 'Anna K.',
          location: 'Göteborg',
          description:
              'Porsche 911 Carrera S (992), 2021. 12 000 km, fullständig servicehistorik.',
          condition: 'Som ny',
        ),
        const Listing(
          id: '3',
          title: 'Azimut 55 Flybridge',
          category: 'Båtar',
          price: 8900000,
          imageAsset: '$_images/editorial_luxury.webp',
          sellerName: 'Marcus H.',
          location: 'Marstrand',
          description:
              'Azimut 55 Flybridge, 2019. Två Volvo Penta D11, fullt utrustad.',
          condition: 'Utmärkt',
        ),
        const Listing(
          id: '4',
          title: 'Privatjet charter — Nice',
          category: 'Resor',
          price: 185000,
          imageAsset: '$_images/editorial_travel.webp',
          sellerName: 'Sofia N.',
          location: 'Arlanda',
          description:
              'Charterplats Citation XLS, Arlanda–Nice tur/retur. Datum flexibla.',
          condition: 'N/A',
        ),
        const Listing(
          id: '5',
          title: 'Breitling Navitimer B01',
          category: 'Klockor',
          price: 72000,
          imageAsset: '$_images/watch_breitling.jpg',
          sellerName: 'Johan P.',
          location: 'Malmö',
          description: 'Breitling Navitimer B01 Chronograph 43. Originalband och box.',
          condition: 'Mycket bra',
        ),
        const Listing(
          id: '6',
          title: 'Vintage vinlåda — Bordeaux',
          category: 'Vin',
          price: 42000,
          imageAsset: '$_images/editorial_plain.webp',
          sellerName: 'Lena W.',
          location: 'Uppsala',
          description: '12 flaskor Premier Cru 2005–2010. Lagrad i klimatkontrollerat källar.',
          condition: 'Utmärkt',
        ),
      ];

  Listing? getListingById(String id) {
    try {
      return getFeaturedListings().firstWhere((l) => l.id == id);
    } catch (_) {
      return null;
    }
  }

  List<String> getCategories() =>
      ['Alla', 'Klockor', 'Bilar', 'Båtar', 'Resor', 'Vin'];
}
