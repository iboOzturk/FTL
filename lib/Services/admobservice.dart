
import '../Screens/PuanDukkan/transferpuandukkan.dart' as s;
import 'package:fantasysuperlig/Services/player_api.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../Variables/global.dart' as global;
class AdmobHelper {

  //RewardedAd _rewardedAd;
  RewardedAd _rewardedAd;
  InterstitialAd _interstitialAd;
  static initialization() async {
    if (MobileAds.instance == null) {
      await MobileAds.instance.initialize();
    }
  }

  static BannerAd getBannerAd(){
    BannerAd bAd = new BannerAd(size: AdSize.fullBanner,
        ///test
        //adUnitId: 'ca-app-pub-3940256099942544/6300978111' ,
        ///gerçek
        adUnitId: 'ca-app-pub-2581017309916825/3553701891' ,
        listener: BannerAdListener(
        onAdClosed: (Ad ad){
          print("Ad Closed");

        },
        onAdFailedToLoad: (Ad ad,LoadAdError error){
          ad.dispose();
        },
        onAdLoaded: (Ad ad){
          global.bannerReaklamHakki==0?ad.dispose():
          print('Ad Loaded--------------------------------------');

        },
        onAdOpened: (Ad ad){
          if(global.bannerReaklamHakki==0){
            ad.dispose();
          }
          updateBanner();
          getBannerAds();
          print('Ad opened');
        }
    ), request: AdRequest());
    return bAd;
  }
  void createRewardAd() {
    RewardedAd.load(
      ///Test
       // adUnitId: 'ca-app-pub-3940256099942544/5224354917',

        ///gerçek
        adUnitId: 'ca-app-pub-2581017309916825/5742570941',
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            global.tamam=1;
            print('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            this._rewardedAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
          },
        ));
  }
  void showRewardAd() {
    RewardedAd.load(
        adUnitId: 'ca-app-pub-2581017309916825/5742570941',
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            this._rewardedAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
          },
        ));
    _rewardedAd.show(
        onUserEarnedReward: (RewardedAd ad, RewardItem rewardItem) {
          print('.................REKALM İZLEDİ...............');
          updateReward();
          getRewards();
          getPoints(global.userid);
         // global.goster=1;

          print('Gosterme şeysi: '+global.goster.toString());
          print("Adds Reward is ${rewardItem.amount}");
        }

        );
    _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('$ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        global.goster=1;
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
     //   global.goster=1;
        ad.dispose();
      },
      onAdImpression: (RewardedAd ad) => print('$ad impression occurred.'),
    );
  }

  Future createRewardAd2() {
    RewardedAd.load(
      ///Test
      // adUnitId: 'ca-app-pub-3940256099942544/5224354917',

      ///gerçek
        adUnitId: 'ca-app-pub-2581017309916825/5742570941',
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            this._rewardedAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load: $error');
          },
        ));
  }
}