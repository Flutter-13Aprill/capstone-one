import 'package:app/main.dart';
import 'package:app/screen/widgets/container/container_passenger.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PassengerCounter extends StatefulWidget {
  final int initialCount; // The initial number of passengers. Defaults to 1.
  final ValueChanged<int>?
  onChanged; // An optional callback that is called when the passenger count changes.

  PassengerCounter({super.key, this.initialCount = 1, this.onChanged});

  @override
  State<PassengerCounter> createState() => _PassengerCounterState();
}

class _PassengerCounterState extends State<PassengerCounter> {
  late int _passengerCount; // The state class for the PassengerCounter widget.
  bool _isExpanded = false; // The state class for the PassengerCounter widget.

  @override
  void initState() {
    // The state class for the PassengerCounter widget.

    super.initState();
    _passengerCount =
        widget
            .initialCount; // Initialize the passenger count with the provided initial value.
  }

  void _incrementPassenger() {
    setState(() {
      // Function to increase the passenger count.
      _passengerCount++;
      if (widget.onChanged != null) {
        widget.onChanged!(
          _passengerCount,
        ); // set new value to call back function
      }
    });
  }
  // Function to decrease the passenger count.

  void _decrementPassenger() {
    if (_passengerCount > 1) {
      // Only decrement if the count is greater than 1.
      setState(() {
        _passengerCount--; // Decrement the passenger count.
        if (widget.onChanged != null) {
          // If an onChanged callback is provided, call it with the new count.
          widget.onChanged!(_passengerCount);
        }
      });
    }
  }

  void _toggleExpansion() {
    // If an onChanged callback is provided, call it with the new count.
    setState(() {
      _isExpanded = !_isExpanded; // Invert the _isExpanded boolean.
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Builds the visual representation of the widget.
      onTap:
          _toggleExpansion, // A widget that detects gestures. Here, it's used to toggle the expansion on tap.

      child: ContainerPassenger(
        // Our custom container widget to style the passenger counter.
        child: SingleChildScrollView(
          child: Column(
            // Arranges its children in a vertical line.
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Makes the row take up only the necessary horizontal space.
              Padding(
                // Aligns the children to the start (left in LTR, right in RTL).
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  // Makes the row take up only the necessary horizontal space.
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person_outline),// An icon representing a person.
                    SizedBox(width: 8),// Adds some horizontal space between the icon and the text.
                    Text(
                                            // Displays the "passengers" text, localized using easy_localization.
                      'passengers'.tr(),
                      style:// Check if the current theme is dark (isDarkThem is assumed to be defined elsewhere).
                          !isDarkThem
                              ? Theme.of(context).textTheme.headlineSmall// Use headlineSmall style for light theme.
                              : Theme.of(context).textTheme.titleSmall, // Use titleSmall style for dark theme.
                    ),
                    const Icon(Icons.expand_more), // An icon indicating that the section can be expanded.
                  ],
                ),
              ),
              if (_isExpanded) // if user open the container 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),//icon decremt conuter
                      onPressed: _decrementPassenger,//go _decrementPassenger
                    ),
                    Text(//text displayes 
                      '$_passengerCount',
                      style: Theme.of(context).textTheme.headlineLarge,//themeing 
                    ),
                    IconButton(//icon button with icon add
                      icon: const Icon(Icons.add),
                      onPressed: _incrementPassenger,//go _incrementPassengers
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
