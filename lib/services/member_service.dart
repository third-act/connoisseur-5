import '../models/member.dart';

class MemberService {
  Member getCurrentMember() => const Member(
        name: 'Elsa',
        memberSince: '2023',
        interests: ['Klockor', 'Resor', 'Bilar'],
        listingsCount: 2,
        purchasesCount: 5,
      );
}
