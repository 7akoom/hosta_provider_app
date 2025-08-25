import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapLauncher {
  static Future<void> openMap(
    BuildContext context, {
    required double latitude,
    required double longitude,
  }) async {
    String url;
    if (Platform.isIOS) {
      url = 'https://maps.apple.com/?daddr=$latitude,$longitude';
    } else if (Platform.isAndroid) {
      url = 'geo:$latitude,$longitude?q=$latitude,$longitude';
    } else {
      url =
          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    }

    final Uri uri = Uri.parse(url);
    bool launched = false;

    if (await canLaunchUrl(uri)) {
      launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!launched) {
        launched = await launchUrl(uri, mode: LaunchMode.platformDefault);
      }
      if (!launched) {
        launched = await launchUrl(uri, mode: LaunchMode.inAppWebView);
      }
    }

    if (!launched) {
      // fallback to browser
      final alternatives = [
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude',
        'https://maps.google.com/maps?q=$latitude,$longitude',
      ];
      for (final alt in alternatives) {
        final u = Uri.parse(alt);
        if (await canLaunchUrl(u)) {
          launched = await launchUrl(u, mode: LaunchMode.externalApplication);
          if (launched) break;
        }
      }
      if (!launched && context.mounted) {
        _showMapWebView(context, latitude, longitude);
      }
    }

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            launched
                ? 'Map application opened successfully!'
                : 'Could not open map application. Please make sure you have a map app installed.',
          ),
          backgroundColor: launched ? Colors.green : Colors.red,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  static void _showMapWebView(
    BuildContext context,
    double latitude,
    double longitude,
  ) {
    final mapUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.8,
          child: WebViewWidget(
            controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..loadRequest(Uri.parse(mapUrl)),
          ),
        ),
      ),
    );
  }
}
