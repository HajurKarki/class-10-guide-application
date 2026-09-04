import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  AdService._();

  static final AdService instance = AdService._();

  static String get _interstitialAdUnitId {
    if (kReleaseMode) return 'ca-app-pub-4742284750126510/5021190097';
    return 'ca-app-pub-3940256099942544/1033173712'; // Google test interstitial
  }

  static const Duration _minInterval = Duration(minutes: 5);

  DateTime? _lastShownAt;
  InterstitialAd? _interstitialAd;
  bool _isLoadingInterstitial = false;

  Future<void> initialize() async {
    await _loadInterstitial();
  }

  /// Call this on every meaningful user action — screen change, quiz finished,
  /// chapter completed, etc. The ad will only show if the cooldown has passed.
  void recordBigStep() {
    final now = DateTime.now();
    final cooledDown = _lastShownAt == null ||
        now.difference(_lastShownAt!) >= _minInterval;

    if (cooledDown) {
      _showInterstitial();
    }
  }

  Future<void> _loadInterstitial() async {
    if (_isLoadingInterstitial || _interstitialAd != null) return;
    _isLoadingInterstitial = true;

    await InterstitialAd.load(
      adUnitId: _interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isLoadingInterstitial = false;
        },
        onAdFailedToLoad: (error) {
          _isLoadingInterstitial = false;
          _interstitialAd = null;
        },
      ),
    );
  }

  void _showInterstitial() {
    final ad = _interstitialAd;
    if (ad == null) {
      // Ad not ready yet — start cooldown anyway so we don't hammer the user
      // with retries on every subsequent big step until the ad loads.
      _lastShownAt = DateTime.now();
      _loadInterstitial();
      return;
    }

    _interstitialAd = null;
    _lastShownAt = DateTime.now(); // start cooldown from show time

    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _loadInterstitial();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _loadInterstitial();
      },
    );

    ad.show();
  }
}
