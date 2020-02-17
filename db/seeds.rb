require "open-uri"
require "nokogiri"

# method to get resort URLs
def scrape_urls(url)
  urls = []
  html_content = open(url).read
  doc = Nokogiri::HTML(html_content)

  doc.search('#resortList .panel .panel-body .h3 a').each_with_index do |element, index|
    urls << "#{element["href"]} "
    # urls << "\n"
  end
  return urls
end

# pages URLs scraped from
pages = ["https://www.skiresort.info/ski-resorts/japan/",
  "https://www.skiresort.info/ski-resorts/japan/page/2/"]

# calling scrape_urls method to output list of URLs
# pages.each do |page|
#   puts scrape_urls(page)
# end

puts 'Creating resorts...'

Resort.create(
  name: 'Niseko United, Annupuri, Grand Hirafu, Hanazono, Niseko Village',
  address: 'Annupuri Village, Hanazono Resort, Hirafu Village, Kutchan, Niseko, Niseko Village, Yamada',
  latitude: 42.8645,
  longitude: 140.701926,
  bottom_elevation: 255,
  top_elevation: 1188,
  slopes_length: 50.8,
  lifts: 31,
  adult_price: 8000,
  url_path: 'niseko-united-annupurigrand-hirafuhanazononiseko-village',
  uid: '3686'
)

Resort.create(
  name: 'Rusutsu',
  address: 'Rusutsu, Rusutsu Resort',
  latitude: 42.751270,
  longitude: 140.900625,
  bottom_elevation: 400,
  top_elevation: 994,
  slopes_length: 42,
  lifts: 18,
  adult_price: 6200,
  url_path: 'rusutsu',
  uid: '4157'
)

Resort.create(
  name: 'Furano',
  address: 'Furano',
  latitude: 43.325396,
  longitude: 142.353710,
  bottom_elevation: 245,
  top_elevation: 1074,
  slopes_length: 32,
  lifts: 9,
  adult_price: 6000,
  url_path: 'furano',
  uid: '2458'
)

Resort.create(
  name: 'Sahoro',
  address: 'Sahoro Resort, Shintoku',
  latitude: 43.174223,
  longitude: 142.807995,
  bottom_elevation: 410,
  top_elevation: 1030,
  slopes_length: 25,
  lifts: 8,
  adult_price: 5600,
  url_path: 'sahoro',
  uid: '4172'
)

Resort.create(
  name: 'Naeba (Mt. Naeba)',
  address: 'Naeba Ski Resort, Yuzawa',
  latitude: 36.793094,
  longitude: 138.784030,
  bottom_elevation: 900,
  top_elevation: 1789,
  slopes_length: 20,
  lifts: 15,
  adult_price: 6000,
  url_path: 'naeba-mt-naeba',
  uid: '3621'
)

Resort.create(
  name: 'Shigakogen Mountain Resort',
  address: 'Yamanouchi',
  latitude: 36.731627,
  longitude: 138.507181,
  bottom_elevation: 1335,
  top_elevation: 2307,
  slopes_length: 83,
  lifts: 58,
  adult_price: 5500,
  url_path: 'shigakogen-mountain-resort',
  uid: '5013'
)

Resort.create(
  name: 'Myoko Suginohara',
  address: nil,
  latitude: 36.855696,
  longitude: 138.156883,
  bottom_elevation: 731,
  top_elevation: 1855,
  slopes_length: 50,
  lifts: 5,
  adult_price: 4800,
  url_path: 'myoko-suginohara',
  uid: '3615'
)

Resort.create(
  name: 'Kiroro',
  address: 'Akaigawa, Kiroro Resort, Tokiwa',
  latitude: 43.067751,
  longitude: 140.990616,
  bottom_elevation: 520,
  top_elevation: 1180,
  slopes_length: 30,
  lifts: 10,
  adult_price: 5500,
  url_path: 'kiroro',
  uid: '3000'
)

Resort.create(
  name: 'Nozawa Onsen',
  address: 'Nozawa Onsen',
  latitude: 36.919988,
  longitude: 138.452368,
  bottom_elevation: 565,
  top_elevation: 1650,
  slopes_length: 44.5,
  lifts: 18,
  adult_price: 5200,
  url_path: 'nozawa-onsen',
  uid: '338'
)

Resort.create(
  name: 'Appi Kogen',
  address: nil,
  latitude: 40.001797,
  longitude: 140.969829,
  bottom_elevation: 500,
  top_elevation: 1328,
  slopes_length: 45.1,
  lifts: 18,
  adult_price: 5900,
  url_path: 'appi-kogen',
  uid: '1731'
)

Resort.create(
  name: 'Hakuba Iwatake Mountain Resort',
  address: 'Hakuba',
  latitude: 36.71675,
  longitude: 137.857169,
  bottom_elevation: 750,
  top_elevation: 1289,
  slopes_length: 50,
  lifts: 12,
  adult_price: 4400,
  url_path: 'hakuba-iwatake-mountain-resort',
  uid: '2827'
)

Resort.create(
  name: 'Happo-One, Hakuba',
  address: 'Hakuba',
  latitude: 36.701939,
  longitude: 137.836833,
  bottom_elevation: 760,
  top_elevation: 1831,
  slopes_length: 52,
  lifts: 22,
  adult_price: 5500,
  url_path: 'happo-one-hakuba',
  uid: '2612'
)

Resort.create(
  name: 'Zao Onsen',
  address: 'Za\u014d Onsen',
  latitude: 38.161638,
  longitude: 140.395062,
  bottom_elevation: 780,
  top_elevation: 1661,
  slopes_length: 50,
  lifts: 38,
  adult_price: 5000,
  url_path: 'zao-onsen',
  uid: '5063'
)

Resort.create(
  name: 'Takasu Snow Park',
  address: nil,
  latitude: 35.999153,
  longitude: 136.876967,
  bottom_elevation: 950,
  top_elevation: 1550,
  slopes_length: 24,
  lifts: 5,
  adult_price: 4900,
  url_path: 'takasu-snow-park',
  uid: '4607'
)

Resort.create(
  name: 'Mitsumata, Kagura, Tashiro (Mt. Naeba)',
  address: 'Yuzawa',
  latitude: 36.846247,
  longitude: 138.776207,
  bottom_elevation: 620,
  top_elevation: 1845,
  slopes_length: 25,
  lifts: 23,
  adult_price: 6000,
  url_path: 'mitsumatakaguratashiro-mt-naeba',
  uid: '3434'
)

Resort.create(
  name: 'Yuzawa Kogen, Gala Yuzawa, Ishiuchi Maruyama',
  address: 'Ishiuchi, Yuzawa',
  latitude: 36.951134,
  longitude: 138.799201,
  bottom_elevation: 256,
  top_elevation: 1181,
  slopes_length: 33.8,
  lifts: 30,
  adult_price: 4600,
  url_path: 'yuzawa-kogengala-yuzawaishiuchi-maruyama',
  uid: '2466'
)

Resort.create(
  name: 'Lotte Arai Resort',
  address: nil,
  latitude: 36.990813,
  longitude: 138.180073,
  bottom_elevation: 329,
  top_elevation: 1280,
  slopes_length: 16,
  lifts: 5,
  adult_price: 4500,
  url_path: 'lotte-arai-resort',
  uid: '1734'
)

Resort.create(
  name: 'Hakuba 47, Goryu',
  address: 'Hakuba',
  latitude: 36.663107,
  longitude: 137.835618,
  bottom_elevation: 750,
  top_elevation: 1676,
  slopes_length: 23.7,
  lifts: 19,
  adult_price: 5000,
  url_path: 'hakuba-47goryu',
  uid: '2532'
)

Resort.create(
  name: 'Aomori Spring',
  address: 'Ajigasawa',
  latitude: 40.695086,
  longitude: 140.282257,
  bottom_elevation: 396,
  top_elevation: 921,
  slopes_length: 20,
  lifts: 5,
  adult_price: nil,
  url_path: 'aomori-spring',
  uid: '3642'
)

Resort.create(
  name: 'Myoko Akakura',
  address: 'Akakura, Tagiri',
  latitude: 36.890936,
  longitude: 138.175300,
  bottom_elevation: 687,
  top_elevation: 1491,
  slopes_length: 20,
  lifts: 21,
  adult_price: 4800,
  url_path: 'myoko-akakura',
  uid: '1657'
)

Resort.create(
  name: 'Palcall Tsumagoi',
  address: nil,
  latitude: 36.557128,
  longitude: 138.463878,
  bottom_elevation: 1370,
  top_elevation: 2100,
  slopes_length: 15,
  lifts: 5,
  adult_price: 4200,
  url_path: 'palcall-tsumagoi',
  uid: '3850'
)

Resort.create(
  name: 'Yubari Resort, Mount Racey',
  address: nil,
  latitude: 43.050794,
  longitude: 141.969642,
  bottom_elevation: 298,
  top_elevation: 702,
  slopes_length: 15.1,
  lifts: 5,
  adult_price: 4752,
  url_path: 'yubari-resort-mount-racey',
  uid: '3547'
)

Resort.create(
  name: 'Hakodate Nanae',
  address: nil,
  latitude: 41.986453,
  longitude: 140.746827,
  bottom_elevation: 261,
  top_elevation: 950,
  slopes_length: 11.8,
  lifts: 3,
  adult_price: 4800,
  url_path: 'hakodate-nanae',
  uid: '2592'
)

Resort.create(
  name: 'Yakebitaiyama',
  address: 'Yamanouchi',
  latitude: 36.746749,
  longitude: 138.524238,
  bottom_elevation: 1550,
  top_elevation: 2009,
  slopes_length: 15.6,
  lifts: 5,
  adult_price: 5500,
  url_path: 'yakebitaiyama',
  uid: '33080'
)

Resort.create(
  name: 'Meiho',
  address: nil,
  latitude: 35.942366,
  longitude: 137.042436,
  bottom_elevation: 900,
  top_elevation: 1600,
  slopes_length: 15.5,
  lifts: 5,
  adult_price: 4500,
  url_path: 'meiho',
  uid: '3368'
)

Resort.create(
  name: 'Hoshino Resorts Tomamu',
  address: nil,
  latitude: 43.063989,
  longitude: 142.631727,
  bottom_elevation: 520,
  top_elevation: 1239,
  slopes_length: 21,
  lifts: 11,
  adult_price: 5400,
  url_path: 'hoshino-resorts-tomamu',
  uid: '1689'
)

Resort.create(
  name: 'Shizukuishi',
  address: nil,
  latitude: 39.775759,
  longitude: 140.929731,
  bottom_elevation: 426,
  top_elevation: 1217,
  slopes_length: 20,
  lifts: 6,
  adult_price: 4200,
  url_path: 'shizukuishi',
  uid: '4332'
)

Resort.create(
  name: 'Hachi Kita Kogen',
  address: nil,
  latitude: 35.409097,
  longitude: 134.552604,
  bottom_elevation: 580,
  top_elevation: 1221,
  slopes_length: 20,
  lifts: 10,
  adult_price: 4500,
  url_path: 'hachi-kita-kogen',
  uid: '2584'
)

Resort.create(
  name: 'Sapporo Kokusai, Jozankei Kogen',
  address: 'Sapporo',
  latitude: 43.071553,
  longitude: 141.082348,
  bottom_elevation: 630,
  top_elevation: 1100,
  slopes_length: 11,
  lifts: 5,
  adult_price: 4500,
  url_path: 'sapporo-kokusai-jozankei-kogen',
  uid: '2874'
)

Resort.create(
  name: 'Ontake 2240',
  address: nil,
  latitude: 35.862441,
  longitude: 137.527548,
  bottom_elevation: 1680,
  top_elevation: 2240,
  slopes_length: 14.1,
  lifts: 5,
  adult_price: 3900,
  url_path: 'ontake-2240',
  uid: '3791'
)

Resort.create(
  name: 'Aizu Kogen Takatsue',
  address: nil,
  latitude: 37.107671,
  longitude: 139.616758,
  bottom_elevation: 943,
  top_elevation: 1650,
  slopes_length: 20,
  lifts: 9,
  adult_price: 4200,
  url_path: 'aizu-kogen-takatsue',
  uid: '1651'
)

Resort.create(
  name: 'Aizu Kogen Daikurayama',
  address: nil,
  latitude: 37.181125,
  longitude: 139.636123,
  bottom_elevation: 838,
  top_elevation: 1200,
  slopes_length: 11,
  lifts: 5,
  adult_price: 4000,
  url_path: 'aizu-kogen-daikurayama',
  uid: '1648'
)

Resort.create(
  name: 'Davos, Taro (Sugadaira Kogen)',
  address: 'Sugadairak\u014dgen, Ueda',
  latitude: 36.5321686,
  longitude: 138.3443042,
  bottom_elevation: 1270,
  top_elevation: 1597,
  slopes_length: 21.3,
  lifts: 15,
  adult_price: 4500,
  url_path: 'davostaro-sugadaira-kogen',
  uid: '4524'
)

Resort.create(
  name: 'Zao Eboshi',
  address: 'Za\u014d',
  latitude: 38.12556,
  longitude: 140.528483,
  bottom_elevation: 650,
  top_elevation: 1350,
  slopes_length: 12.1,
  lifts: 8,
  adult_price: 4500,
  url_path: 'zao-eboshi',
  uid: '5061'
)

Resort.create(
  name: 'Minakami Houdaigi',
  address: nil,
  latitude: 36.836909,
  longitude: 139.079326,
  bottom_elevation: 830,
  top_elevation: 1400,
  slopes_length: 12.6,
  lifts: 7,
  adult_price: 4300,
  url_path: 'minakami-houdaigi',
  uid: '3409'
)

Resort.create(
  name: 'Grandeco Snow Resort',
  address: nil,
  latitude: 37.695771,
  longitude: 140.132921,
  bottom_elevation: 1010,
  top_elevation: 1590,
  slopes_length: 10.8,
  lifts: 5,
  adult_price: 4700,
  url_path: 'grandeco-snow-resort',
  uid: '2545'
)

Resort.create(
  name: 'Nomugi Pass, Nomugitoge',
  address: nil,
  latitude: 36.048417,
  longitude: 137.709306,
  bottom_elevation: 1400,
  top_elevation: 2130,
  slopes_length: 7.9,
  lifts: 4,
  adult_price: 4000,
  url_path: 'nomugi-pass-nomugitoge',
  uid: '3698'
)

Resort.create(
  name: 'Okushiga Kogen',
  address: nil,
  latitude: 36.779627,
  longitude: 138.527935,
  bottom_elevation: 1430,
  top_elevation: 2009,
  slopes_length: 8,
  lifts: 6,
  adult_price: 5500,
  url_path: 'okushiga-kogen',
  uid: '3774'
)

Resort.create(
  name: 'Panorama Area, Hachimantai',
  address: nil,
  latitude: 39.893374,
  longitude: 140.977224,
  bottom_elevation: 540,
  top_elevation: 1000,
  slopes_length: 11,
  lifts: 4,
  adult_price: nil,
  url_path: 'panorama-area-hachimantai',
  uid: '2887'
)

Resort.create(
  name: 'Ani, Mt. Moriyoshi',
  address: 'Anikaginodaki',
  latitude: 39.955404,
  longitude: 140.491715,
  bottom_elevation: 543,
  top_elevation: 1210,
  slopes_length: 7.6,
  lifts: 3,
  adult_price: 3600,
  url_path: 'ani-mt-moriyoshi',
  uid: '1712'
)

Resort.create(
  name: 'Adatara Kogen Resort',
  address: nil,
  latitude: 37.622203,
  longitude: 140.325118,
  bottom_elevation: 850,
  top_elevation: 1220,
  slopes_length: 10,
  lifts: 5,
  adult_price: nil,
  url_path: 'adatara-kogen-resort',
  uid: '1635'
)

Resort.create(
  name: 'Grand Sunpia Inawashiro',
  address: nil,
  latitude: 37.578791,
  longitude: 140.061380,
  bottom_elevation: 769,
  top_elevation: 1206,
  slopes_length: 9.9,
  lifts: 4,
  adult_price: 4000,
  url_path: 'grand-sunpia-inawashiro',
  uid: '30809'
)

Resort.create(
  name: 'Higashitateyama',
  address: nil,
  latitude: 36.724515,
  longitude: 138.507205,
  bottom_elevation: 1556,
  top_elevation: 1986,
  slopes_length: 5.6,
  lifts: 1,
  adult_price: 5500,
  url_path: 'higashitateyama',
  uid: '2677'
)

Resort.create(
  name: 'Sun Alpina Kashimayari',
  address: 'Hakuba',
  latitude: 36.598139,
  longitude: 137.824930,
  bottom_elevation: 830,
  top_elevation: 1550,
  slopes_length: 15.9,
  lifts: 8,
  adult_price: 3800,
  url_path: 'sun-alpina-kashimayari',
  uid: '4543'
)

Resort.create(
  name: 'Ciao Ontake Snow Resort',
  address: nil,
  latitude: 35.947080,
  longitude: 137.484646,
  bottom_elevation: 1810,
  top_elevation: 2190,
  slopes_length: 7.8,
  lifts: 3,
  adult_price: 4000,
  url_path: 'ciao-ontake-snow-resort',
  uid: '2164'
)

Resort.create(
  name: 'Canmore Ski Village, Higashikawa',
  address: nil,
  latitude: 43.729176,
  longitude: 142.534636,
  bottom_elevation: 206,
  top_elevation: 450,
  slopes_length: 5.3,
  lifts: 1,
  adult_price: 2500,
  url_path: 'canmore-ski-village-higashikawa',
  uid: '11171'
)

Resort.create(
  name: 'Yabuhara Kogen',
  address: nil,
  latitude: 35.964798,
  longitude: 137.741768,
  bottom_elevation: 1100,
  top_elevation: 1689,
  slopes_length: 10,
  lifts: 6,
  adult_price: 4300,
  url_path: 'yabuhara-kogen',
  uid: '5008'
)

Resort.create(
  name: 'Moiwa',
  address: 'Kutchan, Niseko',
  latitude: 42.848803,
  longitude: 140.631014,
  bottom_elevation: 330,
  top_elevation: 800,
  slopes_length: 7,
  lifts: 3,
  adult_price: 4300,
  url_path: 'moiwa',
  uid: '3445'
)

Resort.create(
  name: 'Asahi Tengston',
  address: nil,
  latitude: 34.824342,
  longitude: 132.363224,
  bottom_elevation: 552,
  top_elevation: 1088,
  slopes_length: 7.8,
  lifts: 5,
  adult_price: 4500,
  url_path: 'asahi-tengston',
  uid: '1753'
)

Resort.create(
  name: 'Yokoteyama-Shibutoge',
  address: 'Yamanouchi',
  latitude: 36.683495,
  longitude: 138.499768,
  bottom_elevation: 1705,
  top_elevation: 2307,
  slopes_length: 11.6,
  lifts: 9,
  adult_price: 5500,
  url_path: 'yokoteyama-shibutoge',
  uid: '5041'
)

Resort.create(
  name: 'Suhara Ski Resort',
  address: nil,
  latitude: 37.323427,
  longitude: 139.016459,
  bottom_elevation: 204,
  top_elevation: 548,
  slopes_length: 6.1,
  lifts: 4,
  adult_price: 3600,
  url_path: 'suhara-ski-resort',
  uid: '4531'
)

Resort.create(
  name: 'Ryuoo Ski Park',
  address: nil,
  latitude: 36.788949,
  longitude: 138.450417,
  bottom_elevation: 869,
  top_elevation: 1930,
  slopes_length: 10,
  lifts: 11,
  adult_price: 4600,
  url_path: 'ryuoo-ski-park',
  uid: '4162'
)

Resort.create(
  name: 'Hunter Mountain Shiobara',
  address: nil,
  latitude: 36.938088,
  longitude: 139.754167,
  bottom_elevation: 1142,
  top_elevation: 1614,
  slopes_length: 7.6,
  lifts: 7,
  adult_price: 4700,
  url_path: 'hunter-mountain-shiobara',
  uid: '2764'
)

Resort.create(
  name: 'Tainai',
  address: 'Tainai',
  latitude: 38.016197,
  longitude: 139.502123,
  bottom_elevation: 148,
  top_elevation: 701,
  slopes_length: 11.9,
  lifts: 9,
  adult_price: 3800,
  url_path: 'tainai',
  uid: '4598'
)

Resort.create(
  name: 'Mount Jeans Nasu',
  address: nil,
  latitude: 37.127807,
  longitude: 140.015167,
  bottom_elevation: 950,
  top_elevation: 1410,
  slopes_length: 5.9,
  lifts: 5,
  adult_price: 4400,
  url_path: 'mount-jeans-nasu',
  uid: '3537'
)

Resort.create(
  name: 'Ojiro',
  address: nil,
  latitude: 35.452077,
  longitude: 134.531101,
  bottom_elevation: 600,
  top_elevation: 900,
  slopes_length: 6,
  lifts: 4,
  adult_price: 4200,
  url_path: 'ojiro',
  uid: '3667'
)

Resort.create(
  name: 'Muikamachi Hakkaisan',
  address: nil,
  latitude: 37.108914,
  longitude: 138.978555,
  bottom_elevation: 355,
  top_elevation: 1147,
  slopes_length: 12,
  lifts: 4,
  adult_price: 3900,
  url_path: 'muikamachi-hakkaisan',
  uid: '3594'
)

Resort.create(
  name: 'Echo Valley',
  address: nil,
  latitude: 36.121270,
  longitude: 138.209885,
  bottom_elevation: 1460,
  top_elevation: 1781,
  slopes_length: 7,
  lifts: 7,
  adult_price: 3600,
  url_path: 'echo-valley',
  uid: '2327'
)

Resort.create(
  name: 'Karuizawa',
  address: nil,
  latitude: 36.339587,
  longitude: 138.640477,
  bottom_elevation: 940,
  top_elevation: 1155,
  slopes_length: 5.8,
  lifts: 9,
  adult_price: 5500,
  url_path: 'karuizawa',
  uid: '2942'
)

Resort.create(
  name: 'Pippu',
  address: nil,
  latitude: 43.934560,
  longitude: 142.495071,
  bottom_elevation: 246,
  top_elevation: 566,
  slopes_length: 11.7,
  lifts: 7,
  adult_price: 3000,
  url_path: 'pippu',
  uid: '3940'
)

Resort.create(
  name: 'Edelweiss',
  address: nil,
  latitude: 36.924696,
  longitude: 139.749618,
  bottom_elevation: 1250,
  top_elevation: 1478,
  slopes_length: 9.2,
  lifts: 5,
  adult_price: 4400,
  url_path: 'edelweiss',
  uid: '2329'
)

Resort.create(
  name: 'Biwako Valley',
  address: nil,
  latitude: 35.203122,
  longitude: 135.907526,
  bottom_elevation: 950,
  top_elevation: 1174,
  slopes_length: 10,
  lifts: 8,
  adult_price: 3500,
  url_path: 'biwako-valley',
  uid: '1917'
)

Resort.create(
  name: 'Hidaka Kokusai',
  address: nil,
  latitude: 42.869561,
  longitude: 142.446433,
  bottom_elevation: 254,
  top_elevation: 754,
  slopes_length: 7.3,
  lifts: 4,
  adult_price: 3000,
  url_path: 'hidaka-kokusai',
  uid: '2668'
)

Resort.create(
  name: 'Shimokura Area, Hachimantai',
  address: nil,
  latitude: 39.899786,
  longitude: 140.956595,
  bottom_elevation: 580,
  top_elevation: 1130,
  slopes_length: 7,
  lifts: 3,
  adult_price: 4000,
  url_path: 'shimokura-area-hachimantai',
  uid: '4312'
)

Resort.create(
  name: 'Naspa Ski Garden',
  address: 'Yuzawa',
  latitude: 36.925675,
  longitude: 138.808737,
  bottom_elevation: 430,
  top_elevation: 690,
  slopes_length: 6,
  lifts: 5,
  adult_price: 4200,
  url_path: 'naspa-ski-garden',
  uid: '3650'
)

Resort.create(
  name: 'Chateau Shiozawa',
  address: nil,
  latitude: 37.049063,
  longitude: 138.828864,
  bottom_elevation: 210,
  top_elevation: 579,
  slopes_length: 10,
  lifts: 4,
  adult_price: 3500,
  url_path: 'chateau-shiozawa',
  uid: '2128'
)

Resort.create(
  name: 'Pine Beak (Sugadaira Kogen)',
  address: nil,
  latitude: 36.524043,
  longitude: 138.322122,
  bottom_elevation: 1256,
  top_elevation: 1618,
  slopes_length: 9,
  lifts: 6,
  adult_price: 4200,
  url_path: 'pine-beak-sugadaira-kogen',
  uid: '30864'
)

Resort.create(
  name: 'Okuibuki',
  address: nil,
  latitude: 35.521818,
  longitude: 136.38785,
  bottom_elevation: 700,
  top_elevation: 1250,
  slopes_length: 7,
  lifts: 9,
  adult_price: 4000,
  url_path: 'okuibuki',
  uid: '3771'
)

Resort.create(
  name: 'Aizu Kogen Nango',
  address: nil,
  latitude: 37.26642,
  longitude: 139.545872,
  bottom_elevation: 510,
  top_elevation: 1000,
  slopes_length: 10,
  lifts: 4,
  adult_price: 4000,
  url_path: 'aizu-kogen-nango',
  uid: '1649'
)

Resort.create(
  name: 'Shirakabako Royal Hill',
  address: nil,
  latitude: 36.101809,
  longitude: 138.234652,
  bottom_elevation: 1445,
  top_elevation: 1708,
  slopes_length: 6.5,
  lifts: 3,
  adult_price: 4300,
  url_path: 'shirakabako-royal-hill',
  uid: '4323'
)

Resort.create(
  name: 'Hakkoda',
  address: nil,
  latitude: 40.680841,
  longitude: 140.831688,
  bottom_elevation: 658,
  top_elevation: 1324,
  slopes_length: 10,
  lifts: 3,
  adult_price: nil,
  url_path: 'hakkoda',
  uid: '2591'
)

Resort.create(
  name: 'Fujimi Panorama',
  address: nil,
  latitude: 35.913096,
  longitude: 138.204824,
  bottom_elevation: 1050,
  top_elevation: 1780,
  slopes_length: 4.5,
  lifts: 7,
  adult_price: 4700,
  url_path: 'fujimi-panorama',
  uid: '2451'
)

Resort.create(
  name: 'Oze Tokura',
  address: nil,
  latitude: 36.850619,
  longitude: 139.239219,
  bottom_elevation: 1090,
  top_elevation: 1408,
  slopes_length: 7.4,
  lifts: 7,
  adult_price: 4400,
  url_path: 'oze-tokura',
  uid: '3838'
)

Resort.create(
  name: 'Yamaboku, Yamada Bokujo',
  address: nil,
  latitude: 36.667717,
  longitude: 138.460917,
  bottom_elevation: 1500,
  top_elevation: 1774,
  slopes_length: 8,
  lifts: 3,
  adult_price: 3600,
  url_path: 'yamaboku-yamada-bokujo',
  uid: '5017'
)

Resort.create(
  name: 'Ichinose Family Resort',
  address: nil,
  latitude: 36.738806,
  longitude: 138.513585,
  bottom_elevation: 1650,
  top_elevation: 2054,
  slopes_length: 8,
  lifts: 4,
  adult_price: 5500,
  url_path: 'ichinose-family-resort',
  uid: '2784'
)

Resort.create(
  name: 'Hyounosen Kokusai',
  address: nil,
  latitude: 35.360374,
  longitude: 134.530537,
  bottom_elevation: 600,
  top_elevation: 1050,
  slopes_length: 7.5,
  lifts: 5,
  adult_price: nil,
  url_path: 'hyounosen-kokusai',
  uid: '2775'
)

Resort.create(
  name: 'Jeunesse Kurikoma',
  address: nil,
  latitude: 39.159195,
  longitude: 140.727054,
  bottom_elevation: 392,
  top_elevation: 766,
  slopes_length: 8.9,
  lifts: 4,
  adult_price: 3300,
  url_path: 'jeunesse-kurikoma',
  uid: '2864'
)

Resort.create(
  name: 'Minenohara Kogen',
  address: nil,
  latitude: 36.556969,
  longitude: 138.351578,
  bottom_elevation: 1390,
  top_elevation: 1545,
  slopes_length: 7.1,
  lifts: 3,
  adult_price: 3500,
  url_path: 'minenohara-kogen',
  uid: '3417'
)

Resort.create(
  name: 'Katashina Kogen Resort',
  address: nil,
  latitude: 36.811728,
  longitude: 139.228486,
  bottom_elevation: 950,
  top_elevation: 1244,
  slopes_length: 7.2,
  lifts: 6,
  adult_price: 4500,
  url_path: 'katashina-kogen-resort',
  uid: '2953'
)

Resort.create(
  name: 'Imajyo 365',
  address: nil,
  latitude: 35.721292,
  longitude: 136.149179,
  bottom_elevation: 434,
  top_elevation: 755,
  slopes_length: 8.8,
  lifts: 4,
  adult_price: 4300,
  url_path: 'imajyo-365',
  uid: '2798'
)

Resort.create(
  name: 'Iizuna Kogen',
  address: 'Ageya',
  latitude: 36.717700,
  longitude: 138.140745,
  bottom_elevation: 1091,
  top_elevation: 1397,
  slopes_length: 7,
  lifts: 5,
  adult_price: nil,
  url_path: 'iizuna-kogen',
  uid: '30784'
)

Resort.create(
  name: 'Numajiri',
  address: nil,
  latitude: 37.622922,
  longitude: 140.228914,
  bottom_elevation: 867,
  top_elevation: 1186,
  slopes_length: 8.9,
  lifts: 6,
  adult_price: 4200,
  url_path: 'numajiri',
  uid: '3731'
)

Resort.create(
  name: 'Nishitateyama',
  address: nil,
  latitude: 36.721872,
  longitude: 138.497435,
  bottom_elevation: 1333,
  top_elevation: 1742,
  slopes_length: 4,
  lifts: 3,
  adult_price: 5500,
  url_path: 'nishitateyama',
  uid: '3688'
)

Resort.create(
  name: 'Zao Sumikawa',
  address: nil,
  latitude: 38.134326,
  longitude: 140.494839,
  bottom_elevation: 1112,
  top_elevation: 1376,
  slopes_length: 7.5,
  lifts: 3,
  adult_price: 3300,
  url_path: 'zao-sumikawa',
  uid: '5067'
)

Resort.create(
  name: 'Ryokufu Resort',
  address: nil,
  latitude: 36.308605,
  longitude: 137.244831,
  bottom_elevation: 749,
  top_elevation: 1359,
  slopes_length: 8,
  lifts: 7,
  adult_price: 3900,
  url_path: 'ryokufu-resort',
  uid: '4160'
)

Resort.create(
  name: 'Manza Onsen',
  address: nil,
  latitude: 36.634844,
  longitude: 138.505456,
  bottom_elevation: 1646,
  top_elevation: 1994,
  slopes_length: 4.9,
  lifts: 4,
  adult_price: 4700,
  url_path: 'manza-onsen',
  uid: '3327'
)

Resort.create(
  name: 'Giant Resort',
  address: nil,
  latitude: 36.720470,
  longitude: 138.496266,
  bottom_elevation: 1330,
  top_elevation: 1590,
  slopes_length: 3,
  lifts: 2,
  adult_price: 5500,
  url_path: 'giant-resort',
  uid: '2496'
)

Resort.create(
  name: 'Yanaba Parallel',
  address: nil,
  latitude: 36.604858,
  longitude: 137.855868,
  bottom_elevation: 830,
  top_elevation: 1130,
  slopes_length: 5.5,
  lifts: 2,
  adult_price: nil,
  url_path: 'yanaba-parallel',
  uid: '5020'
)

Resort.create(
  name: 'Hakodateyama',
  address: 'Imazuch\u014d Hiokimae',
  latitude: 35.427855,
  longitude: 135.995896,
  bottom_elevation: 552,
  top_elevation: 691,
  slopes_length: 3,
  lifts: 8,
  adult_price: 4800,
  url_path: 'hakodateyama',
  uid: '2593'
)

Resort.create(
  name: 'Moya Hills',
  address: nil,
  latitude: 40.737658,
  longitude: 140.793552,
  bottom_elevation: 247,
  top_elevation: 511,
  slopes_length: 5,
  lifts: 6,
  adult_price: 3500,
  url_path: 'moya-hills',
  uid: '3562'
)

Resort.create(
  name: 'Yuzawa Nakazato',
  address: 'Yuzawa',
  latitude: 36.908773,
  longitude: 138.849838,
  bottom_elevation: 458,
  top_elevation: 702,
  slopes_length: 5.9,
  lifts: 9,
  adult_price: 4000,
  url_path: 'yuzawa-nakazato',
  uid: '5051'
)

Resort.create(
  name: 'Hakkaisanroku',
  address: nil,
  latitude: 37.155323,
  longitude: 138.974491,
  bottom_elevation: 210,
  top_elevation: 420,
  slopes_length: 5,
  lifts: 2,
  adult_price: nil,
  url_path: 'hakkaisanroku',
  uid: '28932'
)

Resort.create(
  name: 'Hasuike',
  address: nil,
  latitude: 36.716200,
  longitude: 138.493309,
  bottom_elevation: 1504,
  top_elevation: 1597,
  slopes_length: 2.2,
  lifts: 1,
  adult_price: 5500,
  url_path: 'hasuike',
  uid: '2625'
)

Resort.create(
  name: 'Wakasugi Kogen Oya',
  address: nil,
  latitude: 35.282378,
  longitude: 134.588102,
  bottom_elevation: 680,
  top_elevation: 850,
  slopes_length: 5,
  lifts: 3,
  adult_price: nil,
  url_path: 'wakasugi-kogen-oya',
  uid: '4912'
)

Resort.create(
  name: 'Karigahara',
  address: nil,
  latitude: 36.078652,
  longitude: 136.519651,
  bottom_elevation: 200,
  top_elevation: 420,
  slopes_length: 6,
  lifts: 5,
  adult_price: 3800,
  url_path: 'karigahara',
  uid: '2934'
)

Resort.create(
  name: 'Taiheizan Opus',
  address: 'Akita',
  latitude: 39.787578,
  longitude: 140.220466,
  bottom_elevation: 137,
  top_elevation: 328,
  slopes_length: 5.9,
  lifts: 3,
  adult_price: 2050,
  url_path: 'taiheizan-opus',
  uid: '4597'
)

Resort.create(
  name: 'Taira',
  address: 'Nanto',
  latitude: 36.441969,
  longitude: 136.926760,
  bottom_elevation: 630,
  top_elevation: 933,
  slopes_length: 5,
  lifts: 3,
  adult_price: 3000,
  url_path: 'taira',
  uid: '4599'
)

Resort.create(
  name: 'Gassan, Nishikawa',
  address: 'Nishikawa',
  latitude: 38.523677,
  longitude: 140.006442,
  bottom_elevation: 1235,
  top_elevation: 1670,
  slopes_length: 10,
  lifts: 3,
  adult_price: 4600,
  url_path: 'gassan-nishikawa',
  uid: '507'
)

Resort.create(
  name: 'Wakabuna Kogen',
  address: nil,
  latitude: 38.058497,
  longitude: 139.629497,
  bottom_elevation: 163,
  top_elevation: 497,
  slopes_length: 6.4,
  lifts: 4,
  adult_price: 4000,
  url_path: 'wakabuna-kogen',
  uid: '4910'
)

Resort.create(
  name: 'Kyowa',
  address: nil,
  latitude: 39.680451,
  longitude: 140.393379,
  bottom_elevation: 175,
  top_elevation: 418,
  slopes_length: 5,
  lifts: 2,
  adult_price: 2500,
  url_path: 'kyowa',
  uid: '3131'
)

Resort.create(
  name: 'Asahimura Budo',
  address: nil,
  latitude: 38.389790,
  longitude: 139.554365,
  bottom_elevation: 154,
  top_elevation: 655,
  slopes_length: 4.3,
  lifts: 2,
  adult_price: 3000,
  url_path: 'asahimura-budo',
  uid: '1756'
)

Resort.create(
  name: 'St. Mary',
  address: nil,
  latitude: 38.218670,
  longitude: 140.521084,
  bottom_elevation: 448,
  top_elevation: 950,
  slopes_length: 3.2,
  lifts: 5,
  adult_price: 3100,
  url_path: 'st-mary',
  uid: '4469'
)

Resort.create(
  name: 'Hidatakayama',
  address: nil,
  latitude: 36.141580,
  longitude: 137.429912,
  bottom_elevation: 1312,
  top_elevation: 1539,
  slopes_length: 6,
  lifts: 3,
  adult_price: 3700,
  url_path: 'hidatakayama',
  uid: '2670'
)

Resort.create(
  name: 'Sun Valley Resort',
  address: nil,
  latitude: 36.716058,
  longitude: 138.483441,
  bottom_elevation: 1409,
  top_elevation: 1564,
  slopes_length: 1.8,
  lifts: 3,
  adult_price: 5500,
  url_path: 'sun-valley-resort',
  uid: '4547'
)

Resort.create(
  name: 'Hanawa, Kazuno',
  address: nil,
  latitude: 40.188412,
  longitude: 140.823598,
  bottom_elevation: 260,
  top_elevation: 727,
  slopes_length: 3,
  lifts: 3,
  adult_price: 3000,
  url_path: 'hanawa-kazuno',
  uid: '2888'
)

Resort.create(
  name: 'Ashibetsu',
  address: nil,
  latitude: 43.527961,
  longitude: 142.195637,
  bottom_elevation: 90,
  top_elevation: 250,
  slopes_length: 3.8,
  lifts: 3,
  adult_price: nil,
  url_path: 'ashibetsu',
  uid: '1763'
)

Resort.create(
  name: 'Yuzawa Park',
  address: 'Yuzawa',
  latitude: 36.926812,
  longitude: 138.856025,
  bottom_elevation: 454,
  top_elevation: 626,
  slopes_length: 5.7,
  lifts: 6,
  adult_price: 4000,
  url_path: 'yuzawa-park',
  uid: '5052'
)

Resort.create(
  name: 'Asahi Shizen',
  address: nil,
  latitude: 38.304938,
  longitude: 140.054362,
  bottom_elevation: 440,
  top_elevation: 760,
  slopes_length: 3.5,
  lifts: 4,
  adult_price: 3300,
  url_path: 'asahi-shizen',
  uid: '1752'
)

Resort.create(
  name: 'Mineyama Kogen',
  address: 'Kamioda, Mineyama Kogen',
  latitude: 35.131364,
  longitude: 134.666398,
  bottom_elevation: 930,
  top_elevation: 1049,
  slopes_length: 3.1,
  lifts: 2,
  adult_price: 4500,
  url_path: 'mineyama-kogen',
  uid: '31950'
)

Resort.create(
  name: 'Kumanoyu Resort',
  address: nil,
  latitude: 36.682720,
  longitude: 138.496476,
  bottom_elevation: 1690,
  top_elevation: 1960,
  slopes_length: 4.5,
  lifts: 6,
  adult_price: 5000,
  url_path: 'kumanoyu-resort',
  uid: '3111'
)

Resort.create(
  name: 'Kunizakai',
  address: nil,
  latitude: 35.535460,
  longitude: 136.092102,
  bottom_elevation: 384,
  top_elevation: 592,
  slopes_length: 3,
  lifts: 4,
  adult_price: 4000,
  url_path: 'kunizakai',
  uid: '3114'
)

Resort.create(
  name: 'Sakae Club',
  address: nil,
  latitude: 36.996037,
  longitude: 138.564483,
  bottom_elevation: 398,
  top_elevation: 802,
  slopes_length: 4.1,
  lifts: 3,
  adult_price: 3800,
  url_path: 'sakae-club',
  uid: '4183'
)

Resort.create(
  name: 'Minami Furano',
  address: nil,
  latitude: 43.159638,
  longitude: 142.558105,
  bottom_elevation: 389,
  top_elevation: 730,
  slopes_length: 3,
  lifts: 3,
  adult_price: 2500,
  url_path: 'minami-furano',
  uid: '3413'
)

Resort.create(
  name: 'Hiroshima Kenmin no Mori',
  address: nil,
  latitude: 35.069724,
  longitude: 133.071686,
  bottom_elevation: 830,
  top_elevation: 1080,
  slopes_length: 3.5,
  lifts: 3,
  adult_price: 4200,
  url_path: 'hiroshima-kenmin-no-mori',
  uid: '2703'
)

Resort.create(
  name: 'Hirayu Onsen',
  address: nil,
  latitude: 36.184513,
  longitude: 137.552508,
  bottom_elevation: 1314,
  top_elevation: 1784,
  slopes_length: 3.5,
  lifts: 2,
  adult_price: 3500,
  url_path: 'hirayu-onsen',
  uid: '2701'
)

Resort.create(
  name: 'Beruku Yogo',
  address: nil,
  latitude: 35.691382,
  longitude: 136.165829,
  bottom_elevation: 518,
  top_elevation: 770,
  slopes_length: 3.2,
  lifts: 4,
  adult_price: nil,
  url_path: 'beruku-yogo',
  uid: '1881'
)

Resort.create(
  name: 'Karuizawa Snow Park',
  address: nil,
  latitude: 36.422537,
  longitude: 138.626533,
  bottom_elevation: 1272,
  top_elevation: 1401,
  slopes_length: 3.1,
  lifts: 3,
  adult_price: 3500,
  url_path: 'karuizawa-snow-park',
  uid: '2935'
)

Resort.create(
  name: 'Horotachi',
  address: nil,
  latitude: 44.013196,
  longitude: 142.137374,
  bottom_elevation: 160,
  top_elevation: 343,
  slopes_length: 3.3,
  lifts: 1,
  adult_price: 2200,
  url_path: 'horotachi',
  uid: '2744'
)

Resort.create(
  name: 'Norn Minakami',
  address: nil,
  latitude: 36.743719,
  longitude: 138.941409,
  bottom_elevation: 820,
  top_elevation: 1220,
  slopes_length: 4.7,
  lifts: 4,
  adult_price: 4500,
  url_path: 'norn-minakami',
  uid: '3711'
)

Resort.create(
  name: 'Shintokuyama',
  address: 'Shintoku',
  latitude: 43.092156,
  longitude: 142.831313,
  bottom_elevation: 190,
  top_elevation: 465,
  slopes_length: 3,
  lifts: 1,
  adult_price: nil,
  url_path: 'shintokuyama',
  uid: '4319'
)

Resort.create(
  name: 'Sky Shishiku',
  address: nil,
  latitude: 36.439477,
  longitude: 136.641123,
  bottom_elevation: 591,
  top_elevation: 638,
  slopes_length: 0.4,
  lifts: 2,
  adult_price: nil,
  url_path: 'sky-shishiku',
  uid: '4378'
)

Resort.create(
  name: 'Iwakisan Hyakuzawa',
  address: nil,
  latitude: 40.628032,
  longitude: 140.331142,
  bottom_elevation: 323,
  top_elevation: 747,
  slopes_length: 4.4,
  lifts: 4,
  adult_price: 2600,
  url_path: 'iwakisan-hyakuzawa',
  uid: '2824'
)

Resort.create(
  name: 'Yogo Kogen',
  address: nil,
  latitude: 35.698201,
  longitude: 136.157267,
  bottom_elevation: 554,
  top_elevation: 741,
  slopes_length: 3.6,
  lifts: 4,
  adult_price: 4000,
  url_path: 'yogo-kogen',
  uid: '5036'
)

Resort.create(
  name: 'Yeti Resort',
  address: nil,
  latitude: 35.300526,
  longitude: 138.768992,
  bottom_elevation: 1300,
  top_elevation: 1450,
  slopes_length: 3,
  lifts: 3,
  adult_price: 4000,
  url_path: 'yeti-resort',
  uid: '5035'
)

Resort.create(
  name: 'Kotobiki Forest Park',
  address: nil,
  latitude: 35.054271,
  longitude: 132.768617,
  bottom_elevation: 549,
  top_elevation: 706,
  slopes_length: 4.4,
  lifts: 3,
  adult_price: 3800,
  url_path: 'kotobiki-forest-park',
  uid: '3072'
)

Resort.create(
  name: 'Engaru Rock Valley',
  address: 'Engaru',
  latitude: 44.021704,
  longitude: 143.494787,
  bottom_elevation: 135,
  top_elevation: 405,
  slopes_length: 4.2,
  lifts: 2,
  adult_price: 2900,
  url_path: 'engaru-rock-valley',
  uid: '2355'
)

Resort.create(
  name: 'Asahidake',
  address: nil,
  latitude: 43.652996,
  longitude: 142.798823,
  bottom_elevation: 1100,
  top_elevation: 1600,
  slopes_length: 6.7,
  lifts: 1,
  adult_price: 2900,
  url_path: 'asahidake',
  uid: '1754'
)

Resort.create(
  name: 'Kujyumachi',
  address: nil,
  latitude: 33.099175,
  longitude: 131.178896,
  bottom_elevation: 1159,
  top_elevation: 1316,
  slopes_length: 2.6,
  lifts: 3,
  adult_price: 6500,
  url_path: 'kujyumachi',
  uid: '3107'
)

Resort.create(
  name: 'Ibuki no Sato',
  address: nil,
  latitude: 35.168424,
  longitude: 133.409127,
  bottom_elevation: 650,
  top_elevation: 850,
  slopes_length: 2.3,
  lifts: 3,
  adult_price: 4000,
  url_path: 'ibuki-no-sato',
  uid: '30834'
)

Resort.create(
  name: 'Nakasato Kiyotsu',
  address: nil,
  latitude: 37.022275,
  longitude: 138.728643,
  bottom_elevation: 501,
  top_elevation: 768,
  slopes_length: 4.3,
  lifts: 1,
  adult_price: 3500,
  url_path: 'nakasato-kiyotsu',
  uid: '3632'
)

Resort.create(
  name: 'Nakayamatoge Kogen',
  address: nil,
  latitude: 42.850194,
  longitude: 141.095472,
  bottom_elevation: 811,
  top_elevation: 941,
  slopes_length: 3,
  lifts: 1,
  adult_price: nil,
  url_path: 'nakayamatoge-kogen',
  uid: '3634'
)

Resort.create(
  name: 'Motai',
  address: nil,
  latitude: 35.866065,
  longitude: 136.952051,
  bottom_elevation: 795,
  top_elevation: 875,
  slopes_length: 1.6,
  lifts: 1,
  adult_price: 2500,
  url_path: 'motai',
  uid: '3522'
)

Resort.create(
  name: 'Takanbo',
  address: nil,
  latitude: 36.379801,
  longitude: 136.866188,
  bottom_elevation: 420,
  top_elevation: 720,
  slopes_length: 3,
  lifts: 3,
  adult_price: 3000,
  url_path: 'takanbo',
  uid: '4604'
)

Resort.create(
  name: 'Pilatitudeus Tateshina',
  address: nil,
  latitude: 36.068351,
  longitude: 138.302268,
  bottom_elevation: 1763,
  top_elevation: 2240,
  slopes_length: 4,
  lifts: 3,
  adult_price: 4000,
  url_path: 'pilatus-tateshina',
  uid: '3928'
)

Resort.create(
  name: 'Terakoya Resort',
  address: nil,
  latitude: 36.730117,
  longitude: 138.521524,
  bottom_elevation: 1912,
  top_elevation: 2076,
  slopes_length: 3,
  lifts: 2,
  adult_price: 5500,
  url_path: 'terakoya-resort',
  uid: '4659'
)

Resort.create(
  name: 'Yudonosan',
  address: 'Tsuruoka',
  latitude: 38.5718928,
  longitude: 139.9415447,
  bottom_elevation: 530,
  top_elevation: 700,
  slopes_length: 4.2,
  lifts: 3,
  adult_price: 3100,
  url_path: 'yudonosan',
  uid: '5046'
)

Resort.create(
  name: 'Ichinose Yamanokami',
  address: nil,
  latitude: 36.744013,
  longitude: 138.515278,
  bottom_elevation: 1598,
  top_elevation: 1801,
  slopes_length: 2,
  lifts: 2,
  adult_price: 5500,
  url_path: 'ichinose-yamanokami',
  uid: '2785'
)

Resort.create(
  name: 'White Valley Matsubara',
  address: nil,
  latitude: 34.644184,
  longitude: 132.233799,
  bottom_elevation: 700,
  top_elevation: 878,
  slopes_length: 2.3,
  lifts: 2,
  adult_price: 3800,
  url_path: 'white-valley-matsubara',
  uid: '4957'
)

Resort.create(
  name: 'Numata-choei Takaho',
  address: nil,
  latitude: 43.820455,
  longitude: 141.963421,
  bottom_elevation: 60,
  top_elevation: 140,
  slopes_length: 1,
  lifts: 1,
  adult_price: nil,
  url_path: 'numata-choei-takaho',
  uid: '3732'
)

Resort.create(
  name: 'Taranokidai',
  address: nil,
  latitude: 38.651636,
  longitude: 139.913470,
  bottom_elevation: 260,
  top_elevation: 365,
  slopes_length: 2,
  lifts: 1,
  adult_price: 2800,
  url_path: 'taranokidai',
  uid: '4625'
)

Resort.create(
  name: 'Koide',
  address: nil,
  latitude: 37.228356,
  longitude: 138.954764,
  bottom_elevation: 130,
  top_elevation: 263,
  slopes_length: 2.6,
  lifts: 3,
  adult_price: 3000,
  url_path: 'koide',
  uid: '3039'
)

Resort.create(
  name: 'Tsuchitaru',
  address: nil,
  latitude: 36.930270,
  longitude: 138.871926,
  bottom_elevation: 509,
  top_elevation: 738,
  slopes_length: 2.3,
  lifts: 3,
  adult_price: nil,
  url_path: 'tsuchitaru',
  uid: '4756'
)

Resort.create(
  name: 'Ikawa Kainayama',
  address: nil,
  latitude: 33.963669,
  longitude: 133.883111,
  bottom_elevation: 1085,
  top_elevation: 1175,
  slopes_length: 1.8,
  lifts: 2,
  adult_price: 3600,
  url_path: 'ikawa-kainayama',
  uid: '2793'
)

Resort.create(
  name: 'Sannokura',
  address: nil,
  latitude: 37.750154,
  longitude: 139.867277,
  bottom_elevation: 570,
  top_elevation: 775,
  slopes_length: 1.5,
  lifts: 2,
  adult_price: nil,
  url_path: 'sannokura',
  uid: '4205'
)

Resort.create(
  name: 'Tateshina Tokyu',
  address: nil,
  latitude: 36.069492,
  longitude: 138.256092,
  bottom_elevation: 1337,
  top_elevation: 1401,
  slopes_length: 1.5,
  lifts: 1,
  adult_price: 3800,
  url_path: 'tateshina-tokyu',
  uid: '4630'
)

Resort.create(
  name: 'Tsuguro Kogen',
  address: nil,
  latitude: 35.257808,
  longitude: 133.795530,
  bottom_elevation: 611,
  top_elevation: 691,
  slopes_length: 1,
  lifts: 1,
  adult_price: 3800,
  url_path: 'tsuguro-kogen',
  uid: '4758'
)

Resort.create(
  name: 'Nanao Korosa',
  address: nil,
  latitude: 36.974349,
  longitude: 136.960965,
  bottom_elevation: 429,
  top_elevation: 469,
  slopes_length: 1,
  lifts: 1,
  adult_price: 2000,
  url_path: 'nanao-korosa',
  uid: '3640'
)

Resort.create(
  name: 'Awasuno',
  address: nil,
  latitude: 36.576065,
  longitude: 137.440048,
  bottom_elevation: 600,
  top_elevation: 825,
  slopes_length: 2.8,
  lifts: 2,
  adult_price: 3400,
  url_path: 'awasuno',
  uid: '1785'
)

Resort.create(
  name: 'Maruike',
  address: nil,
  latitude: 36.716121,
  longitude: 138.489055,
  bottom_elevation: 1457,
  top_elevation: 1567,
  slopes_length: 1.8,
  lifts: 3,
  adult_price: 5500,
  url_path: 'maruike',
  uid: '3340'
)

Resort.create(
  name: 'Kutsuki',
  address: nil,
  latitude: 35.329611,
  longitude: 135.940528,
  bottom_elevation: 442,
  top_elevation: 578,
  slopes_length: 2.8,
  lifts: 3,
  adult_price: 3000,
  url_path: 'kutsuki',
  uid: '3127'
)

Resort.create(
  name: 'Kanayasan',
  address: nil,
  latitude: 37.104067,
  longitude: 138.224806,
  bottom_elevation: 65,
  top_elevation: 110,
  slopes_length: 1.6,
  lifts: 1,
  adult_price: nil,
  url_path: 'kanayasan',
  uid: '2915'
)

Resort.create(
  name: 'Hida Highland',
  address: nil,
  latitude: 36.288515,
  longitude: 137.204344,
  bottom_elevation: 931,
  top_elevation: 1128,
  slopes_length: 1.7,
  lifts: 1,
  adult_price: nil,
  url_path: 'hida-highland',
  uid: '2665'
)

Resort.create(
  name: 'Gokazan, Y\u016bbetsu',
  address: nil,
  latitude: 44.183353,
  longitude: 143.609799,
  bottom_elevation: 25,
  top_elevation: 120,
  slopes_length: 2.7,
  lifts: 1,
  adult_price: nil,
  url_path: 'gokazan-yubetsu',
  uid: '2908'
)

Resort.create(
  name: 'Akazawa',
  address: nil,
  latitude: 36.732707,
  longitude: 138.830260,
  bottom_elevation: 773,
  top_elevation: 1043,
  slopes_length: 2,
  lifts: 3,
  adult_price: nil,
  url_path: 'akazawa',
  uid: '1659'
)

Resort.create(
  name: 'Shichinohechoei',
  address: nil,
  latitude: 40.698437,
  longitude: 141.099681,
  bottom_elevation: 90,
  top_elevation: 194,
  slopes_length: 1.5,
  lifts: 2,
  adult_price: 2000,
  url_path: 'shichinohechoei',
  uid: '4309'
)

Resort.create(
  name: 'Kutchancho Asahigaoka',
  address: 'Kutchan',
  latitude: 42.901822,
  longitude: 140.737293,
  bottom_elevation: 194,
  top_elevation: 289,
  slopes_length: 0.9,
  lifts: 1,
  adult_price: nil,
  url_path: 'kutchancho-asahigaoka',
  uid: '3105'
)

Resort.create(
  name: 'Ishizuchi',
  address: nil,
  latitude: 33.803039,
  longitude: 133.148230,
  bottom_elevation: 1263,
  top_elevation: 1383,
  slopes_length: 1.3,
  lifts: 5,
  adult_price: 4000,
  url_path: 'ishizuchi',
  uid: '2812'
)

Resort.create(
  name: 'Akita-Hachimantai',
  address: nil,
  latitude: 39.978809,
  longitude: 140.802572,
  bottom_elevation: 980,
  top_elevation: 1200,
  slopes_length: 2.4,
  lifts: 1,
  adult_price: 3600,
  url_path: 'akita-hachimantai',
  uid: '30874'
)

Resort.create(
  name: 'Ushidake Onsen',
  address: nil,
  latitude: 36.573024,
  longitude: 137.057211,
  bottom_elevation: 335,
  top_elevation: 650,
  slopes_length: 2.5,
  lifts: 3,
  adult_price: 3600,
  url_path: 'ushidake-onsen',
  uid: '4796'
)

Resort.create(
  name: 'Hinoemata',
  address: nil,
  latitude: 37.032602,
  longitude: 139.396667,
  bottom_elevation: 922,
  top_elevation: 1117,
  slopes_length: 1.2,
  lifts: 2,
  adult_price: nil,
  url_path: 'hinoemata',
  uid: '2696'
)

Resort.create(
  name: 'Ludens Yuzawa',
  address: 'Yuzawa',
  latitude: 36.905976,
  longitude: 138.837512,
  bottom_elevation: 469,
  top_elevation: 580,
  slopes_length: 1.9,
  lifts: 1,
  adult_price: 2500,
  url_path: 'ludens-yuzawa',
  uid: '3267'
)

Resort.create(
  name: 'Matsudai',
  address: nil,
  latitude: 37.126476,
  longitude: 138.605354,
  bottom_elevation: 213,
  top_elevation: 381,
  slopes_length: 1.8,
  lifts: 2,
  adult_price: 2500,
  url_path: 'matsudai',
  uid: '3350'
)

Resort.create(
  name: 'Bifuka',
  address: nil,
  latitude: 44.488152,
  longitude: 142.358917,
  bottom_elevation: 83,
  top_elevation: 140,
  slopes_length: 1.2,
  lifts: 1,
  adult_price: nil,
  url_path: 'bifuka',
  uid: '1897'
)

Resort.create(
  name: 'Tannenomori Okojo',
  address: nil,
  latitude: 36.733514,
  longitude: 138.512004,
  bottom_elevation: 1671,
  top_elevation: 1790,
  slopes_length: 2,
  lifts: 2,
  adult_price: 5500,
  url_path: 'tannenomori-okojo',
  uid: '4621'
)

Resort.create(
  name: 'Yunotani Yakushi',
  address: nil,
  latitude: 37.235091,
  longitude: 138.992606,
  bottom_elevation: 138,
  top_elevation: 258,
  slopes_length: 1.5,
  lifts: 1,
  adult_price: 3000,
  url_path: 'yunotani-yakushi',
  uid: '5050'
)

Resort.create(
  name: 'Araragi Kogen',
  address: nil,
  latitude: 35.405459,
  longitude: 137.674468,
  bottom_elevation: 1145,
  top_elevation: 1305,
  slopes_length: 1.5,
  lifts: 2,
  adult_price: 3500,
  url_path: 'araragi-kogen',
  uid: '1736'
)

Resort.create(
  name: 'Ichinose Diamond',
  address: nil,
  latitude: 36.739444,
  longitude: 138.512346,
  bottom_elevation: 1609,
  top_elevation: 1713,
  slopes_length: 1.1,
  lifts: 3,
  adult_price: 5500,
  url_path: 'ichinose-diamond',
  uid: '2783'
)

Resort.create(
  name: 'Suishozan, Kazuno',
  address: nil,
  latitude: 40.177303,
  longitude: 140.763335,
  bottom_elevation: 271,
  top_elevation: 419,
  slopes_length: 1.5,
  lifts: 1,
  adult_price: nil,
  url_path: 'suishozan-kazuno',
  uid: '2889'
)

Resort.create(
  name: 'Ishiuchi Hanaoka',
  address: nil,
  latitude: 36.990813,
  longitude: 138.798738,
  bottom_elevation: 282,
  top_elevation: 399,
  slopes_length: 1.6,
  lifts: 1,
  adult_price: 3600,
  url_path: 'ishiuchi-hanaoka',
  uid: '30884'
)

Resort.create(
  name: 'Muroran Kogen Danpara',
  address: nil,
  latitude: 42.415902,
  longitude: 141.002522,
  bottom_elevation: 412,
  top_elevation: 472,
  slopes_length: 1.2,
  lifts: 1,
  adult_price: 2000,
  url_path: 'muroran-kogen-danpara',
  uid: '3601'
)

Resort.create(
  name: 'Kaneyama',
  address: nil,
  latitude: 37.444375,
  longitude: 139.535750,
  bottom_elevation: 516,
  top_elevation: 761,
  slopes_length: 2.8,
  lifts: 2,
  adult_price: 3000,
  url_path: 'kaneyama',
  uid: '2920'
)

Resort.create(
  name: 'Gujo Kogen',
  address: nil,
  latitude: 35.975677,
  longitude: 136.938253,
  bottom_elevation: 1045,
  top_elevation: 1114,
  slopes_length: 1,
  lifts: 2,
  adult_price: 3500,
  url_path: 'gujo-kogen',
  uid: '2574'
)

Resort.create(
  name: 'Towadako Onsen',
  address: nil,
  latitude: 40.579090,
  longitude: 140.993073,
  bottom_elevation: 232,
  top_elevation: 487,
  slopes_length: 2.1,
  lifts: 3,
  adult_price: 2670,
  url_path: 'towadako-onsen',
  uid: '4721'
)

Resort.create(
  name: 'Daisetsuzan Kurodake, Sounkyo',
  address: nil,
  latitude: 43.724343,
  longitude: 142.946842,
  bottom_elevation: 1300,
  top_elevation: 1520,
  slopes_length: 2.7,
  lifts: 2,
  adult_price: 3800,
  url_path: 'daisetsuzan-kurodake-sounkyo',
  uid: '2239'
)

Resort.create(
  name: 'Tengamori',
  address: nil,
  latitude: 39.162316,
  longitude: 140.620842,
  bottom_elevation: 228,
  top_elevation: 368,
  slopes_length: 2.3,
  lifts: 2,
  adult_price: nil,
  url_path: 'tengamori',
  uid: '4652'
)

Resort.create(
  name: 'Yokomuki Onsen',
  address: nil,
  latitude: 37.657195,
  longitude: 140.258457,
  bottom_elevation: 1083,
  top_elevation: 1146,
  slopes_length: 0.8,
  lifts: 1,
  adult_price: nil,
  url_path: 'yokomuki-onsen',
  uid: '5039'
)

Resort.create(
  name: 'Daisen, Masumizu Kogen',
  address: 'H\u014dki',
  latitude: 35.368257,
  longitude: 133.515272,
  bottom_elevation: 720,
  top_elevation: 865,
  slopes_length: 0.7,
  lifts: 1,
  adult_price: 3900,
  url_path: 'daisen-masumizu-kogen',
  uid: '3345'
)

Resort.create(
  name: 'Tadami',
  address: 'Tadami',
  latitude: 37.346463,
  longitude: 139.309837,
  bottom_elevation: 400,
  top_elevation: 550,
  slopes_length: 0.9,
  lifts: 1,
  adult_price: 2800,
  url_path: 'tadami',
  uid: '4593'
)

Resort.create(
  name: 'Nakazato Snow Wood',
  address: 'Yuzawa',
  latitude: 36.905405,
  longitude: 138.850390,
  bottom_elevation: 498,
  top_elevation: 665,
  slopes_length: 0.8,
  lifts: 2,
  adult_price: 2000,
  url_path: 'nakazato-snow-wood',
  uid: '3635'
)

Resort.create(
  name: 'Kyukamura Myoko Resort',
  address: nil,
  latitude: 36.913119,
  longitude: 138.169760,
  bottom_elevation: 789,
  top_elevation: 896,
  slopes_length: 1,
  lifts: 1,
  adult_price: 2500,
  url_path: 'kyukamura-myoko-resort',
  uid: '3133'
)

Resort.create(
  name: 'Hiruzen Bear Valley',
  address: nil,
  latitude: 35.261259,
  longitude: 133.597044,
  bottom_elevation: 592,
  top_elevation: 724,
  slopes_length: 2.3,
  lifts: 2,
  adult_price: 4000,
  url_path: 'hiruzen-bear-valley',
  uid: '2708'
)

Resort.create(
  name: 'Yogoshiyama',
  address: nil,
  latitude: 40.921510,
  longitude: 140.987992,
  bottom_elevation: 33,
  top_elevation: 183,
  slopes_length: 1.8,
  lifts: 3,
  adult_price: 2050,
  url_path: 'yogoshiyama',
  uid: '5037'
)

Resort.create(
  name: 'Eniwa Shimin',
  address: nil,
  latitude: 42.846003,
  longitude: 141.48939,
  bottom_elevation: 120,
  top_elevation: 160,
  slopes_length: 0.3,
  lifts: 1,
  adult_price: 2300,
  url_path: 'eniwa-shimin',
  uid: '2358'
)

Resort.create(
  name: 'Kidoike',
  address: nil,
  latitude: 36.697832,
  longitude: 138.490141,
  bottom_elevation: 1609,
  top_elevation: 1649,
  slopes_length: 0.7,
  lifts: 1,
  adult_price: 5500,
  url_path: 'kidoike',
  uid: '2983'
)

Resort.create(
  name: 'Ipponsugi',
  address: nil,
  latitude: 36.936618,
  longitude: 138.806358,
  bottom_elevation: 381,
  top_elevation: 425,
  slopes_length: 0.4,
  lifts: 1,
  adult_price: 4200,
  url_path: 'ipponsugi',
  uid: '2808'
)

Resort.create(
  name: 'Yokote Park',
  address: nil,
  latitude: 39.324407,
  longitude: 140.574992,
  bottom_elevation: 92,
  top_elevation: 169,
  slopes_length: 1,
  lifts: 2,
  adult_price: nil,
  url_path: 'yokote-park',
  uid: '30869'
)

Resort.create(
  name: 'Sayama (indoor ski area)',
  address: nil,
  latitude: 35.768755,
  longitude: 139.418685,
  bottom_elevation: 112,
  top_elevation: 144,
  slopes_length: 0.3,
  lifts: 2,
  adult_price: 4100,
  url_path: 'sayama',
  uid: '4226'
)

Resort.create(
  name: 'Shizuokashi Riverwell Ikawa',
  address: nil,
  latitude: 35.220131,
  longitude: 138.278708,
  bottom_elevation: 1412,
  top_elevation: 1441,
  slopes_length: 0.3,
  lifts: 2,
  adult_price: nil,
  url_path: 'shizuokashi-riverwell-ikawa',
  uid: '4333'
)

Resort.create(
  name: 'Yakurai',
  address: nil,
  latitude: 38.575234,
  longitude: 140.717699,
  bottom_elevation: 215,
  top_elevation: 327,
  slopes_length: 0.6,
  lifts: 2,
  adult_price: nil,
  url_path: 'yakurai',
  uid: '5015'
)

puts 'Finished creating resorts.'



def scrape_weather(resort)
  html_content = open("https://www.skiresort.info/ski-resort/#{resort.url_path}/weather/").read
  doc = Nokogiri::HTML(html_content)

  for num in 2..5
    max = 0
    min = 0
    wind = 0
    wind_direction = ""
    snowfall = 0
    day = ""
    rain = ""
    doc.search(".panel-simple table:nth-child(5) tr:nth-child(10) td:nth-child(#{num}) strong").each_with_index do |element, index|
      max = element.text.gsub(/°C/,"").to_i
    end
    doc.search(".panel-simple table:nth-child(5) tr:nth-child(10) td:nth-child(#{num}) span").each_with_index do |element, index|
      min = element.text.gsub(/°C/,"").to_i
    end
    doc.search(".panel-simple table:nth-child(11) tr:nth-child(1) td:nth-child(#{num}) span:nth-child(3)").each_with_index do |element, index|
      wind = element.text.to_i
    end
    doc.search(".panel-simple table:nth-child(11) tr:nth-child(1) td:nth-child(#{num}) span:nth-child(1)").each_with_index do |element, index|
      wind_direction = element.text
    end
    doc.search(".panel-simple table:nth-child(9) tr:nth-child(3) td:nth-child(#{num})").each_with_index do |element, index|
      snowfall = element.text.gsub(/</, "").gsub(/cm/, "").to_i
    end
    doc.search(".panel-simple table:nth-child(5) thead th:nth-child(#{num})").each_with_index do |element, index|
      day = element.text[1, 3]
    end
    forecast = Forecast.create(
      resort: resort,
      max_temperature: max,
      min_temperature: min,
      wind_speed: wind,
      wind_direction: wind_direction,
      snow_amount: snowfall,
      forecast_day: day
    )
    p forecast
    forecast.save
  end
end

puts "Creating weather forecasts"

# Resort.all.each do |resort|
#   scrape_weather(resort)
# end
scrape_weather(Resort.first)


puts "Finished creating weather forecasts"

