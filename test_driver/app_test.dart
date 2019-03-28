import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Main navigation', () {
    final SerializableFinder downloadTab = find.byValueKey('download_tab');
    final SerializableFinder poscompTab = find.byValueKey('poscomp_tab');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts navigation on Downloads', () async {
      expect(await driver.getText(downloadTab), 'Downloads');
      await driver.waitFor(find.text('Baixar'));
    });

    test('go to poscomp', () async {
      await driver.tap(poscompTab);

      await driver.waitFor(find.text('POSCOMP 2018'));
    });
  });
}
