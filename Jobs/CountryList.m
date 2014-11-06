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
#define MALAYSIA @"Maysia"
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
#define SWEDEN @"Swedend"
#define SWITZERLAND @"Switzerland"
#define SYRIA @"Syrian Arab Republic"
#define TAIWAN @"Tawian"
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
#define UAE @"United Arab Emirates "
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
#define WALLIS_AND_FUTUNA @"Wwallis and Futuna"
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
        [_propDictCountryIds setValue:@"0" forKey:ANY];
        [_propDictCountryIds setValue:@"1" forKey:AFGHANISTAN];
        [_propDictCountryIds setValue:@"2" forKey:ALAND_ISLANDS];
        [_propDictCountryIds setValue:@"3" forKey:ALBANIA];
        [_propDictCountryIds setValue:@"4" forKey:ALGERIA];
        [_propDictCountryIds setValue:@"5" forKey:AMERICAN_SAMOA];
        [_propDictCountryIds setValue:@"6" forKey:ANDRORRA];
        [_propDictCountryIds setValue:@"7" forKey:ANGOLA];
        [_propDictCountryIds setValue:@"8" forKey:ANGUILLA];
        [_propDictCountryIds setValue:@"9" forKey:ANTARTCTICA];
        [_propDictCountryIds setValue:@"10" forKey:ANTIGUA_AND_BARBUDA];
        [_propDictCountryIds setValue:@"11" forKey:ARGENTINA];
        [_propDictCountryIds setValue:@"12" forKey:ARMENIA];
        [_propDictCountryIds setValue:@"13" forKey:ARUBA];
        [_propDictCountryIds setValue:@"15" forKey:AUSTRALIA];
        [_propDictCountryIds setValue:@"16" forKey:AUSTRIA];
        [_propDictCountryIds setValue:@"17" forKey:AZERBAIJAN];
        [_propDictCountryIds setValue:@"18" forKey:BAHAMAS];
        [_propDictCountryIds setValue:@"19" forKey:BAHRAIN];
        [_propDictCountryIds setValue:@"20" forKey:BANGLADESH];
        [_propDictCountryIds setValue:@"21" forKey:BARBADOS];
        [_propDictCountryIds setValue:@"22" forKey:BELARUS];
        [_propDictCountryIds setValue:@"23" forKey:BELGIUM];
        [_propDictCountryIds setValue:@"24" forKey:BELIZE];
        [_propDictCountryIds setValue:@"25" forKey:BENIN];
        [_propDictCountryIds setValue:@"26" forKey:BERMUDA];
        [_propDictCountryIds setValue:@"27" forKey:BHUTAN];
        [_propDictCountryIds setValue:@"28" forKey:BOLIVIA];
        [_propDictCountryIds setValue:@"29" forKey:BONAIRE];
        [_propDictCountryIds setValue:@"30" forKey:BOSNIA_AND_HERZEGOVINA];
        [_propDictCountryIds setValue:@"31" forKey:BOTSWANA];
        [_propDictCountryIds setValue:@"32" forKey:BOUVET_ISLAND];
        [_propDictCountryIds setValue:@"33" forKey:BRAZIL];
        [_propDictCountryIds setValue:@"34" forKey:BRITISH_INDIAN_OCEAN_TERRITORY];
        [_propDictCountryIds setValue:@"35" forKey:BRUNEI];
        [_propDictCountryIds setValue:@"36" forKey:BULGARIA];
        [_propDictCountryIds setValue:@"37" forKey:BURKINA_FASO];
        [_propDictCountryIds setValue:@"38" forKey:BURUNDI];
        [_propDictCountryIds setValue:@"39" forKey:CAMBODIA];
        [_propDictCountryIds setValue:@"40" forKey:CAMEROON];
        [_propDictCountryIds setValue:@"41" forKey:CANADA];
        [_propDictCountryIds setValue:@"42" forKey:CAPE_VERDE];
        [_propDictCountryIds setValue:@"43" forKey:CAYMAN_ISLANDS];
        [_propDictCountryIds setValue:@"44" forKey:CENTRAL_AFRICAN_REPUBLIC];
        [_propDictCountryIds setValue:@"45" forKey:CHAD];
        [_propDictCountryIds setValue:@"46" forKey:CHILE];
        [_propDictCountryIds setValue:@"47" forKey:CHINA];
        [_propDictCountryIds setValue:@"48" forKey:CHRISTMAS_ISLAND];
        [_propDictCountryIds setValue:@"49" forKey:COCOS_ISLAND];
        [_propDictCountryIds setValue:@"50" forKey:COLOMBIA];
        [_propDictCountryIds setValue:@"51" forKey:COMOROS];
        [_propDictCountryIds setValue:@"52" forKey:CONGO];
        [_propDictCountryIds setValue:@"53" forKey:CONGO_DEMOCRATIC];
        [_propDictCountryIds setValue:@"54" forKey:COOK_ISLANDS];
        [_propDictCountryIds setValue:@"55" forKey:COSTA_RICA];
        [_propDictCountryIds setValue:@"56" forKey:COTE];
        [_propDictCountryIds setValue:@"57" forKey:CROATIA];
        [_propDictCountryIds setValue:@"58" forKey:CUBA];
        [_propDictCountryIds setValue:@"59" forKey:CURACAO];
        [_propDictCountryIds setValue:@"60" forKey:CYPRUS];
        [_propDictCountryIds setValue:@"61" forKey:CZECH];
        [_propDictCountryIds setValue:@"62" forKey:DENMARK];
        [_propDictCountryIds setValue:@"63" forKey:DJIBOUTI];
        [_propDictCountryIds setValue:@"64" forKey:DOMINICA];
        [_propDictCountryIds setValue:@"65" forKey:DOMINICAN_REPUBLIC];
        [_propDictCountryIds setValue:@"66" forKey:ECUADOR];
        [_propDictCountryIds setValue:@"67" forKey:EGYPT];
        [_propDictCountryIds setValue:@"68" forKey:EL_SALVADOR];
        [_propDictCountryIds setValue:@"69" forKey:EQUATORIAL_GUINEA];
        [_propDictCountryIds setValue:@"70" forKey:ERITREA];
        [_propDictCountryIds setValue:@"71" forKey:ESTONIA];
        [_propDictCountryIds setValue:@"72" forKey:ETHIOPIA];
        [_propDictCountryIds setValue:@"74" forKey:FALKLAND_ISLANDS];
        [_propDictCountryIds setValue:@"75" forKey:FAROE_ISLANDS];
        [_propDictCountryIds setValue:@"76" forKey:FIJI];
        [_propDictCountryIds setValue:@"77" forKey:FINLAND];
        [_propDictCountryIds setValue:@"78" forKey:FRANCE];
        [_propDictCountryIds setValue:@"79" forKey:FRENCH_GUIANA];
        [_propDictCountryIds setValue:@"80" forKey:FRENCH_POLYNESIA];
        [_propDictCountryIds setValue:@"81" forKey:FRECH_SOUTHERN_TERRITORIES];
        [_propDictCountryIds setValue:@"82" forKey:GABON];
        [_propDictCountryIds setValue:@"83" forKey:GAMBIA];
        [_propDictCountryIds setValue:@"84" forKey:GEORGIA];
        [_propDictCountryIds setValue:@"85" forKey:GERMANY];
        [_propDictCountryIds setValue:@"86" forKey:GHANA];
        [_propDictCountryIds setValue:@"87" forKey:GIBRALTAR];
        [_propDictCountryIds setValue:@"88" forKey:GREECE];
        [_propDictCountryIds setValue:@"89" forKey:GREENLAND];
        [_propDictCountryIds setValue:@"90" forKey:GRENADA];
        [_propDictCountryIds setValue:@"91" forKey:GUADELOUPE];
        [_propDictCountryIds setValue:@"92" forKey:GUAM];
        [_propDictCountryIds setValue:@"93" forKey:GUATEMALA];
        [_propDictCountryIds setValue:@"94" forKey:GEURNSEY];
        [_propDictCountryIds setValue:@"95" forKey:GUINEA];
        [_propDictCountryIds setValue:@"96" forKey:GUINEA_BISSAU];
        [_propDictCountryIds setValue:@"97" forKey:GUYANA];
        [_propDictCountryIds setValue:@"98" forKey:HAITI];
        [_propDictCountryIds setValue:@"99" forKey:HEARD_ISLAND];
        [_propDictCountryIds setValue:@"100" forKey:HOLY_SEE];
        [_propDictCountryIds setValue:@"101" forKey:HONDURAS];
        [_propDictCountryIds setValue:@"102" forKey:HONGKONG];
        [_propDictCountryIds setValue:@"103" forKey:HUNGARY];
        [_propDictCountryIds setValue:@"104" forKey:ICELAND];
        [_propDictCountryIds setValue:@"105" forKey:INDIA];
        [_propDictCountryIds setValue:@"106" forKey:INDONESIA];
        [_propDictCountryIds setValue:@"107" forKey:IRAN];
        [_propDictCountryIds setValue:@"108" forKey:IRAQ];
        [_propDictCountryIds setValue:@"109" forKey:IRELAND];
        [_propDictCountryIds setValue:@"110" forKey:ISLE_OF_MAN];
        [_propDictCountryIds setValue:@"111" forKey:ISRAEL];
        [_propDictCountryIds setValue:@"112" forKey:ITALY];
        [_propDictCountryIds setValue:@"113" forKey:JAMAICA];
        [_propDictCountryIds setValue:@"114" forKey:JAPAN];
        [_propDictCountryIds setValue:@"115" forKey:JERSEY];
        [_propDictCountryIds setValue:@"116" forKey:JORDAN];
        [_propDictCountryIds setValue:@"117" forKey:KAZAKHSTAN];
        [_propDictCountryIds setValue:@"118" forKey:KENYA];
        [_propDictCountryIds setValue:@"119" forKey:KIRIBATI];
        [_propDictCountryIds setValue:@"120" forKey:SOUTH_KOREA];
        [_propDictCountryIds setValue:@"121" forKey:NORTH_KOREA];
        [_propDictCountryIds setValue:@"122" forKey:KUWAIT];
        [_propDictCountryIds setValue:@"123" forKey:KYRGYZSTAN];
        [_propDictCountryIds setValue:@"124" forKey:LAOS];
        [_propDictCountryIds setValue:@"125" forKey:LATVIA];
        [_propDictCountryIds setValue:@"126" forKey:LEBANON];
        [_propDictCountryIds setValue:@"127" forKey:LESOTHO];
        [_propDictCountryIds setValue:@"128" forKey:LIBERIA];
        [_propDictCountryIds setValue:@"129" forKey:LIBYA];
        [_propDictCountryIds setValue:@"130" forKey:LIECHTENSTEIN];
        [_propDictCountryIds setValue:@"131" forKey:LITHUANIA];
        [_propDictCountryIds setValue:@"132" forKey:LUXEMBOURG];
        [_propDictCountryIds setValue:@"133" forKey:MACAO];
        [_propDictCountryIds setValue:@"134" forKey:MACEDONIA];
        [_propDictCountryIds setValue:@"135" forKey:MADAGASCAR];
        [_propDictCountryIds setValue:@"136" forKey:MALAWI];
        [_propDictCountryIds setValue:@"137" forKey:MALAYSIA];
        [_propDictCountryIds setValue:@"138" forKey:MALDIVES];
        [_propDictCountryIds setValue:@"139" forKey:MALI];
        [_propDictCountryIds setValue:@"140" forKey:MALTA];
        [_propDictCountryIds setValue:@"141" forKey:MARSHALL_ISLANDS];
        [_propDictCountryIds setValue:@"142" forKey:MARTINIQUE];
        [_propDictCountryIds setValue:@"143" forKey:MAURITANIA];
        [_propDictCountryIds setValue:@"144" forKey:MAURITIUS];
        [_propDictCountryIds setValue:@"145" forKey:MAYOTTE];
        [_propDictCountryIds setValue:@"146" forKey:MEXICO];
        [_propDictCountryIds setValue:@"147" forKey:MICRONESIA];
        [_propDictCountryIds setValue:@"148" forKey:MOLDOVA];
        [_propDictCountryIds setValue:@"149" forKey:MONACO];
        [_propDictCountryIds setValue:@"150" forKey:MONGOLIA];
        [_propDictCountryIds setValue:@"151" forKey:MONTENEGRO];
        [_propDictCountryIds setValue:@"152" forKey:MONTSERRAT];
        [_propDictCountryIds setValue:@"153" forKey:MOROCCO];
        [_propDictCountryIds setValue:@"154" forKey:MOZAMBIQUE];
        [_propDictCountryIds setValue:@"155" forKey:MYANMAR];
        [_propDictCountryIds setValue:@"156" forKey:NAMIBIA];
        [_propDictCountryIds setValue:@"157" forKey:NAURU];
        [_propDictCountryIds setValue:@"158" forKey:NEPAL];
        [_propDictCountryIds setValue:@"159" forKey:NETHERLANDS];
        [_propDictCountryIds setValue:@"160" forKey:NEW_CALEDONIA];
        [_propDictCountryIds setValue:@"161" forKey:NEW_ZEALAND];
        [_propDictCountryIds setValue:@"162" forKey:NICARAGUA];
        [_propDictCountryIds setValue:@"163" forKey:NIGER];
        [_propDictCountryIds setValue:@"164" forKey:NIGERIA];
        [_propDictCountryIds setValue:@"165" forKey:NIUE];
        [_propDictCountryIds setValue:@"166" forKey:NORFOLK_ISLAND];
        [_propDictCountryIds setValue:@"167" forKey:NORTHERN_MARIANA_ISLAND];
        [_propDictCountryIds setValue:@"168" forKey:NORWAY];
        [_propDictCountryIds setValue:@"169" forKey:OMAN];
        [_propDictCountryIds setValue:@"999" forKey:OTHER_COUNTRY];
        [_propDictCountryIds setValue:@"170" forKey:PAKISTAN];
        [_propDictCountryIds setValue:@"171" forKey:PALAU];
        [_propDictCountryIds setValue:@"172" forKey:PALESTINE];
        [_propDictCountryIds setValue:@"173" forKey:PANAMA];
        [_propDictCountryIds setValue:@"174" forKey:PAPUA_NEW_GUINEA];
        [_propDictCountryIds setValue:@"175" forKey:PARAGUAY];
        [_propDictCountryIds setValue:@"176" forKey:PERU];
        [_propDictCountryIds setValue:@"177" forKey:PHILIPPINES];
        [_propDictCountryIds setValue:@"178" forKey:PITCAIRN];
        [_propDictCountryIds setValue:@"179" forKey:POLAND];
        [_propDictCountryIds setValue:@"180" forKey:PORTUGAL];
        [_propDictCountryIds setValue:@"181" forKey:PUERTO_RICO];
        [_propDictCountryIds setValue:@"182" forKey:QATAR];
        [_propDictCountryIds setValue:@"183" forKey:REUNION];
        [_propDictCountryIds setValue:@"184" forKey:ROMANIA];
        [_propDictCountryIds setValue:@"185" forKey:RUSSIAN_FEDERATION];
        [_propDictCountryIds setValue:@"186" forKey:RWANDA];
        [_propDictCountryIds setValue:@"187" forKey:SAINT_BARTELEMEY];
        [_propDictCountryIds setValue:@"188" forKey:SAINT_HELENA];
        [_propDictCountryIds setValue:@"189" forKey:SAINT_KITTS];
        [_propDictCountryIds setValue:@"190" forKey:SAINT_LUCIA];
        [_propDictCountryIds setValue:@"191" forKey:SAINT_MARTIN];
        [_propDictCountryIds setValue:@"192" forKey:SAINT_PIERRE];
        [_propDictCountryIds setValue:@"193" forKey:SAINT_VINCENT];
        [_propDictCountryIds setValue:@"194" forKey:SAMOA];
        [_propDictCountryIds setValue:@"195" forKey:SAN_MARINO];
        [_propDictCountryIds setValue:@"196" forKey:SAO_TOME];
        [_propDictCountryIds setValue:@"197" forKey:SAUDI_ARABIA];
        [_propDictCountryIds setValue:@"198" forKey:SENEGAL];
        [_propDictCountryIds setValue:@"199" forKey:SERBIA];
        [_propDictCountryIds setValue:@"200" forKey:SEYCHELLES];
        [_propDictCountryIds setValue:@"201" forKey:SIERRA_LEONE];
        [_propDictCountryIds setValue:@"202" forKey:SINGAPORE];
        [_propDictCountryIds setValue:@"203" forKey:SINT_MAARTEN];
        [_propDictCountryIds setValue:@"204" forKey:SLOVAKIA];
        [_propDictCountryIds setValue:@"205" forKey:SLOVENIA];
        [_propDictCountryIds setValue:@"206" forKey:SOLOMON_ISLANDS];
        [_propDictCountryIds setValue:@"207" forKey:SOMALIA];
        [_propDictCountryIds setValue:@"208" forKey:SOUTH_AFRICA];
        [_propDictCountryIds setValue:@"209" forKey:SOUTH_GEORGIA];
        [_propDictCountryIds setValue:@"210" forKey:SPAIN];
        [_propDictCountryIds setValue:@"211" forKey:SRI_LANKA];
        [_propDictCountryIds setValue:@"212" forKey:SUDAN];
        [_propDictCountryIds setValue:@"213" forKey:SURINAME];
        [_propDictCountryIds setValue:@"214" forKey:SVALBARD];
        [_propDictCountryIds setValue:@"215" forKey:SWAZILAND];
        [_propDictCountryIds setValue:@"216" forKey:SWEDEN];
        [_propDictCountryIds setValue:@"217" forKey:SWITZERLAND];
        [_propDictCountryIds setValue:@"218" forKey:SYRIA];
        [_propDictCountryIds setValue:@"219" forKey:TAIWAN];
        [_propDictCountryIds setValue:@"220" forKey:TAJIKISTAN];
        [_propDictCountryIds setValue:@"221" forKey:TANZANIA];
        [_propDictCountryIds setValue:@"222" forKey:THAILAND];
        [_propDictCountryIds setValue:@"223" forKey:TIMOR];
        [_propDictCountryIds setValue:@"224" forKey:TOGO];
        [_propDictCountryIds setValue:@"225" forKey:TOKELAU];
        [_propDictCountryIds setValue:@"226" forKey:TONGA];
        [_propDictCountryIds setValue:@"227" forKey:TRINIDAD];
        [_propDictCountryIds setValue:@"228" forKey:TUNISIA];
        [_propDictCountryIds setValue:@"229" forKey:TURKEY];
        [_propDictCountryIds setValue:@"230" forKey:TURKMENISTAN];
        [_propDictCountryIds setValue:@"231" forKey:TURKS];
        [_propDictCountryIds setValue:@"232" forKey:TUVALU];
        [_propDictCountryIds setValue:@"233" forKey:UGANDA];
        [_propDictCountryIds setValue:@"234" forKey:UKRAINE];
        [_propDictCountryIds setValue:@"235" forKey:UAE];
        [_propDictCountryIds setValue:@"236" forKey:UK];
        [_propDictCountryIds setValue:@"237" forKey:US];
        [_propDictCountryIds setValue:@"238" forKey:US_MINOR];
        [_propDictCountryIds setValue:@"239" forKey:URUGUAY];
        [_propDictCountryIds setValue:@"240" forKey:UZBEKISTAN];
        [_propDictCountryIds setValue:@"241" forKey:VANUATU];
        [_propDictCountryIds setValue:@"242" forKey:VENEZUELA];
        [_propDictCountryIds setValue:@"243" forKey:VIETNAM];
        [_propDictCountryIds setValue:@"244" forKey:VIGRIN_ISLANDS_BRITISH];
        [_propDictCountryIds setValue:@"245" forKey:VIRGIN_ISLANDS_US];
        [_propDictCountryIds setValue:@"246" forKey:WALLIS_AND_FUTUNA];
        [_propDictCountryIds setValue:@"247" forKey:WESTERN_SAHARA];
        [_propDictCountryIds setValue:@"248" forKey:YEMEN];
        [_propDictCountryIds setValue:@"249" forKey:ZAMBIA];
        [_propDictCountryIds setValue:@"250" forKey:ZIMBABWE];
        
        _aCountries = @[@"Any", @"Afghanistan", @"Aland Islands", @"Albania", @"Algeria", @"American Samoa", @"Andorra", @"Angola", @"Anguilla", @"Antartica", @"Antigua and Barbuda", @"Argentina", @"Armenia", @"Aruba", @"Australia", @"Austria", @"Azerbaijan"];
        _bCountries = @[@"Bahamas", @"Bahrain", @"Bangladesh", @"Barbados", @"Belarus", @"Belgium", @"Belize", @"Benin", @"Bermuda", @"Bhutan", @"Bolivia", @"Bonaire, Saint Eustastius and Saba", @"Bosnia and Herzegovina", @"Botswana", @"Bouvet Island", @"Brazil", @"British Indian Ocean Territory", @"Brunei Darussalam", @"Bulgaria", @"Burkina Faso", @"Burundi"];
        _cCountries = @[@"Cambodia", @"Cameroon", @"Canada", @"Cape Verde", @"Cayman Islands", @"Central African Republic", @"Chad", @"Chile", @"China", @"Christmas Island", @"Cocos (Keeling) Islands", @"Colombia", @"Comoros", @"Congo", @"Congo, The Democratic Republic of the", @"Cook Islands", @"Costa Rica", @"Cote d'Ivoire", @"Criotia", @"Cuba", @"Curacao", @"Cyprus", @"Czech Republic"];
        _dCountries = @[@"Denmark", @"Djibouti", @"Dominica", @"Dominican Republic"];
        _eCountries = @[@"Ecuador", @"Egypt", @"El Salvador", @"Equatorial Guinea", @"Eritrea", @"Estonia", @"Ethiopia"];
        _fCountries = @[@"Falkland Islands", @"Faroe Islands", @"Fiji", @"Finland", @"France", @"French Guiana", @"French Polynesia", @"French Southern Territories"];
        _gCountries = @[@"Gabon", @"Gambia", @"Georgia", @"Germany", @"Ghana", @"Gibraltar", @"Greece", @"Greenland", @"Grenada", @"Guadeloupe", @"Guam", @"Guatemala", @"Guernsey", @"Guinea", @"Guinea-Bissau", @"Guyana"];
        _hCountries = @[@"Haiti", @"Heard Island and McDonald Islands", @"Holy See (Vatican City State)", @"Honduras", @"Hong Kong", @"Hungary"];
        _iCountries = @[@"Iceland", @"India", @"Indonesia", @"Iran, Islamic Republic of", @"Iraq", @"Ireland", @"Isle of Man", @"Israel", @"Italy"];
        _jCountries = @[@"Jamaica", @"Japan", @"Jersey", @"Jordan"];
        _kCountries = @[@"Kazakhstan", @"Kenya", @"Kiribati", @"Korea, Democratic People's Republic Of", @"Korea, Republic of", @"Kuwait", @"Kyrgyzstan"];
        _lCountries = @[@"Lao People's Democratic Republic", @"Latvia", @"Lebanon", @"Lesotho", @"Liberia", @"Libyan Arab Jamahiriya", @"Liechtenstein", @"Lithuania", @"Luxembourg"];
        _mCountries = @[@"Macao", @"Macedonia", @"Madagascar", @"Malawi", @"Malaysia", @"Maldives", @"Mali", @"Malta", @"Marshall Islands", @"Martinique", @"Mauritania", @"Mauritius", @"Mayotte", @"Mexico", @"Micronesia, Federated States of", @"Moldova, Republic of", @"Monaco", @"Mongolia", @"Montenegro", @"Montserrat", @"Morocco", @"Mozambique", @"Myanmar"];
        _nCountries = @[@"Namibia", @"Nauru", @"Nepal", @"Netherlands", @"New Caledonia", @"New zealand", @"Nicaragua", @"Niger", @"Niue", @"Norfolk Iland", @"Northern Mariana Islands", @"Norway"];
        _oCountries = @[@"Oman", @"Other Country"];
        _pCountries = @[@"Pakistan", @"Palau", @"Palestinian Territory", @"Panama", @"Papua New Guinea", @"Paraguay", @"Peru", @"Philippines", @"Pitcairn", @"Poland", @"Portugal", @"Puerto Rico"];
        _qCountries = @[@"Qatar"];
        _rCountries = @[@"Reunion", @"Romania", @"Rwanda"];
        _sCountries = @[@"Saint Bartelemey", @"Saint Helena", @"Saint Kitts and Nevis", @"Saint Lucia", @"Saint Martin", @"Saint Pierre and Miquelon", @"Sain Vincent and Grenadines", @"Samoa", @"San Marino", @"Sao Tome and Principe", @"Saudi Arabia", @"Senegal", @"Serbia", @"Seychelles", @"Sierra Leone", @"Singapore", @"Sint Maarten", @"Slovakia", @"Slovenia", @"Solomon Islands", @"Somalia", @"South Africa", @"South Georgia and the South Sandwich Islands", @"Spain", @"Sri Lanka", @"Sudan", @"Suriname", @"Svalbard and Jan Mayen", @"Swaziland", @"Sweden", @"Switzerland", @"Syrian Arab Republic"];
        _tCountries = @[@"Taiwan", @"Tajikistan", @"Tanzania, United Republic of", @"Thailand", @"Timor-Leste", @"Togo", @"Tokelau", @"Tonga", @"Trinidad and Tobago", @"Tunisia", @"Turkey", @"Turkmenistan", @"Turks and Caicos Islands", @"Tuvalu"];
        _uCountries = @[@"Uganda", @"Ukraine", @"United Arab Emirates", @"United Kingdom", @"United States", @"United States Minor Outlying Islads", @"Uruguay", @"Uzbekistan"];
        _vCountries = @[@"Vanuatu", @"Venezuela", @"Vietnam", @"Virgin Islands, British", @"Virgin Islands, U.S."];
        _wCountries = @[@"Wallis and Futuna", @"Western Sahara"];
        _yCountries = @[@"Yemen"];
        _zCountries = @[@"Zambia", @"Zimbabwe"];
        
        self.propListCountries = [NSMutableArray arrayWithObjects:_aCountries, _bCountries, _cCountries, _dCountries, _eCountries, _fCountries, _gCountries, _hCountries, _iCountries, _jCountries, _kCountries, _lCountries, _mCountries, _nCountries, _oCountries, _pCountries, _qCountries, _rCountries, _sCountries, _tCountries, _uCountries, _vCountries, _wCountries, _yCountries, _zCountries, nil];
        
    }
    return self;
}

@end
