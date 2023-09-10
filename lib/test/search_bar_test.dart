import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tut_todo/util/search_bar.dart' as CustomSearchBar;

void main() async {
  // Initialize Hive for testing
  await Hive.initFlutter();

  // Open a Hive box (you can use a different name for testing)
  var box = await Hive.openBox('mytestbox');

  // Run the tests
  testWidgets('SearchBar Widget Test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomSearchBar.SearchBar(
            onSearchChanged: (value) {
              // Define what happens when search changes here.
              // For example, you can check if the search value is updated.
            },
          ),
        ),
      ),
    );

    // Verify that the SearchBar widget is rendered.
    expect(find.byType(CustomSearchBar.SearchBar), findsOneWidget);

    // TODO: Add interaction and expectation tests here.
  });

  // Close the Hive box after testing
  await box.close();
}
