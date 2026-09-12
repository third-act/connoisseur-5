import '../models/event.dart';

class EventService {
  List<ClubEvent> getUpcomingEvents() => const [
        ClubEvent(
          id: 'e1',
          title: 'Motordag på NK',
          date: '15 maj 2026',
          location: 'NK Stockholm',
          imageAsset: 'assets/images/event_nk.jpg',
          spotsLeft: 12,
        ),
        ClubEvent(
          id: 'e2',
          title: 'Connoisseur Summer Gala',
          date: '28 juni 2026',
          location: 'Grand Hôtel, Stockholm',
          imageAsset: 'assets/images/event_lifestyle.jpg',
          spotsLeft: 8,
        ),
        ClubEvent(
          id: 'e3',
          title: 'Klockauktion — preview',
          date: '10 juli 2026',
          location: 'Breitling Boutique',
          imageAsset: 'assets/images/watch_breitling.jpg',
          spotsLeft: 20,
        ),
        ClubEvent(
          id: 'e4',
          title: 'Segling & Champagne',
          date: '2 aug 2026',
          location: 'Marstrand',
          imageAsset: 'assets/images/event_square.jpg',
          spotsLeft: 6,
        ),
      ];
}
