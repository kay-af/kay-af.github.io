'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/assets\AssetManifest.json": "1b085322c2c20658a9537d961fa81ff8",
"/assets\assets\content\achievements\ac_adv.jpg": "35a7f97ef19784a57e1560fd9e60b230",
"/assets\assets\content\achievements\ac_c_program.jpg": "6b894c666b693a22a418bbf276d8ccbb",
"/assets\assets\content\achievements\ac_gender_justice.jpg": "5d82212e5cf310ff2b4745a313903341",
"/assets\assets\content\achievements\ac_memento.jpg": "65c2fed38e74d821a7327f8b2d061c12",
"/assets\assets\content\achievements\ac_srey_18.jpg": "fdb5b4d7fc8ccd607d1062d4602b9b58",
"/assets\assets\content\achievements\ac_srey_19.jpg": "26974bb3bdc819cc6f8d45c7af4be423",
"/assets\assets\content\creative\cre_am_vis.gif": "19e676c07b8f4e7b81772f607901723b",
"/assets\assets\content\creative\cre_ascii.gif": "7c364b8f6be5f8c59e2de9b8afcc32c0",
"/assets\assets\content\creative\cre_clock.gif": "8edcf9f891e90b21e5f570611d5b3ef1",
"/assets\assets\content\creative\cre_earth.gif": "c80a9f2d5a6aaef90eea5f5e0ddd755b",
"/assets\assets\content\creative\cre_fabric.gif": "e7183df5c15551b126ecbb3e173bc7cb",
"/assets\assets\content\creative\cre_graham.gif": "4fa71f8832140bcffbe45004cc1623d2",
"/assets\assets\content\creative\cre_img_circles.gif": "cc4594cfb9cab8d13da91e82cf8f4361",
"/assets\assets\content\creative\cre_microscopic.gif": "d49df8c36a7198ce6b4d945d3b9ff6e9",
"/assets\assets\content\creative\cre_mouse_move.gif": "050e1b03083f1952ae5b7fb48003dcb6",
"/assets\assets\content\creative\cre_qsort.gif": "a17ea13129032a81c97bf40acf463703",
"/assets\assets\content\creative\cre_voronoi.gif": "9013f9535a66d864cd54f2f4cb5dce95",
"/assets\assets\content\mobileapps\mobile_eyedropper.apk": "e6ace418102efc4bd49bc81d721d0b8e",
"/assets\assets\content\mobileapps\mobile_eyedropper1.jpg": "f89be5ba751b7e85edb7c9225b84858a",
"/assets\assets\content\mobileapps\mobile_eyedropper2.jpg": "3d9cde9b2ec810d44d49fbf66318c03c",
"/assets\assets\content\mobileapps\mobile_eyedropper3.jpg": "087b0f3a121fbefbc8d8b9b05325e5f7",
"/assets\assets\content\mobileapps\mobile_eyedropper4.jpg": "7c09387af9bf93327dfafcda85e1f266",
"/assets\assets\content\mobileapps\mobile_eyedropper_logo.png": "06dd23fb65d760cd82b89e386e719359",
"/assets\assets\content\mobileapps\mobile_notes_icon.png": "87d10f089c094b89d80a6ebfbc54a4a1",
"/assets\assets\content\mobileapps\mobile_notes_shot1.jpg": "e17109ad01e84653d3c8c686f0b1b58d",
"/assets\assets\content\mobileapps\mobile_notes_shot2.jpg": "c3049bb61efda72b0ad02be3908ea427",
"/assets\assets\content\mobileapps\mobile_note_editor.apk": "b458e85372d88b3c402ca7e41a6ea467",
"/assets\assets\content\renders\render_ai_car.jpg": "830e9e3aa7f7ff38856b6ca097781390",
"/assets\assets\content\renders\render_alarm.jpg": "9efed216b5f95428b9796d5d583e49ef",
"/assets\assets\content\renders\render_apple.jpg": "6363b59b34322d6631763f4612cb8af7",
"/assets\assets\content\renders\render_football.jpg": "fec62403ceda2095b64f4f3a9f7e5548",
"/assets\assets\content\renders\render_guitar.jpg": "0f750cfb534711a665cede56993d62af",
"/assets\assets\content\renders\render_ipad.jpg": "92f29bf561362f638d3c160c484e6310",
"/assets\assets\content\renders\render_journey.jpg": "640a1eb5a5ead15bd710fc0ed7c105f5",
"/assets\assets\content\renders\render_lantern.jpg": "19cec69952de6db534435c8d2504066b",
"/assets\assets\content\renders\render_piano.jpg": "4d0214bd94a15f0b22c4715c88c2f9ea",
"/assets\assets\content\renders\render_restaurant.jpg": "2051abe5aff1909c464c6194755e5a4a",
"/assets\assets\content\renders\render_room.jpg": "df9b8f956ced7f7f2d814af0723668ac",
"/assets\assets\content\softwares\software_asphalt.pptx": "1ba11410c2d9bc9e8968d78897d79a21",
"/assets\assets\content\softwares\software_asphalt1.jpg": "ef4d1362ea6c8e4d756499cd21eecaa9",
"/assets\assets\content\softwares\software_asphalt2.jpg": "fffb6e479126a2cc461fa6f3a57c7b7c",
"/assets\assets\content\softwares\software_asphalt3.jpg": "1fe48d268df746f01ecf331fb6b001ac",
"/assets\assets\content\softwares\software_asphalt4.jpg": "0067b68eddd63464e420679085f1951b",
"/assets\assets\content\softwares\software_asphalt5.jpg": "beb93ab8def82d1dcf5148096f6d90a7",
"/assets\assets\content\softwares\software_asphalt6.jpg": "a3a24238a6ed534744f5674460431271",
"/assets\assets\content\softwares\software_asphalt7.jpg": "af6218ceeb17285538716c0561edb4e6",
"/assets\assets\content\softwares\software_asphalt_video.mp4": "7cd309fe75748fa9224631efced736b6",
"/assets\assets\content\softwares\software_bot1.jpg": "3d764e2e122deaf8660aaeae9528c656",
"/assets\assets\content\softwares\software_bot2.jpg": "730b7fba54523127e89ce4cc0b095af6",
"/assets\assets\content\softwares\software_bot3.jpg": "14aad8535aa6df2ebcdb8a8dda19b6da",
"/assets\assets\content\softwares\software_bot_video.mp4": "f4a1228c03f6724df7dbbcae939236d5",
"/assets\assets\content\softwares\software_uni1.jpg": "cbca3da8ec016a1ed7f718ea0d334f13",
"/assets\assets\content\softwares\software_uni2.jpg": "ec18af3bbf0d26706cc269a5804bea48",
"/assets\assets\content\softwares\software_uni3.jpg": "61cdaf698e488d133182cfcfe1fb1edf",
"/assets\assets\content\softwares\software_uni4.jpg": "eb742d7c55d4461c094a5caab9363641",
"/assets\assets\content\webapps\webapp_chat.jpg": "ba492513054c1774584c419cae0953f7",
"/assets\assets\content\webapps\webapp_spacehero.jpg": "9fa9625a8f5b1387ed65b7f97c233ef6",
"/assets\assets\content\webapps\web_color_tools.jpg": "6567fb04961a4a57a8d62116c891d5ea",
"/assets\assets\images\profile_pic.jpg": "9da9bf837a567031bf3787b113614637",
"/assets\FontManifest.json": "94a2494f1e7ff74a7d0b6cf4f3d4e39d",
"/assets\fonts\MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets\LICENSE": "03ff692325e7dcf9b5cc8c9e69a02105",
"/assets\packages\cupertino_icons\assets\CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets\packages\flutter_icons\fonts\AntDesign.ttf": "3a2ba31570920eeb9b1d217cabe58315",
"/assets\packages\flutter_icons\fonts\Entypo.ttf": "744ce60078c17d86006dd0edabcd59a7",
"/assets\packages\flutter_icons\fonts\EvilIcons.ttf": "140c53a7643ea949007aa9a282153849",
"/assets\packages\flutter_icons\fonts\Feather.ttf": "6beba7e6834963f7f171d3bdd075c915",
"/assets\packages\flutter_icons\fonts\FontAwesome.ttf": "b06871f281fee6b241d60582ae9369b9",
"/assets\packages\flutter_icons\fonts\FontAwesome5_Brands.ttf": "c39278f7abfc798a241551194f55e29f",
"/assets\packages\flutter_icons\fonts\FontAwesome5_Regular.ttf": "f6c6f6c8cb7784254ad00056f6fbd74e",
"/assets\packages\flutter_icons\fonts\FontAwesome5_Solid.ttf": "b70cea0339374107969eb53e5b1f603f",
"/assets\packages\flutter_icons\fonts\Foundation.ttf": "e20945d7c929279ef7a6f1db184a4470",
"/assets\packages\flutter_icons\fonts\Ionicons.ttf": "b2e0fc821c6886fb3940f85a3320003e",
"/assets\packages\flutter_icons\fonts\MaterialCommunityIcons.ttf": "3c851d60ad5ef3f2fe43ebd263490d78",
"/assets\packages\flutter_icons\fonts\MaterialIcons.ttf": "a37b0c01c0baf1888ca812cc0508f6e2",
"/assets\packages\flutter_icons\fonts\Octicons.ttf": "73b8cff012825060b308d2162f31dbb2",
"/assets\packages\flutter_icons\fonts\SimpleLineIcons.ttf": "d2285965fe34b05465047401b8595dd0",
"/assets\packages\flutter_icons\fonts\weathericons.ttf": "4618f0de2a818e7ad3fe880e0b74d04a",
"/assets\packages\flutter_icons\fonts\Zocial.ttf": "5cdf883b18a5651a29a4d1ef276d2457",
"/icons\Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/icons\Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/index.html": "11f1c4a56836fdfde026145d9bae9e0b",
"/main.dart.js": "0df8568d793e6fba06e72eacbeebabce",
"/manifest.json": "14e919b7b1dde549ab334b7ee3ce8412"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
