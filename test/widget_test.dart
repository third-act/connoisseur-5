import 'package:flutter_test/flutter_test.dart';
import 'package:connoisseur_club/app.dart';

void main() {
  testWidgets('App renders splash', (WidgetTester tester) async {
    await tester.pumpWidget(const ConnoisseurApp());
    expect(find.text('CONNOISSEUR'), findsOneWidget);
    await tester.pump(const Duration(seconds: 3));
  });
}
