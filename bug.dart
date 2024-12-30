```dart
import 'dart:async';

Future<void> fetchData() async {
  try {
    // Simulate an API call that might throw an exception
    await Future.delayed(Duration(seconds: 2));
    if (/* some condition */ false) {
      throw Exception('API request failed');
    }
    print('Data fetched successfully!');
  } on TimeoutException catch (e) {
    print('Request timed out: $e');
    // Here is where the bug occurs. Re-throwing the exception without adding more context.
    rethrow;
  } catch (e) {
    print('An error occurred: $e');
    // The original exception is lost
  }
}

void main() async {
  await fetchData();
}
```