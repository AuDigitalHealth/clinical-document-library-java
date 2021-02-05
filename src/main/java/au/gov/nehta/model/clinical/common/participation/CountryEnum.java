/*
 * Copyright 2011 NEHTA
 *
 * Licensed under the NEHTA Open Source (Apache) License; you may not use this
 * file except in compliance with the License. A copy of the License is in the
 * 'license.txt' file, which should be provided with this work.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */

package au.gov.nehta.model.clinical.common.participation;

public enum CountryEnum {
    AUSTRALIA("1101", "Australia"), NORFOLK_ISLAND("1102", "Norfolk Island"), AUSTRALIAN_EXTERNAL_TERRITORIES_NEC("1199", "Australian External Territories, nec"), NEW_ZEALAND("1201",
            "New Zealand"), NEW_CALEDONIA("1301", "New Caledonia"), PAPUA_NEW_GUINEA("1302", "Papua New Guinea"), SOLOMON_ISLANDS("1303", "Solomon Islands"), VANUATU("1304", "Vanuatu"), GUAM(
            "1401", "Guam"), KIRIBATI("1402", "Kiribati"), MARSHALL_ISLANDS("1403", "Marshall Islands"), MICRONESIA_FEDERATED_STATES_OF("1404", "Micronesia, Federated States of"), NAURU(
            "1405", "Nauru"), NORTHERN_MARIANA_ISLANDS("1406", "Northern Mariana Islands"), PALAU("1407", "Palau"), COOK_ISLANDS("1501", "Cook Islands"), FIJI("1502", "Fiji"), FRENCH_POLYNESIA(
            "1503", "French Polynesia"), NIUE("1504", "Niue"), SAMOA("1505", "Samoa"), SAMOA_AMERICAN("1506", "Samoa, American"), TOKELAU("1507", "Tokelau"), TONGA("1508", "Tonga"), TUVALU(
            "1511", "Tuvalu"), WALLIS_AND_FUTUNA("1512", "Wallis and Futuna"), PITCAIRN_ISLANDS("1513", "Pitcairn Islands"), POLYNESIA_EXCLUDES_HAWAII_NEC("1599",
            "Polynesia (excludes Hawaii), nec"), ADELIE_LAND__FRANCE("1601", "Adélie Land (France)"), ARGENTINIAN_ANTARCTIC_TERRITORY("1602", "Argentinian Antarctic Territory"), AUSTRALIAN_ANTARCTIC_TERRITORY(
            "1603", "Australian Antarctic Territory"), BRITISH_ANTARCTIC_TERRITORY("1604", "British Antarctic Territory"), CHILEAN_ANTARCTIC_TERRITORY("1605", "Chilean Antarctic Territory"), QUEEN_MAUD_LAND__NORWAY(
            "1606", "Queen Maud Land (Norway)"), ROSS_DEPENDENCY_NEW_ZEALAND("1607", "Ross Dependency (New Zealand)"), ENGLAND("2102", "England"), ISLE_OF_MAN("2103", "Isle of Man"), NORTHERN_IRELAND(
            "2104", "Northern Ireland"), SCOTLAND("2105", "Scotland"), WALES("2106", "Wales"), GUERNSEY("2107", "Guernsey"), JERSEY("2108", "Jersey"), IRELAND("2201", "Ireland"), AUSTRIA(
            "2301", "Austria"), BELGIUM("2302", "Belgium"), FRANCE("2303", "France"), GERMANY("2304", "Germany"), LIECHTENSTEIN("2305", "Liechtenstein"), LUXEMBOURG("2306", "Luxembourg"), MONACO(
            "2307", "Monaco"), NETHERLANDS("2308", "Netherlands"), SWITZERLAND("2311", "Switzerland"), NORTHERN_EUROPE("24", "Northern Europe"), DENMARK("2401", "Denmark"), FAROE_ISLANDS(
            "2402", "Faroe Islands"), FINLAND("2403", "Finland"), GREENLAND("2404", "Greenland"), ICELAND("2405", "Iceland"), NORWAY("2406", "Norway"), SWEDEN("2407", "Sweden"), ALAND_ISLANDS(
            "2408", "Aland Islands"), ANDORRA("3101", "Andorra"), GIBRALTAR("3102", "Gibraltar"), HOLY_SEE("3103", "Holy See"), ITALY("3104", "Italy"), MALTA("3105", "Malta"), PORTUGAL(
            "3106", "Portugal"), SAN_MARINO("3107", "San Marino"), SPAIN("3108", "Spain"), SOUTH_EASTERN_EUROPE("32", "South Eastern Europe"), ALBANIA("3201", "Albania"), BOSNIA_AND_HERZEGOVINA(
            "3202", "Bosnia and Herzegovina"), BULGARIA("3203", "Bulgaria"), CROATIA("3204", "Croatia"), CYPRUS("3205", "Cyprus"), FORMER_YUGOSLAV_REPUBLIC_OF_MACEDONIA_FYROM("3206",
            "Former Yugoslav Republic of Macedonia (FYROM)"), GREECE("3207", "Greece"), MOLDOVA("3208", "Moldova"), ROMANIA("3211", "Romania"), SLOVENIA("3212", "Slovenia"), MONTENEGRO(
            "3214", "Montenegro"), SERBIA("3215", "Serbia"), KOSOVO("3216", "Kosovo"), BELARUS("3301", "Belarus"), CZECH_REPUBLIC("3302", "Czech Republic"), ESTONIA("3303", "Estonia"), HUNGARY(
            "3304", "Hungary"), LATVIA("3305", "Latvia"), LITHUANIA("3306", "Lithuania"), POLAND("3307", "Poland"), RUSSIAN_FEDERATION("3308", "Russian Federation"), SLOVAKIA("3311",
            "Slovakia"), UKRAINE("3312", "Ukraine"), NORTH_AFRICA("41", "North Africa"), ALGERIA("4101", "Algeria"), EGYPT("4102", "Egypt"), LIBYA("4103", "Libya"), MOROCCO("4104",
            "Morocco"), SUDAN("4105", "Sudan"), TUNISIA("4106", "Tunisia"), WESTERN_SAHARA("4107", "Western Sahara"), SPANISH_NORTH_AFRICA("4108", "Spanish North Africa"), BAHRAIN("4201",
            "Bahrain"), GAZA_STRIP_AND_WEST_BANK("4202", "Gaza Strip and West Bank"), IRAN("4203", "Iran"), IRAQ("4204", "Iraq"), ISRAEL("4205", "Israel"), JORDAN("4206", "Jordan"), KUWAIT(
            "4207", "Kuwait"), LEBANON("4208", "Lebanon"), OMAN("4211", "Oman"), QATAR("4212", "Qatar"), SAUDI_ARABIA("4213", "Saudi Arabia"), SYRIA("4214", "Syria"), TURKEY("4215",
            "Turkey"), UNITED_ARAB_EMIRATES("4216", "United Arab Emirates"), YEMEN("4217", "Yemen"), BURMA__MYANMAR("5101", "Burma (Myanmar)"), CAMBODIA("5102", "Cambodia"), LAOS("5103",
            "Laos"), THAILAND("5104", "Thailand"), VIETNAM("5105", "Vietnam"), BRUNEI_DARUSSALAM("5201", "Brunei Darussalam"), INDONESIA("5202", "Indonesia"), MALAYSIA("5203", "Malaysia"), PHILIPPINES(
            "5204", "Philippines"), SINGAPORE("5205", "Singapore"), EAST_TIMOR("5206", "East Timor"), CHINESE_ASIA_INCLUDES_MONGOLIA("61", "Chinese Asia (includes Mongolia)"), CHINA_EXCLUDES_SARS_AND_TAIWAN(
            "6101", "China (excludes SARs and Taiwan) "), HONG_KONG_SAR_OF_CHINA("6102", "Hong Kong (SAR of China)"), MACAU_SAR_OF_CHINA("6103", "Macau (SAR of China)"), MONGOLIA("6104",
            "Mongolia"), TAIWAN("6105", "Taiwan "), JAPAN("6201", "Japan"), KOREA_DEMOCRATIC_PEOPLES_REPUBLIC_OF_NORTH("6202", "Korea, Democratic People's Republic of (North)"), KOREA_REPUBLIC_OF_SOUTH(
            "6203", "Korea, Republic of (South)"), BANGLADESH("7101", "Bangladesh"), BHUTAN("7102", "Bhutan"), INDIA("7103", "India"), MALDIVES("7104", "Maldives"), NEPAL("7105", "Nepal"), PAKISTAN(
            "7106", "Pakistan"), SRI_LANKA("7107", "Sri Lanka"), AFGHANISTAN("7201", "Afghanistan"), ARMENIA("7202", "Armenia"), AZERBAIJAN("7203", "Azerbaijan"), GEORGIA("7204", "Georgia"), KAZAKHSTAN(
            "7205", "Kazakhstan"), KYRGYZSTAN("7206", "Kyrgyzstan"), TAJIKISTAN("7207", "Tajikistan"), TURKMENISTAN("7208", "Turkmenistan"), UZBEKISTAN("7211", "Uzbekistan"), BERMUDA(
            "8101", "Bermuda"), CANADA("8102", "Canada"), ST_PIERRE_AND_MIQUELON("8103", "St Pierre and Miquelon"), UNITED_STATES_OF_AMERICA("8104", "United States of America"), ARGENTINA(
            "8201", "Argentina"), BOLIVIA("8202", "Bolivia"), BRAZIL("8203", "Brazil"), CHILE("8204", "Chile"), COLOMBIA("8205", "Colombia"), ECUADOR("8206", "Ecuador"), FALKLAND_ISLANDS(
            "8207", "Falkland Islands"), FRENCH_GUIANA("8208", "French Guiana"), GUYANA("8211", "Guyana"), PARAGUAY("8212", "Paraguay"), PERU("8213", "Peru"), SURINAME("8214", "Suriname"), URUGUAY(
            "8215", "Uruguay"), VENEZUELA("8216", "Venezuela"), SOUTH_AMERICA_NEC("8299", "South America, nec"), BELIZE("8301", "Belize"), COSTA_RICA("8302", "Costa Rica"), EL_SALVADOR(
            "8303", "El Salvador"), GUATEMALA("8304", "Guatemala"), HONDURAS("8305", "Honduras"), MEXICO("8306", "Mexico"), NICARAGUA("8307", "Nicaragua"), PANAMA("8308", "Panama"), ANGUILLA(
            "8401", "Anguilla"), ANTIGUA_AND_BARBUDA("8402", "Antigua and Barbuda"), ARUBA("8403", "Aruba"), BAHAMAS("8404", "Bahamas"), BARBADOS("8405", "Barbados"), CAYMAN_ISLANDS("8406",
            "Cayman Islands"), CUBA("8407", "Cuba"), DOMINICA("8408", "Dominica"), DOMINICAN_REPUBLIC("8411", "Dominican Republic"), GRENADA("8412", "Grenada"), GUADELOUPE("8413",
            "Guadeloupe"), HAITI("8414", "Haiti"), JAMAICA("8415", "Jamaica"), MARTINIQUE("8416", "Martinique"), MONTSERRAT("8417", "Montserrat"), NETHERLANDS_ANTILLES("8418",
            "Netherlands Antilles"), PUERTO_RICO("8421", "Puerto Rico"), ST_KITTS_AND_NEVIS("8422", "St Kitts and Nevis"), ST_LUCIA("8423", "St Lucia"), ST_VINCENT_AND_THE_GRENADINES("8424",
            "St Vincent and the Grenadines"), TRINIDAD_AND_TOBAGO("8425", "Trinidad and Tobago"), TURKS_AND_CAICOS_ISLANDS("8426", "Turks and Caicos Islands"), VIRGIN_ISLANDS_BRITISH_("8427",
            "Virgin Islands, British "), VIRGIN_ISLANDS_UNITED_STATES("8428", "Virgin Islands, United States"), ST_BARTHELEMY("8431", "St Barthelemy"), ST_MARTIN_FRENCH_PART("8432",
            "St Martin (French part)"), BENIN("9101", "Benin"), BURKINA_FASO("9102", "Burkina Faso"), CAMEROON("9103", "Cameroon"), CAPE_VERDE("9104", "Cape Verde"), CENTRAL_AFRICAN_REPUBLIC(
            "9105", "Central African Republic"), CHAD("9106", "Chad"), CONGO("9107", "Congo"), CONGO_DEMOCRATIC_REPUBLIC_OF("9108", "Congo, Democratic Republic of"), COTE_D_IVOIRE("9111",
            "Côte d'Ivoire"), EQUATORIAL_GUINEA("9112", "Equatorial Guinea"), GABON("9113", "Gabon"), GAMBIA("9114", "Gambia"), GHANA("9115", "Ghana"), GUINEA("9116", "Guinea"), GUINEA_BISSAU(
            "9117", "Guinea-Bissau"), LIBERIA("9118", "Liberia"), MALI("9121", "Mali"), MAURITANIA("9122", "Mauritania"), NIGER("9123", "Niger"), NIGERIA("9124", "Nigeria"), SAO_TOME_AND_PRINCIPE(
            "9125", "Sao Tomé and Principe"), SENEGAL("9126", "Senegal"), SIERRA_LEONE("9127", "Sierra Leone"), TOGO("9128", "Togo"), ANGOLA("9201", "Angola"), BOTSWANA("9202", "Botswana"), BURUNDI(
            "9203", "Burundi"), COMOROS("9204", "Comoros"), DJIBOUTI("9205", "Djibouti"), ERITREA("9206", "Eritrea"), ETHIOPIA("9207", "Ethiopia"), KENYA("9208", "Kenya"), LESOTHO("9211",
            "Lesotho"), MADAGASCAR("9212", "Madagascar"), MALAWI("9213", "Malawi"), MAURITIUS("9214", "Mauritius"), MAYOTTE("9215", "Mayotte"), MOZAMBIQUE("9216", "Mozambique"), NAMIBIA(
            "9217", "Namibia"), REUNION("9218", "Réunion"), RWANDA("9221", "Rwanda"), ST_HELENA("9222", "St Helena"), SEYCHELLES("9223", "Seychelles"), SOMALIA("9224", "Somalia"), SOUTH_AFRICA(
            "9225", "South Africa"), SWAZILAND("9226", "Swaziland"), TANZANIA("9227", "Tanzania"), UGANDA("9228", "Uganda"), ZAMBIA("9231", "Zambia"), ZIMBABWE("9232", "Zimbabwe"), SOUTHERN_AND_EAST_AFRICA_NEC(
            "9299", "Southern and East Africa, nec");

    public final String OID = "1.2.36.1.2001.1001.101.104.16060";
    private final String code;
    private final String descriptor;

    CountryEnum(String code, String descriptor) {
        this.code = code;
        this.descriptor = descriptor;
    }

    public String getCode() {
        return code;
    }

    public String getDescriptor() {
        return descriptor;
    }
}
