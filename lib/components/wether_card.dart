import 'package:flutter/material.dart';
import 'package:flutter_weather_project/components/image_widget.dart';
import 'package:flutter_weather_project/extentions/sizes.dart';
import 'package:flutter_weather_project/models/weather.dart';

class WetherCard extends StatelessWidget {
  const WetherCard({super.key, required this.wetherObj});

  final Weather wetherObj;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: context.getHeight() - 350,
        width: context.getWidth() - 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${wetherObj.current?.lastUpdated}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                const Spacer(),
                const Icon(Icons.location_on_outlined),
                Text('${wetherObj.location?.name}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageWidget(
                    path: wetherObj.current!.condition!.icon!,
                    imgWidth: 200,
                    imgHeight: 200,
                  ),
                  Text(
                    '${wetherObj.current?.tempC} C',
                    style: const TextStyle(
                        fontSize: 36, fontWeight: FontWeight.bold),
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${wetherObj.location?.localtime}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    '${wetherObj.current?.condition?.text}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.water_drop_outlined,
                  ),
                  Text(
                    'Humadity: ${wetherObj.current?.humidity} % ',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.wind_power_outlined,
                  ),
                  Text(
                    'Wind: ${wetherObj.current?.windKph} KPH',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
