import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformInteropPage extends StatefulWidget {
  const PlatformInteropPage({Key? key}) : super(key: key);

  @override
  State<PlatformInteropPage> createState() => _PlatformInteropPageState();
}

class _PlatformInteropPageState extends State<PlatformInteropPage> {
  static const channel = MethodChannel("lnu.2022/device_name");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Platform Interop"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.headline5!,
          child: Center(
            child: FutureBuilder(
              future: _getDeviceName(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "Seems you are using ${snapshot.data}.",
                  );
                }

                if (snapshot.hasError) {
                  return Text(
                    "Failed to get device name: '${snapshot.error}'.",
                  );
                }

                return const Text("Retrieving device name");
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<String> _getDeviceName() =>
      channel.invokeMethod('getDeviceName').then((value) => value ?? 0);
}
