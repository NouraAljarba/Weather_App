import 'package:flutter/material.dart';
import 'package:flutter_weather_project/components/app_bar.dart';
import 'package:flutter_weather_project/components/forecast_card.dart';
import 'package:flutter_weather_project/components/wether_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_project/bloc/api_bloc/api_bloc.dart';
import 'package:flutter_weather_project/constants/spaces.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.city});
  final String city;
  @override
  Widget build(BuildContext context) {
    context.read<ApiBloc>().add(GetWetherEvent(cityApi: city));
    return Scaffold(
      appBar: appBarWidget(title: ''),
      body: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state) {
          if (state is GetWeatherLoadingState) {
            return const CircularProgressIndicator();
          } else if (state is GetWeatherSuccsfulState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        WetherCard(
                          wetherObj: state.wether,
                        ),
                        ResponsiveSpacing.height(context, small),
                        ForecastCard(city: city),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (state is GetWetherFaildState) {
            return const Text('Error');
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
