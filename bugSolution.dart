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
    // Re-throw exception with more context
    throw Exception('Request timed out: ${e.message}  in fetchData()');
  } catch (e, stacktrace) {
    print('An error occurred: $e');
    // Add the stacktrace for better debugging
    print('Stacktrace: $stacktrace');
    // Re-throw with more context including the original error message
    throw Exception('An error occurred in fetchData(): ${e.toString()}');
  }
}

void main() async {
  try {
    await fetchData();
  } catch (e) {
      print('Top level error handler: $e');
  }
}
```