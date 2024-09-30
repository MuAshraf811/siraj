import 'dart:async';
import 'package:geolocator/geolocator.dart';

class LocationService {
  LocationService._();

  static final StreamController<LocationModel> _controller =
      StreamController<LocationModel>();
  static Stream<LocationModel> get locationStream => _controller.stream;
  static late LocationModel locationMode;

  static Future<void> handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, request the user to enable them
      await Geolocator.openLocationSettings();
      throw Exception('Location services are disabled.');
    }

    // Check for permission status
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission denied
        throw Exception('Location permission denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever
      throw Exception(
          'Location permissions are permanently denied. Please enable them in app settings.');
    }

    // Get current location
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    locationMode = LocationModel(
      longitude: currentPosition.longitude,
      latitude: currentPosition.latitude,
    );

    _controller.add(locationMode);

    // Listen to location changes
    Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
                accuracy: LocationAccuracy.high, distanceFilter: 10))
        .listen((Position position) {
      locationMode = LocationModel(
        longitude: position.longitude,
        latitude: position.latitude,
      );
      _controller.add(locationMode);
    });
  }
}

class LocationModel {
  final double longitude;
  final double latitude;

  LocationModel({
    required this.longitude,
    required this.latitude,
  });
}
