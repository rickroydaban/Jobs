//
//  CountryList.m
//  Jobs
//
//  Created by Rick Royd Aban on 9/26/14.
//  Copyright (c) 2014 applusvelosi. All rights reserved.
//
#define ANY @"Any"
#define AFGHANISTAN @"Afghanistan"
#define ALAND_ISLANDS @"Aland Islands"
#define ALBANIA @"Albania"
#define ALGERIA @"Algeria"
#define AMERICAN_SAMOA  @"American Samoa"
#define ANDRORRA @"Andorra"
#define ANGOLA @"Angola"
#define ANGUILLA @"Anguilla"
#define ANTARTCTICA @"Antarctica"
#define ANTIGUA_AND_BARBUDA @"Antigua and Barbuda"
#define ARGENTINA @"Argentina"
#define ARMENIA @"Armenia"
#define ARUBA @"Aruba"
#define AUSTRALIA @"Australia"
#define AUSTRIA @"Austria"
#define AZERBAIJAN @"Azerbaijan"
#define BAHAMAS @"Bahamas"
#define BAHRAIN @"Bahrain"
#define BANGLADESH @"Banglaadesh"
#define BARBADOS @"Barbados"
#define BELARUS @"Belarus"
#define BELGIUM @"Belgium"
#define BELIZE @"Belize"
#define BENIN @"Benin"
#define BERMUDA @"Bermuda"
#define BHUTAN @"Bhutan"
#define BOLIVIA @"Bolivia"
#define BONAIRE @"Bonaire, Saint Eustatius and Saba"
#define BOSNIA_AND_HERZEGOVINA @"Bosnia and Herzegovina"
#define BOTSWANA @"Botswana"
#define BOUVET_ISLAND @"Bouvet Islands"
#define BRAZIL @"Brazil"
#define BRITISH_INDIAN_OCEAN_TERRITORY @"British Indian Ocean Territory"
#define BRUNEI @"Brunei Darussalam"
#define BULGARIA @"Bulgaria"
#define BURKINA_FASO @"Burkina Faso"
#define BURUNDI @"Burundi"
#define CAMBODIA @"Cambodia"
#define CAMEROON @"Cameroon"
#define CANADA @"Canada"
#define CAPE_VERDE @"Cape Verde"
#define CAYMAN_ISLANDS @"Cayman Islands"
#define CENTRAL_AFRICAN_REPUBLIC @"Central African Republic"
#define CHAD @"Chad"
#define CHILE @"Chile"
#define CHINA @"China"
#define CHRISTMAS_ISLAND @"Christmas Islands"
#define COCOS_ISLAND @"Cocos (Keeling) Islands"
#define COLOMBIA @"Colombia"
#define COMOROS @"Comoros"
#define CONGO @"Congo"
#define CONGO_DEMOCRATIC @"Congo, The Democratic Republic of the"
#define COOK_ISLANDS @"Cook Islands"
#define COSTA_RICA @"Costa Rica"
#define COTE @"Cote d'Ivoire"
#define CROATIA @"Croatia"
#define CUBA @"Cuba"
#define CURACAO @"Curacao"
#define CYPRUS @"Cyprus"
#define CZECH @"Czech Republic"
#define DENMARK @"Denmark"
#define DJIBOUTI @"Djibouti"
#define DOMINICA @"Dominica"
#define DOMINICAN_REPUBLIC @"Dominican Republic"
#define ECUADOR @"Ecuador"
#define EGYPT @"Egypt"
#define EL_SALVADOR @"El Salvador"
#define EQUATORIAL_GUINEA @"Equatorial Guinea"
#define ERITREA @"Eritrea"
#define ESTONIA @"Estonia"
#define ETHIOPIA @"Ethiopia"
#define FALKLAND_ISLANDS @"Falkland Islands (Malvinas)"
#define FAROE_ISLANDS @"Faroe Islands"
#define FIJI @"Fiji"
#define FINLAND @"Finland"
#define FRANCE @"France"
#define FRENCH_GUIANA @"Frech Guiana"
#define FRENCH_POLYNESIA @"French Polynesia"
#define FRECH_SOUTHERN_TERRITORIES @"French Southern Territories"
#define GABON @"Gabon"
#define GAMBIA @"Gambia"
#define GEORGIA @"Georgia"
#define GERMANY @"Germany"
#define GHANA @"Ghana"
#define GIBRALTAR @"Gibraltar"
#define GREECE @"Greece"
#define GREENLAND @"Greenland"
#define GRENADA @"Grenada"
#define GUADELOUPE @"Guadeloupe"
#define GUAM @"Guam"
#define GUATEMALA @"Guatemala"
#define GEURNSEY @"Guernsey"
#define GUINEA @"Guinea"
#define GUINEA_BISSAU @"Guinea-Bissau"
#define GUYANA @"Guyana"
#define HAITI @"Haiti"
#define HEARD_ISLAND @"Heard Island and McDonald Islands"
#define HOLY_SEE @"Holy See (Vatican City State)"
#define HONDURAS @"Honduras"
#define HONGKONG @"Hong Kong"
#define HUNGARY @"Hungary"
#define ICELAND @"Iceland"
#define INDIA @"India"
#define INDONESIA @"Indonesia"
#define IRAN @"Iran, Islamic Republic of"
#define IRAQ @"Iraq"
#define IRELAND @"Ireland"
#define ISLE_OF_MAN @"Isle of Man"
#define ISRAEL @"Israel"
#define ITALY @"Italy"
#define JAMAICA @"Jamaica"
#define JAPAN @"Japan"
#define JERSEY @"Jersey"
#define JORDAN @"Jordan"
#define KAZAKHSTAN @"Kazakhstan"
#define KENYA @"Kenya"
#define KIRIBATI @"Kiribati"
#define SOUTH_KOREA @"Korea, Democratic People's Republic of"
#define NORTH_KOREA @"Korea, Republic of"
#define KUWAIT @"Kuwait"
#define KYRGYZSTAN @"Kyrgyzstan"
#define LAOS @"Lao People's Democratic Republic"
#define LATVIA @"Latvia"
#define LEBANON @"Lebanon"
#define LESOTHO @"Lesotho"
#define LIBERIA @"Liberia"
#define LIBYA @"Libyan Arab Jamahiriya"
#define LIECHTENSTEIN @"Liechtenstein"
#define LITHUANIA @"Lithuana"
#define LUXEMBOURG @"Luxembourg"
#define MACAO @"Macao"
#define MACEDONIA @"Macedonia"
#define MADAGASCAR @"Madagascar"
#define MALAWI @"Malawi"
#define MALAYSIA @"Malaysia"
#define MALDIVES @"Maldives"
#define MALI @"Mali"
#define MALTA @"Malta"
#define MARSHALL_ISLANDS @"Marshall Islands"
#define MARTINIQUE @"Martinique"
#define MAURITANIA @"Mauritinia"
#define MAURITIUS @"Mauritius"
#define MAYOTTE @"Mayotte"
#define MEXICO @"Mexico"
#define MICRONESIA @"Micronesia, Federated States of"
#define MOLDOVA @"Moldova, Republic of"
#define MONACO @"Monaco"
#define MONGOLIA @"Mongolia"
#define MONTENEGRO @"Montenegro"
#define MONTSERRAT @"Montserrat"
#define MOROCCO @"Morocco"
#define MOZAMBIQUE @"Mozambique"
#define MYANMAR @"Myanmar"
#define NAMIBIA @"Namibia"
#define NAURU @"Nauru"
#define NEPAL @"Nepal"
#define NETHERLANDS @"Netherlands"
#define NEW_CALEDONIA @"New Caledonia"
#define NEW_ZEALAND @"New Zealand"
#define NICARAGUA @"Nicaragua"
#define NIGER @"Niger"
#define NIGERIA @"Nigeria"
#define NIUE @"Niue"
#define NORFOLK_ISLAND @"Norfolk Island"
#define NORTHERN_MARIANA_ISLAND @"Northern Mariana Islands"
#define NORWAY @"Norway"
#define OMAN @"Oman"
#define OTHER_COUNTRY @"Other Country"
#define PAKISTAN @"Pakistan"
#define PALAU @"Palau"
#define PALESTINE @"Palestinian Territory"
#define PANAMA @"Panama"
#define PAPUA_NEW_GUINEA @"Papua New Guinea"
#define PARAGUAY @"Paraguay"
#define PERU @"Peru"
#define PHILIPPINES @"Philippines"
#define PITCAIRN @"Pitcairn"
#define POLAND @"Poland"
#define PORTUGAL @"Portugal"
#define PUERTO_RICO @"Puerto Rico"
#define QATAR @"Qatar"
#define REUNION @"Reunion"
#define ROMANIA @"Romania"
#define RUSSIAN_FEDERATION @"Russian Federation"
#define RWANDA @"Rwanda"
#define SAINT_BARTELEMEY @"Saint Bartelemey"
#define SAINT_HELENA @"Saint Helena"
#define SAINT_KITTS @"Saint Kitts and Nevis"
#define SAINT_LUCIA @"Saint Lucia"
#define SAINT_MARTIN @"Saint Martin"
#define SAINT_PIERRE @"Saint Pierre and Miquelon"
#define SAINT_VINCENT @"Saint Vincent and the Grenadines"
#define SAMOA @"Samoa"
#define SAN_MARINO @"San Marino"
#define SAO_TOME @"Sao Tome and Principe"
#define SAUDI_ARABIA @"Saudi Arabia"
#define SENEGAL @"Senegal"
#define SERBIA @"Serbia"
#define SEYCHELLES @"Seychelles"
#define SIERRA_LEONE @"Sierra Leone"
#define SINGAPORE @"Singapore"
#define SINT_MAARTEN @"Sint Maarten"
#define SLOVAKIA @"Slovakia"
#define SLOVENIA @"Slovenia"
#define SOLOMON_ISLANDS @"Solomon Islands"
#define SOMALIA @"Somalia"
#define SOUTH_AFRICA @"South Africa"
#define SOUTH_GEORGIA @"South Georgia and the South Sandwich Islands"
#define SPAIN @"Spain"
#define SRI_LANKA @"Sri Lanka"
#define SUDAN @"Sudan"
#define SURINAME @"Suriname"
#define SVALBARD @"Svalbard and Jan Mayen"
#define SWAZILAND @"Swaziland"
#define SWEDEN @"Sweden"
#define SWITZERLAND @"Switzerland"
#define SYRIA @"Syrian Arab Republic"
#define TAIWAN @"Taiwan"
#define TAJIKISTAN @"Tajikistan"
#define TANZANIA @"Tanzania, United Republic Of"
#define THAILAND @"Thailand"
#define TIMOR @"Timor-Leste"
#define TOGO @"Togo"
#define TOKELAU @"Tokelau"
#define TONGA @"Tonga"
#define TRINIDAD @"Trinidad and Tobago"
#define TUNISIA @"Tunisia"
#define TURKEY @"Turkey"
#define TURKMENISTAN @"Turkmenistan"
#define TURKS @"Turks and Caicos Islands"
#define TUVALU @"Tuvalu"
#define UGANDA @"Uganda"
#define UKRAINE @"Ukraine"
#define UAE @"United Arab Emirates"
#define UK @"United Kingdom"
#define US @"United States"
#define US_MINOR @"United States Minor Outlying Islands"
#define URUGUAY @"Uruguay"
#define UZBEKISTAN @"Uzbekistan"
#define VANUATU @"Vanuatu"
#define VENEZUELA @"Venezuela"
#define VIETNAM @"Vietnam"
#define VIGRIN_ISLANDS_BRITISH @"Virgin Islands, British"
#define VIRGIN_ISLANDS_US @"Virgin Islands, U.S."
#define WALLIS_AND_FUTUNA @"Wallis and Futuna"
#define WESTERN_SAHARA @"Western Sahara"
#define YEMEN @"Yemen"
#define ZAMBIA @"Zambia"
#define ZIMBABWE @"Zimbabwe"


#import "CountryList.h"

@implementation CountryList

static CountryList *sharedCountryList = nil;

+ (CountryList *)sharedCountryList{
    if(sharedCountryList == nil)
        sharedCountryList = [[super alloc] init];
    
    return sharedCountryList;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _propDictCountryIds = [NSMutableDictionary dictionary];
        [_propDictCountryIds setValue:ANY forKey:@"0"];
        [_propDictCountryIds setValue:AFGHANISTAN forKey:@"1"];
        [_propDictCountryIds setValue:ALAND_ISLANDS forKey:@"2"];
        [_propDictCountryIds setValue:ALBANIA forKey:@"3"];
        [_propDictCountryIds setValue:ALGERIA forKey:@"4"];
        [_propDictCountryIds setValue:AMERICAN_SAMOA forKey:@"5"];
        [_propDictCountryIds setValue:ANDRORRA forKey:@"6"];
        [_propDictCountryIds setValue:ANGOLA forKey:@"7"];
        [_propDictCountryIds setValue:ANGUILLA forKey:@"8"];
        [_propDictCountryIds setValue:ANTARTCTICA forKey:@"9"];
        [_propDictCountryIds setValue:ANTIGUA_AND_BARBUDA forKey:@"10"];
        [_propDictCountryIds setValue:ARGENTINA forKey:@"11"];
        [_propDictCountryIds setValue:ARMENIA forKey:@"12"];
        [_propDictCountryIds setValue:ARUBA forKey:@"13"];
        [_propDictCountryIds setValue:AUSTRALIA forKey:@"15"];
        [_propDictCountryIds setValue:AUSTRIA forKey:@"16"];
        [_propDictCountryIds setValue:AZERBAIJAN forKey:@"17"];
        [_propDictCountryIds setValue:BAHAMAS forKey:@"18"];
        [_propDictCountryIds setValue:BAHRAIN forKey:@"19"];
        [_propDictCountryIds setValue:BANGLADESH forKey:@"20"];
        [_propDictCountryIds setValue:BARBADOS forKey:@"21"];
        [_propDictCountryIds setValue:BELARUS forKey:@"22"];
        [_propDictCountryIds setValue:BELGIUM forKey:@"23"];
        [_propDictCountryIds setValue:BELIZE forKey:@"24"];
        [_propDictCountryIds setValue:BENIN forKey:@"25"];
        [_propDictCountryIds setValue:BERMUDA forKey:@"26"];
        [_propDictCountryIds setValue:BHUTAN forKey:@"27"];
        [_propDictCountryIds setValue:BOLIVIA forKey:@"28"];
        [_propDictCountryIds setValue:BONAIRE forKey:@"29"];
        [_propDictCountryIds setValue:BOSNIA_AND_HERZEGOVINA forKey:@"30"];
        [_propDictCountryIds setValue:BOTSWANA forKey:@"31"];
        [_propDictCountryIds setValue:BOUVET_ISLAND forKey:@"32"];
        [_propDictCountryIds setValue:BRAZIL forKey:@"33"];
        [_propDictCountryIds setValue:BRITISH_INDIAN_OCEAN_TERRITORY forKey:@"34"];
        [_propDictCountryIds setValue:BRUNEI forKey:@"35"];
        [_propDictCountryIds setValue:BULGARIA forKey:@"36"];
        [_propDictCountryIds setValue:BURKINA_FASO forKey:@"37"];
        [_propDictCountryIds setValue:BURUNDI forKey:@"38"];
        [_propDictCountryIds setValue:CAMBODIA forKey:@"39"];
        [_propDictCountryIds setValue:CAMEROON forKey:@"40"];
        [_propDictCountryIds setValue:CANADA forKey:@"41"];
        [_propDictCountryIds setValue:CAPE_VERDE forKey:@"42"];
        [_propDictCountryIds setValue:CAYMAN_ISLANDS forKey:@"43"];
        [_propDictCountryIds setValue:CENTRAL_AFRICAN_REPUBLIC forKey:@"44"];
        [_propDictCountryIds setValue:CHAD forKey:@"45"];
        [_propDictCountryIds setValue:CHILE forKey:@"46"];
        [_propDictCountryIds setValue:CHINA forKey:@"47"];
        [_propDictCountryIds setValue:CHRISTMAS_ISLAND forKey:@"48"];
        [_propDictCountryIds setValue:COCOS_ISLAND forKey:@"49"];
        [_propDictCountryIds setValue:COLOMBIA forKey:@"50"];
        [_propDictCountryIds setValue:COMOROS forKey:@"51"];
        [_propDictCountryIds setValue:CONGO forKey:@"52"];
        [_propDictCountryIds setValue:CONGO_DEMOCRATIC forKey:@"53"];
        [_propDictCountryIds setValue:COOK_ISLANDS forKey:@"54"];
        [_propDictCountryIds setValue:COSTA_RICA forKey:@"55"];
        [_propDictCountryIds setValue:COTE forKey:@"56"];
        [_propDictCountryIds setValue:CROATIA forKey:@"57"];
        [_propDictCountryIds setValue:CUBA forKey:@"58"];
        [_propDictCountryIds setValue:CURACAO forKey:@"59"];
        [_propDictCountryIds setValue:CYPRUS forKey:@"60"];
        [_propDictCountryIds setValue:CZECH forKey:@"61"];
        [_propDictCountryIds setValue:DENMARK forKey:@"62"];
        [_propDictCountryIds setValue:DJIBOUTI forKey:@"63"];
        [_propDictCountryIds setValue:DOMINICA forKey:@"64"];
        [_propDictCountryIds setValue:DOMINICAN_REPUBLIC forKey:@"65"];
        [_propDictCountryIds setValue:ECUADOR forKey:@"66"];
        [_propDictCountryIds setValue:EGYPT forKey:@"67"];
        [_propDictCountryIds setValue:EL_SALVADOR forKey:@"68"];
        [_propDictCountryIds setValue:EQUATORIAL_GUINEA forKey:@"69"];
        [_propDictCountryIds setValue:ERITREA forKey:@"70"];
        [_propDictCountryIds setValue:ESTONIA forKey:@"71"];
        [_propDictCountryIds setValue:ETHIOPIA forKey:@"72"];
        [_propDictCountryIds setValue:FALKLAND_ISLANDS forKey:@"74"];
        [_propDictCountryIds setValue:FAROE_ISLANDS forKey:@"75"];
        [_propDictCountryIds setValue:FIJI forKey:@"76"];
        [_propDictCountryIds setValue:FINLAND forKey:@"77"];
        [_propDictCountryIds setValue:FRANCE forKey:@"78"];
        [_propDictCountryIds setValue:FRENCH_GUIANA forKey:@"79"];
        [_propDictCountryIds setValue:FRENCH_POLYNESIA forKey:@"80"];
        [_propDictCountryIds setValue:FRECH_SOUTHERN_TERRITORIES forKey:@"81"];
        [_propDictCountryIds setValue:GABON forKey:@"82"];
        [_propDictCountryIds setValue:GAMBIA forKey:@"83"];
        [_propDictCountryIds setValue:GEORGIA forKey:@"84"];
        [_propDictCountryIds setValue:GERMANY forKey:@"85"];
        [_propDictCountryIds setValue:GHANA forKey:@"86"];
        [_propDictCountryIds setValue:GIBRALTAR forKey:@"87"];
        [_propDictCountryIds setValue:GREECE forKey:@"88"];
        [_propDictCountryIds setValue:GREENLAND forKey:@"89"];
        [_propDictCountryIds setValue:GRENADA forKey:@"90"];
        [_propDictCountryIds setValue:GUADELOUPE forKey:@"91"];
        [_propDictCountryIds setValue:GUAM forKey:@"92"];
        [_propDictCountryIds setValue:GUATEMALA forKey:@"93"];
        [_propDictCountryIds setValue:GEURNSEY forKey:@"94"];
        [_propDictCountryIds setValue:GUINEA forKey:@"95"];
        [_propDictCountryIds setValue:GUINEA_BISSAU forKey:@"96"];
        [_propDictCountryIds setValue:GUYANA forKey:@"97"];
        [_propDictCountryIds setValue:HAITI forKey:@"98"];
        [_propDictCountryIds setValue:HEARD_ISLAND forKey:@"99"];
        [_propDictCountryIds setValue:HOLY_SEE forKey:@"100"];
        [_propDictCountryIds setValue:HONDURAS forKey:@"101"];
        [_propDictCountryIds setValue:HONGKONG forKey:@"102"];
        [_propDictCountryIds setValue:HUNGARY forKey:@"103"];
        [_propDictCountryIds setValue:ICELAND forKey:@"104"];
        [_propDictCountryIds setValue:INDIA forKey:@"105"];
        [_propDictCountryIds setValue:INDONESIA forKey:@"106"];
        [_propDictCountryIds setValue:IRAN forKey:@"107"];
        [_propDictCountryIds setValue:IRAQ forKey:@"108"];
        [_propDictCountryIds setValue:IRELAND forKey:@"109"];
        [_propDictCountryIds setValue:ISLE_OF_MAN forKey:@"110"];
        [_propDictCountryIds setValue:ISRAEL forKey:@"111"];
        [_propDictCountryIds setValue:ITALY forKey:@"112"];
        [_propDictCountryIds setValue:JAMAICA forKey:@"113"];
        [_propDictCountryIds setValue:JAPAN forKey:@"114"];
        [_propDictCountryIds setValue:JERSEY forKey:@"115"];
        [_propDictCountryIds setValue:JORDAN forKey:@"116"];
        [_propDictCountryIds setValue:KAZAKHSTAN forKey:@"117"];
        [_propDictCountryIds setValue:KENYA forKey:@"118"];
        [_propDictCountryIds setValue:KIRIBATI forKey:@"119"];
        [_propDictCountryIds setValue:SOUTH_KOREA forKey:@"120"];
        [_propDictCountryIds setValue:NORTH_KOREA forKey:@"121"];
        [_propDictCountryIds setValue:KUWAIT forKey:@"122"];
        [_propDictCountryIds setValue:KYRGYZSTAN forKey:@"123"];
        [_propDictCountryIds setValue:LAOS forKey:@"124"];
        [_propDictCountryIds setValue:LATVIA forKey:@"125"];
        [_propDictCountryIds setValue:LEBANON forKey:@"126"];
        [_propDictCountryIds setValue:LESOTHO forKey:@"127"];
        [_propDictCountryIds setValue:LIBERIA forKey:@"128"];
        [_propDictCountryIds setValue:LIBYA forKey:@"129"];
        [_propDictCountryIds setValue:LIECHTENSTEIN forKey:@"130"];
        [_propDictCountryIds setValue:LITHUANIA forKey:@"131"];
        [_propDictCountryIds setValue:LUXEMBOURG forKey:@"132"];
        [_propDictCountryIds setValue:MACAO forKey:@"133"];
        [_propDictCountryIds setValue:MACEDONIA forKey:@"134"];
        [_propDictCountryIds setValue:MADAGASCAR forKey:@"135"];
        [_propDictCountryIds setValue:MALAWI forKey:@"136"];
        [_propDictCountryIds setValue:MALAYSIA forKey:@"137"];
        [_propDictCountryIds setValue:MALDIVES forKey:@"138"];
        [_propDictCountryIds setValue:MALI forKey:@"139"];
        [_propDictCountryIds setValue:MALTA forKey:@"140"];
        [_propDictCountryIds setValue:MARSHALL_ISLANDS forKey:@"141"];
        [_propDictCountryIds setValue:MARTINIQUE forKey:@"142"];
        [_propDictCountryIds setValue:MAURITANIA forKey:@"143"];
        [_propDictCountryIds setValue:MAURITIUS forKey:@"144"];
        [_propDictCountryIds setValue:MAYOTTE forKey:@"145"];
        [_propDictCountryIds setValue:MEXICO forKey:@"146"];
        [_propDictCountryIds setValue:MICRONESIA forKey:@"147"];
        [_propDictCountryIds setValue:MOLDOVA forKey:@"148"];
        [_propDictCountryIds setValue:MONACO forKey:@"149"];
        [_propDictCountryIds setValue:MONGOLIA forKey:@"150"];
        [_propDictCountryIds setValue:MONTENEGRO forKey:@"151"];
        [_propDictCountryIds setValue:MONTSERRAT forKey:@"152"];
        [_propDictCountryIds setValue:MOROCCO forKey:@"153"];
        [_propDictCountryIds setValue:MOZAMBIQUE forKey:@"154"];
        [_propDictCountryIds setValue:MYANMAR forKey:@"155"];
        [_propDictCountryIds setValue:NAMIBIA forKey:@"156"];
        [_propDictCountryIds setValue:NAURU forKey:@"157"];
        [_propDictCountryIds setValue:NEPAL forKey:@"158"];
        [_propDictCountryIds setValue:NETHERLANDS forKey:@"159"];
        [_propDictCountryIds setValue:NEW_CALEDONIA forKey:@"160"];
        [_propDictCountryIds setValue:NEW_ZEALAND forKey:@"161"];
        [_propDictCountryIds setValue:NICARAGUA forKey:@"162"];
        [_propDictCountryIds setValue:NIGER forKey:@"163"];
        [_propDictCountryIds setValue:NIGERIA forKey:@"164"];
        [_propDictCountryIds setValue:NIUE forKey:@"165"];
        [_propDictCountryIds setValue:NORFOLK_ISLAND forKey:@"166"];
        [_propDictCountryIds setValue:NORTHERN_MARIANA_ISLAND forKey:@"167"];
        [_propDictCountryIds setValue:NORWAY forKey:@"168"];
        [_propDictCountryIds setValue:OMAN forKey:@"169"];
        [_propDictCountryIds setValue:OTHER_COUNTRY forKey:@"999"];
        [_propDictCountryIds setValue:PAKISTAN forKey:@"170"];
        [_propDictCountryIds setValue:PALAU forKey:@"171"];
        [_propDictCountryIds setValue:PALESTINE forKey:@"172"];
        [_propDictCountryIds setValue:PANAMA forKey:@"173"];
        [_propDictCountryIds setValue:PAPUA_NEW_GUINEA forKey:@"174"];
        [_propDictCountryIds setValue:PARAGUAY forKey:@"175"];
        [_propDictCountryIds setValue:PERU forKey:@"176"];
        [_propDictCountryIds setValue:PHILIPPINES forKey:@"177"];
        [_propDictCountryIds setValue:PITCAIRN forKey:@"178"];
        [_propDictCountryIds setValue:POLAND forKey:@"179"];
        [_propDictCountryIds setValue:PORTUGAL forKey:@"180"];
        [_propDictCountryIds setValue:PUERTO_RICO forKey:@"181"];
        [_propDictCountryIds setValue:QATAR forKey:@"182"];
        [_propDictCountryIds setValue:REUNION forKey:@"183"];
        [_propDictCountryIds setValue:ROMANIA forKey:@"184"];
        [_propDictCountryIds setValue:RUSSIAN_FEDERATION forKey:@"185"];
        [_propDictCountryIds setValue:RWANDA forKey:@"186"];
        [_propDictCountryIds setValue:SAINT_BARTELEMEY forKey:@"187"];
        [_propDictCountryIds setValue:SAINT_HELENA forKey:@"188"];
        [_propDictCountryIds setValue:SAINT_KITTS forKey:@"189"];
        [_propDictCountryIds setValue:SAINT_LUCIA forKey:@"190"];
        [_propDictCountryIds setValue:SAINT_MARTIN forKey:@"191"];
        [_propDictCountryIds setValue:SAINT_PIERRE forKey:@"192"];
        [_propDictCountryIds setValue:SAINT_VINCENT forKey:@"193"];
        [_propDictCountryIds setValue:SAMOA forKey:@"194"];
        [_propDictCountryIds setValue:SAN_MARINO forKey:@"195"];
        [_propDictCountryIds setValue:SAO_TOME forKey:@"196"];
        [_propDictCountryIds setValue:SAUDI_ARABIA forKey:@"197"];
        [_propDictCountryIds setValue:SENEGAL forKey:@"198"];
        [_propDictCountryIds setValue:SERBIA forKey:@"199"];
        [_propDictCountryIds setValue:SEYCHELLES forKey:@"200"];
        [_propDictCountryIds setValue:SIERRA_LEONE forKey:@"201"];
        [_propDictCountryIds setValue:SINGAPORE forKey:@"202"];
        [_propDictCountryIds setValue:SINT_MAARTEN forKey:@"203"];
        [_propDictCountryIds setValue:SLOVAKIA forKey:@"204"];
        [_propDictCountryIds setValue:SLOVENIA forKey:@"205"];
        [_propDictCountryIds setValue:SOLOMON_ISLANDS forKey:@"206"];
        [_propDictCountryIds setValue:SOMALIA forKey:@"207"];
        [_propDictCountryIds setValue:SOUTH_AFRICA forKey:@"208"];
        [_propDictCountryIds setValue:SOUTH_GEORGIA forKey:@"209"];
        [_propDictCountryIds setValue:SPAIN forKey:@"210"];
        [_propDictCountryIds setValue:SRI_LANKA forKey:@"211"];
        [_propDictCountryIds setValue:SUDAN forKey:@"212"];
        [_propDictCountryIds setValue:SURINAME forKey:@"213"];
        [_propDictCountryIds setValue:SVALBARD forKey:@"214"];
        [_propDictCountryIds setValue:SWAZILAND forKey:@"215"];
        [_propDictCountryIds setValue:SWEDEN forKey:@"216"];
        [_propDictCountryIds setValue:SWITZERLAND forKey:@"217"];
        [_propDictCountryIds setValue:SYRIA forKey:@"218"];
        [_propDictCountryIds setValue:TAIWAN forKey:@"219"];
        [_propDictCountryIds setValue:TAJIKISTAN forKey:@"220"];
        [_propDictCountryIds setValue:TANZANIA forKey:@"221"];
        [_propDictCountryIds setValue:THAILAND forKey:@"222"];
        [_propDictCountryIds setValue:TIMOR forKey:@"223"];
        [_propDictCountryIds setValue:TOGO forKey:@"224"];
        [_propDictCountryIds setValue:TOKELAU forKey:@"225"];
        [_propDictCountryIds setValue:TONGA forKey:@"226"];
        [_propDictCountryIds setValue:TRINIDAD forKey:@"227"];
        [_propDictCountryIds setValue:TUNISIA forKey:@"228"];
        [_propDictCountryIds setValue:TURKEY forKey:@"229"];
        [_propDictCountryIds setValue:TURKMENISTAN forKey:@"230"];
        [_propDictCountryIds setValue:TURKS forKey:@"231"];
        [_propDictCountryIds setValue:TUVALU forKey:@"232"];
        [_propDictCountryIds setValue:UGANDA forKey:@"233"];
        [_propDictCountryIds setValue:UKRAINE forKey:@"234"];
        [_propDictCountryIds setValue:UAE forKey:@"235"];
        [_propDictCountryIds setValue:UK forKey:@"236"];
        [_propDictCountryIds setValue:US forKey:@"237"];
        [_propDictCountryIds setValue:US_MINOR forKey:@"238"];
        [_propDictCountryIds setValue:URUGUAY forKey:@"239"];
        [_propDictCountryIds setValue:UZBEKISTAN forKey:@"240"];
        [_propDictCountryIds setValue:VANUATU forKey:@"241"];
        [_propDictCountryIds setValue:VENEZUELA forKey:@"242"];
        [_propDictCountryIds setValue:VIETNAM forKey:@"243"];
        [_propDictCountryIds setValue:VIGRIN_ISLANDS_BRITISH forKey:@"244"];
        [_propDictCountryIds setValue:VIRGIN_ISLANDS_US forKey:@"245"];
        [_propDictCountryIds setValue:WALLIS_AND_FUTUNA forKey:@"246"];
        [_propDictCountryIds setValue:WESTERN_SAHARA forKey:@"247"];
        [_propDictCountryIds setValue:YEMEN forKey:@"248"];
        [_propDictCountryIds setValue:ZAMBIA forKey:@"249"];
        [_propDictCountryIds setValue:ZIMBABWE forKey:@"250"];
        
        _aCountries = @[ANY, AFGHANISTAN, ALAND_ISLANDS, ALBANIA, ALGERIA, AMERICAN_SAMOA, ANDRORRA, ANGOLA, ANGUILLA, ANTARTCTICA, ANTIGUA_AND_BARBUDA, ARGENTINA, ARMENIA, ARUBA, AUSTRALIA, AUSTRIA, AZERBAIJAN];
        _bCountries = @[BAHAMAS, BAHRAIN, BANGLADESH, BARBADOS, BELARUS, BELGIUM, BELIZE, BENIN, BERMUDA, BHUTAN, BOLIVIA, BONAIRE, BOSNIA_AND_HERZEGOVINA, BOTSWANA, BOUVET_ISLAND, BRAZIL, BRITISH_INDIAN_OCEAN_TERRITORY, BRUNEI, BULGARIA, BURKINA_FASO, BURUNDI];
        _cCountries = @[CAMBODIA, CAMEROON, CANADA, CAPE_VERDE, CAYMAN_ISLANDS, CENTRAL_AFRICAN_REPUBLIC, CHAD, CHILE, CHINA, CHRISTMAS_ISLAND, COCOS_ISLAND, COLOMBIA, COMOROS, CONGO, CONGO_DEMOCRATIC, COOK_ISLANDS, COSTA_RICA, COTE, CROATIA, CUBA, CURACAO, CYPRUS, CZECH];
        _dCountries = @[DENMARK, DJIBOUTI, DOMINICA, DOMINICAN_REPUBLIC];
        _eCountries = @[ECUADOR, EGYPT, EL_SALVADOR, EQUATORIAL_GUINEA, ERITREA, ESTONIA, ETHIOPIA];
        _fCountries = @[FALKLAND_ISLANDS, FAROE_ISLANDS, FIJI, FINLAND, FRANCE, FRENCH_GUIANA, FRENCH_POLYNESIA, FRECH_SOUTHERN_TERRITORIES];
        _gCountries = @[GABON,GAMBIA, GEORGIA, GERMANY, GHANA, GIBRALTAR, GREECE, GREENLAND, GRENADA, GUADELOUPE, GUAM, GUATEMALA, GEURNSEY, GUINEA, GUINEA_BISSAU, GUYANA];
        _hCountries = @[HAITI, HEARD_ISLAND, HOLY_SEE, HONDURAS, HONGKONG, HUNGARY];
        _iCountries = @[ICELAND, INDIA, INDONESIA, IRAN, IRAQ, IRELAND, ISLE_OF_MAN, ISRAEL, ITALY];
        _jCountries = @[JAMAICA, JAPAN, JERSEY, JORDAN];
        _kCountries = @[KAZAKHSTAN, KENYA, KIRIBATI, NORTH_KOREA, SOUTH_KOREA, KUWAIT, KYRGYZSTAN];
        _lCountries = @[LAOS, LATVIA, LEBANON, LESOTHO, LIBERIA, LIBYA, LIECHTENSTEIN, LITHUANIA, LUXEMBOURG];
        _mCountries = @[MACAO, MACEDONIA, MADAGASCAR, MALAWI, MALAYSIA, MALDIVES, MALI, MALTA, MARSHALL_ISLANDS, MARTINIQUE, MAURITANIA, MAURITIUS, MAYOTTE, MEXICO, MICRONESIA, MOLDOVA, MONACO, MONGOLIA, MONTENEGRO, MONTSERRAT, MOROCCO, MOZAMBIQUE, MYANMAR];
        _nCountries = @[NAMIBIA, NAURU, NEPAL, NETHERLANDS, NEW_CALEDONIA, NEW_ZEALAND, NICARAGUA, NIGER, NIGERIA, NIUE, NORFOLK_ISLAND, NORTHERN_MARIANA_ISLAND, NORWAY];
        _oCountries = @[OMAN, OTHER_COUNTRY];
        _pCountries = @[PAKISTAN, PALAU, PALESTINE, PANAMA, PAPUA_NEW_GUINEA, PARAGUAY, PERU, PHILIPPINES, PITCAIRN, POLAND, PORTUGAL, PUERTO_RICO];
        _qCountries = @[QATAR];
        _rCountries = @[REUNION, ROMANIA, RUSSIAN_FEDERATION, RWANDA];
        _sCountries = @[SAINT_BARTELEMEY, SAINT_HELENA, SAINT_KITTS, SAINT_LUCIA, SAINT_MARTIN, SAINT_PIERRE, SAINT_VINCENT, SAMOA, SAN_MARINO, SAO_TOME, SAUDI_ARABIA, SENEGAL, SERBIA, SEYCHELLES, SIERRA_LEONE, SINGAPORE, SINT_MAARTEN, SLOVAKIA, SLOVENIA, SOLOMON_ISLANDS, SOMALIA, SOUTH_AFRICA, SOUTH_GEORGIA, SPAIN, SRI_LANKA, SUDAN, SURINAME, SVALBARD, SWAZILAND, SWEDEN, SWITZERLAND, SYRIA];
        _tCountries = @[TAIWAN, TAJIKISTAN, TANZANIA, THAILAND, TIMOR, TOKELAU, TONGA, TOKELAU, TONGA, TRINIDAD, TUNISIA, TURKEY, TURKMENISTAN, TURKS, TUVALU];
        _uCountries = @[UGANDA, UKRAINE, UAE, UK, US, US_MINOR, URUGUAY, UZBEKISTAN];
        _vCountries = @[VANUATU, VENEZUELA, VIETNAM, VIGRIN_ISLANDS_BRITISH, VIRGIN_ISLANDS_US];
        _wCountries = @[WALLIS_AND_FUTUNA, WESTERN_SAHARA];
        _yCountries = @[YEMEN];
        _zCountries = @[ZAMBIA, ZIMBABWE];
        
        self.propListCountries = [NSMutableArray arrayWithObjects:_aCountries, _bCountries, _cCountries, _dCountries, _eCountries, _fCountries, _gCountries, _hCountries, _iCountries, _jCountries, _kCountries, _lCountries, _mCountries, _nCountries, _oCountries, _pCountries, _qCountries, _rCountries, _sCountries, _tCountries, _uCountries, _vCountries, _wCountries, _yCountries, _zCountries, nil];
        
    }
    return self;
}

@end
