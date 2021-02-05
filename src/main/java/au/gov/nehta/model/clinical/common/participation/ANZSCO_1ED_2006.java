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

import java.util.Collections;
import java.util.List;

import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.Coded;

public enum ANZSCO_1ED_2006 implements Coded {
    CHIEF_EXECUTIVE_OR_MANAGING_DIRECTOR("111111", "Chief Executive or Managing Director"), CORPORATE_GENERAL_MANAGER("111211", "Corporate General Manager"), DEFENCE_FORCE_SENIOR_OFFICER(
            "111212", "Defence Force Senior Officer"), LOCAL_GOVERNMENT_LEGISLATOR("111311", "Local Government Legislator"), MEMBER_OF_PARLIAMENT("111312", "Member of Parliament"), LEGISLATORS_NEC(
            "111399", "Legislators nec"), AQUACULTURE_FARMER("121111", "Aquaculture Farmer"), COTTON_GROWER("121211", "Cotton Grower"), FLOWER_GROWER("121212", "Flower Grower"), FRUIT_OR_NUT_GROWER(
            "121213", "Fruit or Nut Grower"), GRAIN_OILSEED_OR_PASTURE_GROWER("121214", "Grain, Oilseed or Pasture Grower"), GRAPE_GROWER("121215", "Grape Grower"), MIXED_CROP_FARMER("121216",
            "Mixed Crop Farmer"), SUGAR_CANE_GROWER("121217", "Sugar Cane Grower"), TURF_GROWER("121218", "Turf Grower"), VEGETABLE_GROWER("121221", "Vegetable Grower"), CROP_FARMERS_NEC(
            "121299", "Crop Farmers nec"), APIARIST("121311", "Apiarist"), BEEF_CATTLE_FARMER("121312", "Beef Cattle Farmer"), DAIRY_CATTLE_FARMER("121313", "Dairy Cattle Farmer"), DEER_FARMER(
            "121314", "Deer Farmer"), GOAT_FARMER("121315", "Goat Farmer"), HORSE_BREEDER("121316", "Horse Breeder"), MIXED_LIVESTOCK_FARMER("121317", "Mixed Livestock Farmer"), PIG_FARMER(
            "121318", "Pig Farmer"), POULTRY_FARMER("121321", "Poultry Farmer"), SHEEP_FARMER("121322", "Sheep Farmer"), LIVESTOCK_FARMERS_NEC("121399", "Livestock Farmers nec"), MIXED_CROP_AND_LIVESTOCK_FARMER(
            "121411", "Mixed Crop and Livestock Farmer"), SALES_AND_MARKETING_MANAGER("131112", "Sales and Marketing Manager"), ADVERTISING_MANAGER("131113", "Advertising Manager"), PUBLIC_RELATIONS_MANAGER(
            "131114", "Public Relations Manager"), CORPORATE_SERVICES_MANAGER("132111", "Corporate Services Manager"), FINANCE_MANAGER("132211", "Finance Manager"), HUMAN_RESOURCE_MANAGER(
            "132311", "Human Resource Manager"), POLICY_AND_PLANNING_MANAGER("132411", "Policy and Planning Manager"), RESEARCH_AND_DEVELOPMENT_MANAGER("132511",
            "Research and Development Manager"), CONSTRUCTION_PROJECT_MANAGER("133111", "Construction Project Manager"), PROJECT_BUILDER("133112", "Project Builder"), ENGINEERING_MANAGER(
            "133211", "Engineering Manager"), IMPORTER_OR_EXPORTER("133311", "Importer or Exporter"), WHOLESALER("133312", "Wholesaler"), MANUFACTURER("133411", "Manufacturer"), PRODUCTION_MANAGER_FORESTRY(
            "133511", "Production Manager (Forestry)"), PRODUCTION_MANAGER_MANUFACTURING("133512", "Production Manager (Manufacturing)"), PRODUCTION_MANAGER_MINING("133513",
            "Production Manager (Mining)"), SUPPLY_AND_DISTRIBUTION_MANAGER("133611", "Supply and Distribution Manager"), CHILD_CARE_CENTRE_MANAGER("134111", "Child Care Centre Manager"), MEDICAL_ADMINISTRATOR(
            "134211", "Medical Administrator"), NURSING_CLINICAL_DIRECTOR("134212", "Nursing Clinical Director"), PRIMARY_HEALTH_ORGANISATION_MANAGER("134213",
            "Primary Health Organisation Manager"), WELFARE_CENTRE_MANAGER("134214", "Welfare Centre Manager"), HEALTH_AND_WELFARE_SERVICES_MANAGERS_NEC("134299",
            "Health and Welfare Services Managers nec"), SCHOOL_PRINCIPAL("134311", "School Principal"), FACULTY_HEAD("134411", "Faculty Head"), REGIONAL_EDUCATION_MANAGER("134412",
            "Regional Education Manager"), EDUCATION_MANAGERS_NEC("134499", "Education Managers nec"), CHIEF_INFORMATION_OFFICER("135111", "Chief Information Officer"), ICT_PROJECT_MANAGER(
            "135112", "ICT Project Manager"), ICT_MANAGERS_NEC("135199", "ICT Managers nec"), COMMISSIONED_DEFENCE_FORCE_OFFICER("139111", "Commissioned Defence Force Officer"), COMMISSIONED_FIRE_OFFICER(
            "139112", "Commissioned Fire Officer"), COMMISSIONED_POLICE_OFFICER("139113", "Commissioned Police Officer"), SENIOR_NON_COMMISSIONED_DEFENCE_FORCE_MEMBER("139211",
            "Senior Non-commissioned Defence Force Member"), ARTS_ADMINISTRATOR_OR_MANAGER("139911", "Arts Administrator or Manager"), ENVIRONMENTAL_MANAGER("139912", "Environmental Manager"), LABORATORY_MANAGER(
            "139913", "Laboratory Manager"), QUALITY_ASSURANCE_MANAGER("139914", "Quality Assurance Manager"), SPORTS_ADMINISTRATOR("139915", "Sports Administrator"), SPECIALIST_MANAGERS_NEC(
            "139999", "Specialist Managers nec"), CAFE_OR_RESTAURANT_MANAGER("141111", "Cafe or Restaurant Manager"), CARAVAN_PARK_AND_CAMPING_GROUND_MANAGER("141211",
            "Caravan Park and Camping Ground Manager"), HOTEL_OR_MOTEL_MANAGER("141311", "Hotel or Motel Manager"), LICENSED_CLUB_MANAGER("141411", "Licensed Club Manager"), BED_AND_BREAKFAST_OPERATOR(
            "141911", "Bed and Breakfast Operator"), RETIREMENT_VILLAGE_MANAGER("141912", "Retirement Village Manager"), ACCOMMODATION_AND_HOSPITALITY_MANAGERS_NEC("141999",
            "Accommodation and Hospitality Managers nec"), RETAIL_MANAGER_GENERAL("142111", "Retail Manager (General)"), ANTIQUE_DEALER("142112", "Antique Dealer"), BETTING_AGENCY_MANAGER(
            "142113", "Betting Agency Manager"), HAIR_OR_BEAUTY_SALON_MANAGER("142114", "Hair or Beauty Salon Manager"), POST_OFFICE_MANAGER("142115", "Post Office Manager"), TRAVEL_AGENCY_MANAGER(
            "142116", "Travel Agency Manager"), AMUSEMENT_CENTRE_MANAGER("149111", "Amusement Centre Manager"), FITNESS_CENTRE_MANAGER("149112", "Fitness Centre Manager"), SPORTS_CENTRE_MANAGER(
            "149113", "Sports Centre Manager"), CALL_OR_CONTACT_CENTRE_MANAGER("149211", "Call or Contact Centre Manager"), CUSTOMER_SERVICE_MANAGER("149212", "Customer Service Manager"), CONFERENCE_AND_EVENT_ORGANISER(
            "149311", "Conference and Event Organiser"), FLEET_MANAGER("149411", "Fleet Manager"), RAILWAY_STATION_MANAGER("149412", "Railway Station Manager"), TRANSPORT_COMPANY_MANAGER(
            "149413", "Transport Company Manager"), BOARDING_KENNEL_OR_CATTERY_OPERATOR("149911", "Boarding Kennel or Cattery Operator"), CINEMA_OR_THEATRE_MANAGER("149912",
            "Cinema or Theatre Manager"), FACILITIES_MANAGER("149913", "Facilities Manager"), FINANCIAL_INSTITUTION_BRANCH_MANAGER("149914", "Financial Institution Branch Manager"), EQUIPMENT_HIRE_MANAGER(
            "149915", "Equipment Hire Manager"), HOSPITALITY_RETAIL_AND_SERVICE_MANAGERS_NEC("149999", "Hospitality, Retail and Service Managers nec"), ACTOR("211111", "Actor"), DANCER_OR_CHOREOGRAPHER(
            "211112", "Dancer or Choreographer"), ENTERTAINER_OR_VARIETY_ARTIST("211113", "Entertainer or Variety Artist"), ACTORS_DANCERS_AND_OTHER_ENTERTAINERS_NEC("211199",
            "Actors, Dancers and Other Entertainers nec"), COMPOSER("211211", "Composer"), MUSIC_DIRECTOR("211212", "Music Director"), MUSICIAN_INSTRUMENTAL("211213", "Musician (Instrumental)"), SINGER(
            "211214", "Singer"), MUSIC_PROFESSIONALS_NEC("211299", "Music Professionals nec"), PHOTOGRAPHER("211311", "Photographer"), PAINTER_VISUAL_ARTS("211411", "Painter (Visual Arts)"), POTTER_OR_CERAMIC_ARTIST(
            "211412", "Potter or Ceramic Artist"), SCULPTOR("211413", "Sculptor"), VISUAL_ARTS_AND_CRAFTS_PROFESSIONALS_NEC("211499", "Visual Arts and Crafts Professionals nec"), ARTISTIC_DIRECTOR(
            "212111", "Artistic Director"), MEDIA_PRODUCER_EXCLUDING_VIDEO("212112", "Media Producer (excluding Video)"), RADIO_PRESENTER("212113", "Radio Presenter"), TELEVISION_PRESENTER(
            "212114", "Television Presenter"), AUTHOR("212211", "Author"), BOOK_OR_SCRIPT_EDITOR("212212", "Book or Script Editor"), ART_DIRECTOR_FILM_TELEVISION_OR_STAGE("212311",
            "Art Director (Film, Television or Stage)"), DIRECTOR_FILM_TELEVISION_RADIO_OR_STAGE("212312", "Director (Film, Television, Radio or Stage)"), DIRECTOR_OF_PHOTOGRAPHY("212313",
            "Director of Photography"), FILM_AND_VIDEO_EDITOR("212314", "Film and Video Editor"), PROGRAM_DIRECTOR_TELEVISION_OR_RADIO("212315", "Program Director (Television or Radio)"), STAGE_MANAGER(
            "212316", "Stage Manager"), TECHNICAL_DIRECTOR("212317", "Technical Director"), VIDEO_PRODUCER("212318", "Video Producer"), FILM_TELEVISION_RADIO_AND_STAGE_DIRECTORS_NEC("212399",
            "Film, Television, Radio and Stage Directors nec"), COPYWRITER("212411", "Copywriter"), NEWSPAPER_OR_PERIODICAL_EDITOR("212412", "Newspaper or Periodical Editor"), PRINT_JOURNALIST(
            "212413", "Print Journalist"), RADIO_JOURNALIST("212414", "Radio Journalist"), TECHNICAL_WRITER("212415", "Technical Writer"), TELEVISION_JOURNALIST("212416",
            "Television Journalist"), JOURNALISTS_AND_OTHER_WRITERS_NEC("212499", "Journalists and Other Writers nec"), ACCOUNTANT_GENERAL("221111", "Accountant (General)"), MANAGEMENT_ACCOUNTANT(
            "221112", "Management Accountant"), TAXATION_ACCOUNTANT("221113", "Taxation Accountant"), COMPANY_SECRETARY("221211", "Company Secretary"), CORPORATE_TREASURER("221212",
            "Corporate Treasurer"), EXTERNAL_AUDITOR("221213", "External Auditor"), INTERNAL_AUDITOR("221214", "Internal Auditor"), COMMODITIES_TRADER("222111", "Commodities Trader"), FINANCE_BROKER(
            "222112", "Finance Broker"), INSURANCE_BROKER("222113", "Insurance Broker"), FINANCIAL_BROKERS_NEC("222199", "Financial Brokers nec"), FINANCIAL_MARKET_DEALER("222211",
            "Financial Market Dealer"), FUTURES_TRADER("222212", "Futures Trader"), STOCKBROKING_DEALER("222213", "Stockbroking Dealer"), FINANCIAL_DEALERS_NEC("222299", "Financial Dealers nec"), FINANCIAL_INVESTMENT_ADVISER(
            "222311", "Financial Investment Adviser"), FINANCIAL_INVESTMENT_MANAGER("222312", "Financial Investment Manager"), HUMAN_RESOURCE_ADVISER("223111", "Human Resource Adviser"), RECRUITMENT_CONSULTANT(
            "223112", "Recruitment Consultant"), WORKPLACE_RELATIONS_ADVISER("223113", "Workplace Relations Adviser"), ICT_TRAINER("223211", "ICT Trainer"), TRAINING_AND_DEVELOPMENT_PROFESSIONAL(
            "223311", "Training and Development Professional"), ACTUARY("224111", "Actuary"), MATHEMATICIAN("224112", "Mathematician"), STATISTICIAN("224113", "Statistician"), ARCHIVIST(
            "224211", "Archivist"), GALLERY_OR_MUSEUM_CURATOR("224212", "Gallery or Museum Curator"), HEALTH_INFORMATION_MANAGER("224213", "Health Information Manager"), RECORDS_MANAGER(
            "224214", "Records Manager"), ECONOMIST("224311", "Economist"), INTELLIGENCE_OFFICER("224411", "Intelligence Officer"), POLICY_ANALYST("224412", "Policy Analyst"), LAND_ECONOMIST(
            "224511", "Land Economist"), VALUER("224512", "Valuer"), LIBRARIAN("224611", "Librarian"), MANAGEMENT_CONSULTANT("224711", "Management Consultant"), ORGANISATION_AND_METHODS_ANALYST(
            "224712", "Organisation and Methods Analyst"), ELECTORATE_OFFICER("224911", "Electorate Officer"), LIAISON_OFFICER("224912", "Liaison Officer"), MIGRATION_AGENT("224913",
            "Migration Agent"), PATENTS_EXAMINER("224914", "Patents Examiner"), INFORMATION_AND_ORGANISATION_PROFESSIONALS_NEC("224999", "Information and Organisation Professionals nec"), ADVERTISING_SPECIALIST(
            "225111", "Advertising Specialist"), MARKET_RESEARCH_ANALYST("225112", "Market Research Analyst"), MARKETING_SPECIALIST("225113", "Marketing Specialist"), ICT_ACCOUNT_MANAGER(
            "225211", "ICT Account Manager"), ICT_BUSINESS_DEVELOPMENT_MANAGER("225212", "ICT Business Development Manager"), ICT_SALES_REPRESENTATIVE("225213", "ICT Sales Representative"), PUBLIC_RELATIONS_PROFESSIONAL(
            "225311", "Public Relations Professional"), SALES_REPRESENTATIVE_INDUSTRIAL_PRODUCTS("225411", "Sales Representative (Industrial Products)"), SALES_REPRESENTATIVE_MEDICAL_AND_PHARMACEUTICAL_PRODUCTS(
            "225412", "Sales Representative (Medical and Pharmaceutical Products)"), TECHNICAL_SALES_REPRESENTATIVES_NEC("225499", "Technical Sales Representatives nec"), AEROPLANE_PILOT(
            "231111", "Aeroplane Pilot"), AIR_TRAFFIC_CONTROLLER("231112", "Air Traffic Controller"), FLYING_INSTRUCTOR("231113", "Flying Instructor"), HELICOPTER_PILOT("231114",
            "Helicopter Pilot"), AIR_TRANSPORT_PROFESSIONALS_NEC("231199", "Air Transport Professionals nec"), MASTER_FISHER("231211", "Master Fisher"), SHIP_S_ENGINEER("231212",
            "Ship's Engineer"), SHIP_S_MASTER("231213", "Ship's Master"), SHIP_S_OFFICER("231214", "Ship's Officer"), SHIP_S_SURVEYOR("231215", "Ship's Surveyor"), MARINE_TRANSPORT_PROFESSIONALS_NEC(
            "231299", "Marine Transport Professionals nec"), ARCHITECT("232111", "Architect"), LANDSCAPE_ARCHITECT("232112", "Landscape Architect"), SURVEYOR("232212", "Surveyor"), CARTOGRAPHER(
            "232213", "Cartographer"), OTHER_SPATIAL_SCIENTIST("232214", "Other Spatial Scientist"), FASHION_DESIGNER("232311", "Fashion Designer"), INDUSTRIAL_DESIGNER("232312",
            "Industrial Designer"), JEWELLERY_DESIGNER("232313", "Jewellery Designer"), GRAPHIC_DESIGNER("232411", "Graphic Designer"), ILLUSTRATOR("232412", "Illustrator"), MULTIMEDIA_DESIGNER(
            "232413", "Multimedia Designer"), WEB_DESIGNER("232414", "Web Designer"), INTERIOR_DESIGNER("232511", "Interior Designer"), URBAN_AND_REGIONAL_PLANNER("232611",
            "Urban and Regional Planner"), CHEMICAL_ENGINEER("233111", "Chemical Engineer"), MATERIALS_ENGINEER("233112", "Materials Engineer"), CIVIL_ENGINEER("233211", "Civil Engineer"), GEOTECHNICAL_ENGINEER(
            "233212", "Geotechnical Engineer"), QUANTITY_SURVEYOR("233213", "Quantity Surveyor"), STRUCTURAL_ENGINEER("233214", "Structural Engineer"), TRANSPORT_ENGINEER("233215",
            "Transport Engineer"), ELECTRICAL_ENGINEER("233311", "Electrical Engineer"), ELECTRONICS_ENGINEER("233411", "Electronics Engineer"), INDUSTRIAL_ENGINEER("233511",
            "Industrial Engineer"), MECHANICAL_ENGINEER("233512", "Mechanical Engineer"), PRODUCTION_OR_PLANT_ENGINEER("233513", "Production or Plant Engineer"), MINING_ENGINEER_EXCLUDING_PETROLEUM(
            "233611", "Mining Engineer (excluding Petroleum)"), PETROLEUM_ENGINEER("233612", "Petroleum Engineer"), AERONAUTICAL_ENGINEER("233911", "Aeronautical Engineer"), AGRICULTURAL_ENGINEER(
            "233912", "Agricultural Engineer"), BIOMEDICAL_ENGINEER("233913", "Biomedical Engineer"), ENGINEERING_TECHNOLOGIST("233914", "Engineering Technologist"), ENVIRONMENTAL_ENGINEER(
            "233915", "Environmental Engineer"), NAVAL_ARCHITECT("233916", "Naval Architect"), ENGINEERING_PROFESSIONALS_NEC("233999", "Engineering Professionals nec"), AGRICULTURAL_CONSULTANT(
            "234111", "Agricultural Consultant"), AGRICULTURAL_SCIENTIST("234112", "Agricultural Scientist"), FORESTER("234113", "Forester"), CHEMIST("234211", "Chemist"), FOOD_TECHNOLOGIST(
            "234212", "Food Technologist"), WINE_MAKER("234213", "Wine Maker"), CONSERVATION_OFFICER("234311", "Conservation Officer"), ENVIRONMENTAL_CONSULTANT("234312",
            "Environmental Consultant"), ENVIRONMENTAL_RESEARCH_SCIENTIST("234313", "Environmental Research Scientist"), PARK_RANGER("234314", "Park Ranger"), ENVIRONMENTAL_SCIENTISTS_NEC(
            "234399", "Environmental Scientists nec"), GEOLOGIST("234411", "Geologist"), GEOPHYSICIST("234412", "Geophysicist"), LIFE_SCIENTIST_GENERAL("234511", "Life Scientist (General)"), ANATOMIST_OR_PHYSIOLOGIST(
            "234512", "Anatomist or Physiologist"), BIOCHEMIST("234513", "Biochemist"), BIOTECHNOLOGIST("234514", "Biotechnologist"), BOTANIST("234515", "Botanist"), MARINE_BIOLOGIST(
            "234516", "Marine Biologist"), MICROBIOLOGIST("234517", "Microbiologist"), ZOOLOGIST("234518", "Zoologist"), LIFE_SCIENTISTS_NEC("234599", "Life Scientists nec"), MEDICAL_LABORATORY_SCIENTIST(
            "234611", "Medical Laboratory Scientist"), VETERINARIAN("234711", "Veterinarian"), CONSERVATOR("234911", "Conservator"), METALLURGIST("234912", "Metallurgist"), METEOROLOGIST(
            "234913", "Meteorologist"), PHYSICIST("234914", "Physicist"), NATURAL_AND_PHYSICAL_SCIENCE_PROFESSIONALS_NEC("234999", "Natural and Physical Science Professionals nec"), EARLY_CHILDHOOD_PRE_PRIMARY_SCHOOL_TEACHER(
            "241111", "Early Childhood (Pre-primary School) Teacher"), PRIMARY_SCHOOL_TEACHER("241213", "Primary School Teacher"), MIDDLE_SCHOOL_TEACHER("241311", "Middle School Teacher"), SECONDARY_SCHOOL_TEACHER(
            "241411", "Secondary School Teacher"), SPECIAL_NEEDS_TEACHER("241511", "Special Needs Teacher"), TEACHER_OF_THE_HEARING_IMPAIRED("241512", "Teacher of the Hearing Impaired"), TEACHER_OF_THE_SIGHT_IMPAIRED(
            "241513", "Teacher of the Sight Impaired"), SPECIAL_EDUCATION_TEACHERS_NEC("241599", "Special Education Teachers nec"), UNIVERSITY_LECTURER("242111", "University Lecturer"), UNIVERSITY_TUTOR(
            "242112", "University Tutor"), VOCATIONAL_EDUCATION_TEACHER("242211", "Vocational Education Teacher"), EDUCATION_ADVISER("249111", "Education Adviser"), EDUCATION_REVIEWER("249112",
            "Education Reviewer"), ART_TEACHER_PRIVATE_TUITION("249211", "Art Teacher (Private Tuition)"), DANCE_TEACHER_PRIVATE_TUITION("249212", "Dance Teacher (Private Tuition)"), DRAMA_TEACHER_PRIVATE_TUITION(
            "249213", "Drama Teacher (Private Tuition)"), MUSIC_TEACHER_PRIVATE_TUITION("249214", "Music Teacher (Private Tuition)"), PRIVATE_TUTORS_AND_TEACHERS_NEC("249299",
            "Private Tutors and Teachers nec"), TEACHER_OF_ENGLISH_TO_SPEAKERS_OF_OTHER_LANGUAGES("249311", "Teacher of English to Speakers of Other Languages"), DIETITIAN("251111", "Dietitian"), MEDICAL_DIAGNOSTIC_RADIOGRAPHER(
            "251211", "Medical Diagnostic Radiographer"), MEDICAL_RADIATION_THERAPIST("251212", "Medical Radiation Therapist"), NUCLEAR_MEDICINE_TECHNOLOGIST("251213",
            "Nuclear Medicine Technologist"), SONOGRAPHER("251214", "Sonographer"), ENVIRONMENTAL_HEALTH_OFFICER("251311", "Environmental Health Officer"), OCCUPATIONAL_HEALTH_AND_SAFETY_ADVISER(
            "251312", "Occupational Health and Safety Adviser"), OPTOMETRIST("251411", "Optometrist"), ORTHOPTIST("251412", "Orthoptist"), HOSPITAL_PHARMACIST("251511", "Hospital Pharmacist"), INDUSTRIAL_PHARMACIST(
            "251512", "Industrial Pharmacist"), RETAIL_PHARMACIST("251513", "Retail Pharmacist"), HEALTH_PROMOTION_OFFICER("251911", "Health Promotion Officer"), ORTHOTIST_OR_PROSTHETIST(
            "251912", "Orthotist or Prosthetist"), HEALTH_DIAGNOSTIC_AND_PROMOTION_PROFESSIONALS_NEC("251999", "Health Diagnostic and Promotion Professionals nec"), CHIROPRACTOR("252111",
            "Chiropractor"), OSTEOPATH("252112", "Osteopath"), ACUPUNCTURIST("252211", "Acupuncturist"), HOMOEOPATH("252212", "Homoeopath"), NATUROPATH("252213", "Naturopath"), TRADITIONAL_CHINESE_MEDICINE_PRACTITIONER(
            "252214", "Traditional Chinese Medicine Practitioner"), COMPLEMENTARY_HEALTH_THERAPISTS_NEC("252299", "Complementary Health Therapists nec"), DENTAL_SPECIALIST("252311",
            "Dental Specialist"), DENTIST("252312", "Dentist"), OCCUPATIONAL_THERAPIST("252411", "Occupational Therapist"), PHYSIOTHERAPIST("252511", "Physiotherapist"), PODIATRIST("252611",
            "Podiatrist"), AUDIOLOGIST("252711", "Audiologist"), SPEECH_PATHOLOGIST("252712", "Speech Pathologist"), GENERAL_MEDICAL_PRACTITIONER("253111", "General Medical Practitioner"), RESIDENT_MEDICAL_OFFICER(
            "253112", "Resident Medical Officer"), ANAESTHETIST("253211", "Anaesthetist"), SPECIALIST_PHYSICIAN_GENERAL_MEDICINE("253311", "Specialist Physician (General Medicine)"), CARDIOLOGIST(
            "253312", "Cardiologist"), CLINICAL_HAEMATOLOGIST("253313", "Clinical Haematologist"), MEDICAL_ONCOLOGIST("253314", "Medical Oncologist"), ENDOCRINOLOGIST("253315",
            "Endocrinologist"), GASTROENTEROLOGIST("253316", "Gastroenterologist"), INTENSIVE_CARE_SPECIALIST("253317", "Intensive Care Specialist"), NEUROLOGIST("253318", "Neurologist"), PAEDIATRICIAN(
            "253321", "Paediatrician"), RENAL_MEDICINE_SPECIALIST("253322", "Renal Medicine Specialist"), RHEUMATOLOGIST("253323", "Rheumatologist"), THORACIC_MEDICINE_SPECIALIST("253324",
            "Thoracic Medicine Specialist"), SPECIALIST_PHYSICIANS_NEC("253399", "Specialist Physicians nec"), PSYCHIATRIST("253411", "Psychiatrist"), SURGEON_GENERAL("253511",
            "Surgeon (General)"), CARDIOTHORACIC_SURGEON("253512", "Cardiothoracic Surgeon"), NEUROSURGEON("253513", "Neurosurgeon"), ORTHOPAEDIC_SURGEON("253514", "Orthopaedic Surgeon"), OTORHINOLARYNGOLOGIST(
            "253515", "Otorhinolaryngologist"), PAEDIATRIC_SURGEON("253516", "Paediatric Surgeon"), PLASTIC_AND_RECONSTRUCTIVE_SURGEON("253517", "Plastic and Reconstructive Surgeon"), UROLOGIST(
            "253518", "Urologist"), VASCULAR_SURGEON("253521", "Vascular Surgeon"), DERMATOLOGIST("253911", "Dermatologist"), EMERGENCY_MEDICINE_SPECIALIST("253912",
            "Emergency Medicine Specialist"), OBSTETRICIAN_AND_GYNAECOLOGIST("253913", "Obstetrician and Gynaecologist"), OPHTHALMOLOGIST("253914", "Ophthalmologist"), PATHOLOGIST("253915",
            "Pathologist"), DIAGNOSTIC_AND_INTERVENTIONAL_RADIOLOGIST("253917", "Diagnostic and Interventional Radiologist"), RADIATION_ONCOLOGIST("253918", "Radiation Oncologist"), MEDICAL_PRACTITIONERS_NEC(
            "253999", "Medical Practitioners nec"), MIDWIFE("254111", "Midwife"), NURSE_EDUCATOR("254211", "Nurse Educator"), NURSE_RESEARCHER("254212", "Nurse Researcher"), NURSE_MANAGER(
            "254311", "Nurse Manager"), NURSE_PRACTITIONER("254411", "Nurse Practitioner"), REGISTERED_NURSE_AGED_CARE("254412", "Registered Nurse (Aged Care)"), REGISTERED_NURSE_CHILD_AND_FAMILY_HEALTH(
            "254413", "Registered Nurse (Child and Family Health)"), REGISTERED_NURSE_COMMUNITY_HEALTH("254414", "Registered Nurse (Community Health)"), REGISTERED_NURSE_CRITICAL_CARE_AND_EMERGENCY(
            "254415", "Registered Nurse (Critical Care and Emergency)"), REGISTERED_NURSE_DEVELOPMENTAL_DISABILITY("254416", "Registered Nurse (Developmental Disability)"), REGISTERED_NURSE_DISABILITY_AND_REHABILITATION(
            "254417", "Registered Nurse (Disability and Rehabilitation)"), REGISTERED_NURSE_MEDICAL("254418", "Registered Nurse (Medical)"), REGISTERED_NURSE_MEDICAL_PRACTICE("254421",
            "Registered Nurse (Medical Practice)"), REGISTERED_NURSE_MENTAL_HEALTH("254422", "Registered Nurse (Mental Health)"), REGISTERED_NURSE_PERIOPERATIVE("254423",
            "Registered Nurse (Perioperative)"), REGISTERED_NURSE_SURGICAL("254424", "Registered Nurse (Surgical)"), REGISTERED_NURSES_NEC("254499", "Registered Nurses nec"), ICT_BUSINESS_ANALYST(
            "261111", "ICT Business Analyst"), SYSTEMS_ANALYST("261112", "Systems Analyst"), MULTIMEDIA_SPECIALIST("261211", "Multimedia Specialist"), WEB_DEVELOPER("261212", "Web Developer"), ANALYST_PROGRAMMER(
            "261311", "Analyst Programmer"), DEVELOPER_PROGRAMMER("261312", "Developer Programmer"), SOFTWARE_ENGINEER("261313", "Software Engineer"), SOFTWARE_TESTER("261314",
            "Software Tester"), SOFTWARE_AND_APPLICATIONS_PROGRAMMERS_NEC("261399", "Software and Applications Programmers nec"), DATABASE_ADMINISTRATOR("262111", "Database Administrator"), ICT_SECURITY_SPECIALIST(
            "262112", "ICT Security Specialist"), SYSTEMS_ADMINISTRATOR("262113", "Systems Administrator"), COMPUTER_NETWORK_AND_SYSTEMS_ENGINEER("263111", "Computer Network and Systems Engineer"), NETWORK_ADMINISTRATOR(
            "263112", "Network Administrator"), NETWORK_ANALYST("263113", "Network Analyst"), ICT_QUALITY_ASSURANCE_ENGINEER("263211", "ICT Quality Assurance Engineer"), ICT_SUPPORT_ENGINEER(
            "263212", "ICT Support Engineer"), ICT_SYSTEMS_TEST_ENGINEER("263213", "ICT Systems Test Engineer"), ICT_SUPPORT_AND_TEST_ENGINEERS_NEC("263299", "ICT Support and Test Engineers nec"), TELECOMMUNICATIONS_ENGINEER(
            "263311", "Telecommunications Engineer"), TELECOMMUNICATIONS_NETWORK_ENGINEER("263312", "Telecommunications Network Engineer"), BARRISTER("271111", "Barrister"), JUDGE("271211",
            "Judge"), MAGISTRATE("271212", "Magistrate"), TRIBUNAL_MEMBER("271213", "Tribunal Member"), JUDICIAL_AND_OTHER_LEGAL_PROFESSIONALS_NEC("271299",
            "Judicial and Other Legal Professionals nec"), SOLICITOR("271311", "Solicitor"), CAREERS_COUNSELLOR("272111", "Careers Counsellor"), DRUG_AND_ALCOHOL_COUNSELLOR("272112",
            "Drug and Alcohol Counsellor"), FAMILY_AND_MARRIAGE_COUNSELLOR("272113", "Family and Marriage Counsellor"), REHABILITATION_COUNSELLOR("272114", "Rehabilitation Counsellor"), STUDENT_COUNSELLOR(
            "272115", "Student Counsellor"), COUNSELLORS_NEC("272199", "Counsellors nec"), MINISTER_OF_RELIGION("272211", "Minister of Religion"), CLINICAL_PSYCHOLOGIST("272311",
            "Clinical Psychologist"), EDUCATIONAL_PSYCHOLOGIST("272312", "Educational Psychologist"), ORGANISATIONAL_PSYCHOLOGIST("272313", "Organisational Psychologist"), PSYCHOTHERAPIST(
            "272314", "Psychotherapist"), PSYCHOLOGISTS_NEC("272399", "Psychologists nec"), HISTORIAN("272411", "Historian"), INTERPRETER("272412", "Interpreter"), TRANSLATOR("272413",
            "Translator"), SOCIAL_PROFESSIONALS_NEC("272499", "Social Professionals nec"), SOCIAL_WORKER("272511", "Social Worker"), COMMUNITY_ARTS_WORKER("272611", "Community Arts Worker"), RECREATION_OFFICER(
            "272612", "Recreation Officer"), WELFARE_WORKER("272613", "Welfare Worker"), AGRICULTURAL_TECHNICIAN("311111", "Agricultural Technician"), ANAESTHETIC_TECHNICIAN("311211",
            "Anaesthetic Technician"), CARDIAC_TECHNICIAN("311212", "Cardiac Technician"), MEDICAL_LABORATORY_TECHNICIAN("311213", "Medical Laboratory Technician"), OPERATING_THEATRE_TECHNICIAN(
            "311214", "Operating Theatre Technician"), PHARMACY_TECHNICIAN("311215", "Pharmacy Technician"), PATHOLOGY_COLLECTOR("311216", "Pathology Collector"), MEDICAL_TECHNICIANS_NEC(
            "311299", "Medical Technicians nec"), FISHERIES_OFFICER("311311", "Fisheries Officer"), MEAT_INSPECTOR("311312", "Meat Inspector"), QUARANTINE_OFFICER("311313", "Quarantine Officer"), PRIMARY_PRODUCTS_INSPECTORS_NEC(
            "311399", "Primary Products Inspectors nec"), CHEMISTRY_TECHNICIAN("311411", "Chemistry Technician"), EARTH_SCIENCE_TECHNICIAN("311412", "Earth Science Technician"), LIFE_SCIENCE_TECHNICIAN(
            "311413", "Life Science Technician"), SCHOOL_LABORATORY_TECHNICIAN("311414", "School Laboratory Technician"), SCIENCE_TECHNICIANS_NEC("311499", "Science Technicians nec"), ARCHITECTURAL_DRAFTSPERSON(
            "312111", "Architectural Draftsperson"), BUILDING_ASSOCIATE("312112", "Building Associate"), BUILDING_INSPECTOR("312113", "Building Inspector"), CONSTRUCTION_ESTIMATOR("312114",
            "Construction Estimator"), PLUMBING_INSPECTOR("312115", "Plumbing Inspector"), SURVEYING_OR_SPATIAL_SCIENCE_TECHNICIAN("312116", "Surveying or Spatial Science Technician"), ARCHITECTURAL_BUILDING_AND_SURVEYING_TECHNICIANS_NEC(
            "312199", "Architectural, Building and Surveying Technicians nec"), CIVIL_ENGINEERING_DRAFTSPERSON("312211", "Civil Engineering Draftsperson"), CIVIL_ENGINEERING_TECHNICIAN("312212",
            "Civil Engineering Technician"), ELECTRICAL_ENGINEERING_DRAFTSPERSON("312311", "Electrical Engineering Draftsperson"), ELECTRICAL_ENGINEERING_TECHNICIAN("312312",
            "Electrical Engineering Technician"), ELECTRONIC_ENGINEERING_DRAFTSPERSON("312411", "Electronic Engineering Draftsperson"), ELECTRONIC_ENGINEERING_TECHNICIAN("312412",
            "Electronic Engineering Technician"), MECHANICAL_ENGINEERING_DRAFTSPERSON("312511", "Mechanical Engineering Draftsperson"), MECHANICAL_ENGINEERING_TECHNICIAN("312512",
            "Mechanical Engineering Technician"), SAFETY_INSPECTOR("312611", "Safety Inspector"), MAINTENANCE_PLANNER("312911", "Maintenance Planner"), METALLURGICAL_OR_MATERIALS_TECHNICIAN(
            "312912", "Metallurgical or Materials Technician"), MINE_DEPUTY("312913", "Mine Deputy"), BUILDING_AND_ENGINEERING_TECHNICIANS_NEC("312999", "Building and Engineering Technicians nec"), HARDWARE_TECHNICIAN(
            "313111", "Hardware Technician"), ICT_CUSTOMER_SUPPORT_OFFICER("313112", "ICT Customer Support Officer"), WEB_ADMINISTRATOR("313113", "Web Administrator"), ICT_SUPPORT_TECHNICIANS_NEC(
            "313199", "ICT Support Technicians nec"), RADIOCOMMUNICATIONS_TECHNICIAN("313211", "Radiocommunications Technician"), TELECOMMUNICATIONS_FIELD_ENGINEER("313212",
            "Telecommunications Field Engineer"), TELECOMMUNICATIONS_NETWORK_PLANNER("313213", "Telecommunications Network Planner"), TELECOMMUNICATIONS_TECHNICAL_OFFICER_OR_TECHNOLOGIST(
            "313214", "Telecommunications Technical Officer or Technologist"), AUTOMOTIVE_ELECTRICIAN("321111", "Automotive Electrician"), MOTOR_MECHANIC_GENERAL("321211",
            "Motor Mechanic (General)"), DIESEL_MOTOR_MECHANIC("321212", "Diesel Motor Mechanic"), MOTORCYCLE_MECHANIC("321213", "Motorcycle Mechanic"), SMALL_ENGINE_MECHANIC("321214",
            "Small Engine Mechanic"), BLACKSMITH("322111", "Blacksmith"), ELECTROPLATER("322112", "Electroplater"), FARRIER("322113", "Farrier"), METAL_CASTING_TRADES_WORKER("322114",
            "Metal Casting Trades Worker"), METAL_POLISHER("322115", "Metal Polisher"), SHEETMETAL_TRADES_WORKER("322211", "Sheetmetal Trades Worker"), METAL_FABRICATOR("322311",
            "Metal Fabricator"), PRESSURE_WELDER("322312", "Pressure Welder"), WELDER_FIRST_CLASS("322313", "Welder (First Class)"), AIRCRAFT_MAINTENANCE_ENGINEER_AVIONICS("323111",
            "Aircraft Maintenance Engineer (Avionics)"), AIRCRAFT_MAINTENANCE_ENGINEER_MECHANICAL("323112", "Aircraft Maintenance Engineer (Mechanical)"), AIRCRAFT_MAINTENANCE_ENGINEER_STRUCTURES(
            "323113", "Aircraft Maintenance Engineer (Structures)"), FITTER_GENERAL("323211", "Fitter (General)"), FITTER_AND_TURNER("323212", "Fitter and Turner"), FITTER_WELDER("323213",
            "Fitter-Welder"), METAL_MACHINIST_FIRST_CLASS("323214", "Metal Machinist (First Class)"), TEXTILE_CLOTHING_AND_FOOTWEAR_MECHANIC("323215", "Textile, Clothing and Footwear Mechanic"), METAL_FITTERS_AND_MACHINISTS_NEC(
            "323299", "Metal Fitters and Machinists nec"), ENGRAVER("323311", "Engraver"), GUNSMITH("323312", "Gunsmith"), LOCKSMITH("323313", "Locksmith"), PRECISION_INSTRUMENT_MAKER_AND_REPAIRER(
            "323314", "Precision Instrument Maker and Repairer"), SAW_MAKER_AND_REPAIRER("323315", "Saw Maker and Repairer"), WATCH_AND_CLOCK_MAKER_AND_REPAIRER("323316",
            "Watch and Clock Maker and Repairer"), ENGINEERING_PATTERNMAKER("323411", "Engineering Patternmaker"), TOOLMAKER("323412", "Toolmaker"), PANELBEATER("324111", "Panelbeater"), VEHICLE_BODY_BUILDER(
            "324211", "Vehicle Body Builder"), VEHICLE_TRIMMER("324212", "Vehicle Trimmer"), VEHICLE_PAINTER("324311", "Vehicle Painter"), BRICKLAYER("331111", "Bricklayer"), STONEMASON(
            "331112", "Stonemason"), CARPENTER_AND_JOINER("331211", "Carpenter and Joiner"), CARPENTER("331212", "Carpenter"), JOINER("331213", "Joiner"), FLOOR_FINISHER("332111",
            "Floor Finisher"), PAINTING_TRADES_WORKER("332211", "Painting Trades Worker"), GLAZIER("333111", "Glazier"), FIBROUS_PLASTERER("333211", "Fibrous Plasterer"), SOLID_PLASTERER(
            "333212", "Solid Plasterer"), ROOF_TILER("333311", "Roof Tiler"), WALL_AND_FLOOR_TILER("333411", "Wall and Floor Tiler"), PLUMBER_GENERAL("334111", "Plumber (General)"), AIRCONDITIONING_AND_MECHANICAL_SERVICES_PLUMBER(
            "334112", "Airconditioning and Mechanical Services Plumber"), DRAINER("334113", "Drainer"), GASFITTER("334114", "Gasfitter"), ROOF_PLUMBER("334115", "Roof Plumber"), ELECTRICIAN_GENERAL(
            "341111", "Electrician (General)"), ELECTRICIAN_SPECIAL_CLASS("341112", "Electrician (Special Class)"), LIFT_MECHANIC("341113", "Lift Mechanic"), AIRCONDITIONING_AND_REFRIGERATION_MECHANIC(
            "342111", "Airconditioning and Refrigeration Mechanic"), ELECTRICAL_LINESWORKER("342211", "Electrical Linesworker"), TECHNICAL_CABLE_JOINTER("342212", "Technical Cable Jointer"), BUSINESS_MACHINE_MECHANIC(
            "342311", "Business Machine Mechanic"), COMMUNICATIONS_OPERATOR("342312", "Communications Operator"), ELECTRONIC_EQUIPMENT_TRADES_WORKER("342313", "Electronic Equipment Trades Worker"), ELECTRONIC_INSTRUMENT_TRADES_WORKER_GENERAL(
            "342314", "Electronic Instrument Trades Worker (General)"), ELECTRONIC_INSTRUMENT_TRADES_WORKER_SPECIAL_CLASS("342315", "Electronic Instrument Trades Worker (Special Class)"), CABLER_DATA_AND_TELECOMMUNICATIONS(
            "342411", "Cabler (Data and Telecommunications)"), TELECOMMUNICATIONS_CABLE_JOINTER("342412", "Telecommunications Cable Jointer"), TELECOMMUNICATIONS_LINESWORKER("342413",
            "Telecommunications Linesworker"), TELECOMMUNICATIONS_TECHNICIAN("342414", "Telecommunications Technician"), BAKER("351111", "Baker"), PASTRYCOOK("351112", "Pastrycook"), BUTCHER_OR_SMALLGOODS_MAKER(
            "351211", "Butcher or Smallgoods Maker"), CHEF("351311", "Chef"), COOK("351411", "Cook"), DOG_HANDLER_OR_TRAINER("361111", "Dog Handler or Trainer"), HORSE_TRAINER("361112",
            "Horse Trainer"), PET_GROOMER("361113", "Pet Groomer"), ZOOKEEPER("361114", "Zookeeper"), ANIMAL_ATTENDANTS_AND_TRAINERS_NEC("361199", "Animal Attendants and Trainers nec"), SHEARER(
            "361211", "Shearer"), VETERINARY_NURSE("361311", "Veterinary Nurse"), FLORIST("362111", "Florist"), GARDENER_GENERAL("362211", "Gardener (General)"), ARBORIST("362212", "Arborist"), LANDSCAPE_GARDENER(
            "362213", "Landscape Gardener"), GREENKEEPER("362311", "Greenkeeper"), NURSERYPERSON("362411", "Nurseryperson"), HAIRDRESSER("391111", "Hairdresser"), PRINT_FINISHER("392111",
            "Print Finisher"), SCREEN_PRINTER("392112", "Screen Printer"), GRAPHIC_PRE_PRESS_TRADES_WORKER("392211", "Graphic Pre-press Trades Worker"), PRINTING_MACHINIST("392311",
            "Printing Machinist"), SMALL_OFFSET_PRINTER("392312", "Small Offset Printer"), CANVAS_GOODS_FABRICATOR("393111", "Canvas Goods Fabricator"), LEATHER_GOODS_MAKER("393112",
            "Leather Goods Maker"), SAIL_MAKER("393113", "Sail Maker"), SHOEMAKER("393114", "Shoemaker"), APPAREL_CUTTER("393211", "Apparel Cutter"), CLOTHING_PATTERNMAKER("393212",
            "Clothing Patternmaker"), DRESSMAKER_OR_TAILOR("393213", "Dressmaker or Tailor"), CLOTHING_TRADES_WORKERS_NEC("393299", "Clothing Trades Workers nec"), UPHOLSTERER("393311",
            "Upholsterer"), CABINETMAKER("394111", "Cabinetmaker"), FURNITURE_FINISHER("394211", "Furniture Finisher"), PICTURE_FRAMER("394212", "Picture Framer"), WOOD_MACHINIST("394213",
            "Wood Machinist"), WOOD_TURNER("394214", "Wood Turner"), WOOD_MACHINISTS_AND_OTHER_WOOD_TRADES_WORKERS_NEC("394299", "Wood Machinists and Other Wood Trades Workers nec"), BOAT_BUILDER_AND_REPAIRER(
            "399111", "Boat Builder and Repairer"), SHIPWRIGHT("399112", "Shipwright"), CHEMICAL_PLANT_OPERATOR("399211", "Chemical Plant Operator"), GAS_OR_PETROLEUM_OPERATOR("399212",
            "Gas or Petroleum Operator"), POWER_GENERATION_PLANT_OPERATOR("399213", "Power Generation Plant Operator"), GALLERY_OR_MUSEUM_TECHNICIAN("399311", "Gallery or Museum Technician"), LIBRARY_TECHNICIAN(
            "399312", "Library Technician"), JEWELLER("399411", "Jeweller"), BROADCAST_TRANSMITTER_OPERATOR("399511", "Broadcast Transmitter Operator"), CAMERA_OPERATOR_FILM_TELEVISION_OR_VIDEO(
            "399512", "Camera Operator (Film, Television or Video)"), LIGHT_TECHNICIAN("399513", "Light Technician"), MAKE_UP_ARTIST("399514", "Make Up Artist"), MUSICAL_INSTRUMENT_MAKER_OR_REPAIRER(
            "399515", "Musical Instrument Maker or Repairer"), SOUND_TECHNICIAN("399516", "Sound Technician"), TELEVISION_EQUIPMENT_OPERATOR("399517", "Television Equipment Operator"), PERFORMING_ARTS_TECHNICIANS_NEC(
            "399599", "Performing Arts Technicians nec"), SIGNWRITER("399611", "Signwriter"), DIVER("399911", "Diver"), INTERIOR_DECORATOR("399912", "Interior Decorator"), OPTICAL_DISPENSER(
            "399913", "Optical Dispenser"), OPTICAL_MECHANIC("399914", "Optical Mechanic"), PHOTOGRAPHER_S_ASSISTANT("399915", "Photographer's Assistant"), PLASTICS_TECHNICIAN("399916",
            "Plastics Technician"), WOOL_CLASSER("399917", "Wool Classer"), FIRE_PROTECTION_EQUIPMENT_TECHNICIAN("399918", "Fire Protection Equipment Technician"), TECHNICIANS_AND_TRADES_WORKERS_NEC(
            "399999", "Technicians and Trades Workers nec"), AMBULANCE_OFFICER("411111", "Ambulance Officer"), INTENSIVE_CARE_AMBULANCE_PARAMEDIC("411112", "Intensive Care Ambulance Paramedic"), DENTAL_HYGIENIST(
            "411211", "Dental Hygienist"), DENTAL_PROSTHETIST("411212", "Dental Prosthetist"), DENTAL_TECHNICIAN("411213", "Dental Technician"), DENTAL_THERAPIST("411214", "Dental Therapist"), DIVERSIONAL_THERAPIST(
            "411311", "Diversional Therapist"), ENROLLED_NURSE("411411", "Enrolled Nurse"), MOTHERCRAFT_NURSE("411412", "Mothercraft Nurse"), ABORIGINAL_AND_TORRES_STRAIT_ISLANDER_HEALTH_WORKER(
            "411511", "Aboriginal and Torres Strait Islander Health Worker"), MASSAGE_THERAPIST("411611", "Massage Therapist"), COMMUNITY_WORKER("411711", "Community Worker"), DISABILITIES_SERVICES_OFFICER(
            "411712", "Disabilities Services Officer"), FAMILY_SUPPORT_WORKER("411713", "Family Support Worker"), PAROLE_OR_PROBATION_OFFICER("411714", "Parole or Probation Officer"), RESIDENTIAL_CARE_OFFICER(
            "411715", "Residential Care Officer"), YOUTH_WORKER("411716", "Youth Worker"), CHILD_CARE_WORKER("421111", "Child Care Worker"), FAMILY_DAY_CARE_WORKER("421112",
            "Family Day Care Worker"), NANNY("421113", "Nanny"), OUT_OF_SCHOOL_HOURS_CARE_WORKER("421114", "Out of School Hours Care Worker"), ABORIGINAL_AND_TORRES_STRAIT_ISLANDER_EDUCATION_WORKER(
            "422111", "Aboriginal and Torres Strait Islander Education Worker"), INTEGRATION_AIDE("422112", "Integration Aide"), PRESCHOOL_AIDE("422115", "Preschool Aide"), TEACHERS_AIDE(
            "422116", "Teachers' Aide"), AGED_OR_DISABLED_CARER("423111", "Aged or Disabled Carer"), DENTAL_ASSISTANT("423211", "Dental Assistant"), HOSPITAL_ORDERLY("423311",
            "Hospital Orderly"), NURSING_SUPPORT_WORKER("423312", "Nursing Support Worker"), PERSONAL_CARE_ASSISTANT("423313", "Personal Care Assistant"), THERAPY_AIDE("423314", "Therapy Aide"), CHILD_OR_YOUTH_RESIDENTIAL_CARE_ASSISTANT(
            "423411", "Child or Youth Residential Care Assistant"), HOSTEL_PARENT("423412", "Hostel Parent"), REFUGE_WORKER("423413", "Refuge Worker"), BAR_ATTENDANT("431111", "Bar Attendant"), BARISTA(
            "431112", "Barista"), CAFE_WORKER("431211", "Cafe Worker"), GAMING_WORKER("431311", "Gaming Worker"), HOTEL_SERVICE_MANAGER("431411", "Hotel Service Manager"), WAITER("431511",
            "Waiter"), BAR_USEFUL_OR_BUSSER("431911", "Bar Useful or Busser"), DOORPERSON_OR_LUGGAGE_PORTER("431912", "Doorperson or Luggage Porter"), HOSPITALITY_WORKERS_NEC("431999",
            "Hospitality Workers nec"), DEFENCE_FORCE_MEMBER_OTHER_RANKS("441111", "Defence Force Member - Other Ranks"), EMERGENCY_SERVICE_WORKER("441211", "Emergency Service Worker"), FIRE_FIGHTER(
            "441212", "Fire Fighter"), DETECTIVE("441311", "Detective"), POLICE_OFFICER("441312", "Police Officer"), PRISON_OFFICER("442111", "Prison Officer"), ALARM_SECURITY_OR_SURVEILLANCE_MONITOR(
            "442211", "Alarm, Security or Surveillance Monitor"), ARMOURED_CAR_ESCORT("442212", "Armoured Car Escort"), CROWD_CONTROLLER("442213", "Crowd Controller"), PRIVATE_INVESTIGATOR(
            "442214", "Private Investigator"), RETAIL_LOSS_PREVENTION_OFFICER("442215", "Retail Loss Prevention Officer"), SECURITY_CONSULTANT("442216", "Security Consultant"), SECURITY_OFFICER(
            "442217", "Security Officer"), SECURITY_OFFICERS_AND_GUARDS_NEC("442299", "Security Officers and Guards nec"), BEAUTY_THERAPIST("451111", "Beauty Therapist"), DRIVING_INSTRUCTOR(
            "451211", "Driving Instructor"), FUNERAL_DIRECTOR("451311", "Funeral Director"), FUNERAL_WORKERS_NEC("451399", "Funeral Workers nec"), GALLERY_OR_MUSEUM_GUIDE("451411",
            "Gallery or Museum Guide"), TOUR_GUIDE("451412", "Tour Guide"), NATURAL_REMEDY_CONSULTANT("451511", "Natural Remedy Consultant"), WEIGHT_LOSS_CONSULTANT("451512",
            "Weight Loss Consultant"), TOURIST_INFORMATION_OFFICER("451611", "Tourist Information Officer"), TRAVEL_CONSULTANT("451612", "Travel Consultant"), FLIGHT_ATTENDANT("451711",
            "Flight Attendant"), TRAVEL_ATTENDANTS_NEC("451799", "Travel Attendants nec"), CIVIL_CELEBRANT("451811", "Civil Celebrant"), HAIR_OR_BEAUTY_SALON_ASSISTANT("451812",
            "Hair or Beauty Salon Assistant"), SEX_WORKER_OR_ESCORT("451813", "Sex Worker or Escort"), BODY_ARTIST("451814", "Body Artist"), FIRST_AID_TRAINER("451815", "First Aid Trainer"), RELIGIOUS_ASSISTANT(
            "451816", "Religious Assistant"), PERSONAL_SERVICE_WORKERS_NEC("451899", "Personal Service Workers nec"), FITNESS_INSTRUCTOR("452111", "Fitness Instructor"), BUNGY_JUMP_MASTER(
            "452211", "Bungy Jump Master"), FISHING_GUIDE("452212", "Fishing Guide"), HUNTING_GUIDE("452213", "Hunting Guide"), MOUNTAIN_OR_GLACIER_GUIDE("452214", "Mountain or Glacier Guide"), OUTDOOR_ADVENTURE_INSTRUCTOR(
            "452215", "Outdoor Adventure Instructor"), TREKKING_GUIDE("452216", "Trekking Guide"), WHITEWATER_RAFTING_GUIDE("452217", "Whitewater Rafting Guide"), OUTDOOR_ADVENTURE_GUIDES_NEC(
            "452299", "Outdoor Adventure Guides nec"), DIVING_INSTRUCTOR_OPEN_WATER("452311", "Diving Instructor (Open Water)"), GYMNASTICS_COACH_OR_INSTRUCTOR("452312",
            "Gymnastics Coach or Instructor"), HORSE_RIDING_COACH_OR_INSTRUCTOR("452313", "Horse Riding Coach or Instructor"), SNOWSPORT_INSTRUCTOR("452314", "Snowsport Instructor"), SWIMMING_COACH_OR_INSTRUCTOR(
            "452315", "Swimming Coach or Instructor"), TENNIS_COACH("452316", "Tennis Coach"), OTHER_SPORTS_COACH_OR_INSTRUCTOR("452317", "Other Sports Coach or Instructor"), DOG_OR_HORSE_RACING_OFFICIAL(
            "452318", "Dog or Horse Racing Official"), SPORTS_DEVELOPMENT_OFFICER("452321", "Sports Development Officer"), SPORTS_UMPIRE("452322", "Sports Umpire"), OTHER_SPORTS_OFFICIAL(
            "452323", "Other Sports Official"), FOOTBALLER("452411", "Footballer"), GOLFER("452412", "Golfer"), JOCKEY("452413", "Jockey"), LIFEGUARD("452414", "Lifeguard"), SPORTSPERSONS_NEC(
            "452499", "Sportspersons nec"), CONTRACT_ADMINISTRATOR("511111", "Contract Administrator"), PROGRAM_OR_PROJECT_ADMINISTRATOR("511112", "Program or Project Administrator"), OFFICE_MANAGER(
            "512111", "Office Manager"), HEALTH_PRACTICE_MANAGER("512211", "Health Practice Manager"), PRACTICE_MANAGERS_NEC("512299", "Practice Managers nec"), PERSONAL_ASSISTANT("521111",
            "Personal Assistant"), SECRETARY_GENERAL("521211", "Secretary (General)"), LEGAL_SECRETARY("521212", "Legal Secretary"), GENERAL_CLERK("531111", "General Clerk"), DATA_ENTRY_OPERATOR(
            "532111", "Data Entry Operator"), MACHINE_SHORTHAND_REPORTER("532112", "Machine Shorthand Reporter"), WORD_PROCESSING_OPERATOR("532113", "Word Processing Operator"), CALL_OR_CONTACT_CENTRE_TEAM_LEADER(
            "541111", "Call or Contact Centre Team Leader"), CALL_OR_CONTACT_CENTRE_OPERATOR("541112", "Call or Contact Centre Operator"), INQUIRY_CLERK("541211", "Inquiry Clerk"), RECEPTIONIST_GENERAL(
            "542111", "Receptionist (General)"), ADMISSIONS_CLERK("542112", "Admissions Clerk"), HOTEL_OR_MOTEL_RECEPTIONIST("542113", "Hotel or Motel Receptionist"), MEDICAL_RECEPTIONIST(
            "542114", "Medical Receptionist"), ACCOUNTS_CLERK("551111", "Accounts Clerk"), COST_CLERK("551112", "Cost Clerk"), BOOKKEEPER("551211", "Bookkeeper"), PAYROLL_CLERK("551311",
            "Payroll Clerk"), BANK_WORKER("552111", "Bank Worker"), CREDIT_OR_LOANS_OFFICER("552211", "Credit or Loans Officer"), BOOKMAKER("552311", "Bookmaker"), INSURANCE_CONSULTANT(
            "552312", "Insurance Consultant"), MONEY_MARKET_CLERK("552313", "Money Market Clerk"), STATISTICAL_CLERK("552314", "Statistical Clerk"), BETTING_AGENCY_COUNTER_CLERK("561111",
            "Betting Agency Counter Clerk"), BOOKMAKER_S_CLERK("561112", "Bookmaker's Clerk"), TELEPHONE_BETTING_CLERK("561113", "Telephone Betting Clerk"), BETTING_CLERKS_NEC("561199",
            "Betting Clerks nec"), COURIER("561211", "Courier"), POSTAL_DELIVERY_OFFICER("561212", "Postal Delivery Officer"), FILING_OR_REGISTRY_CLERK("561311", "Filing or Registry Clerk"), MAIL_CLERK(
            "561411", "Mail Clerk"), POSTAL_SORTING_OFFICER("561412", "Postal Sorting Officer"), SURVEY_INTERVIEWER("561511", "Survey Interviewer"), SWITCHBOARD_OPERATOR("561611",
            "Switchboard Operator"), CLASSIFIED_ADVERTISING_CLERK("561911", "Classified Advertising Clerk"), METER_READER("561912", "Meter Reader"), PARKING_INSPECTOR("561913",
            "Parking Inspector"), CLERICAL_AND_OFFICE_SUPPORT_WORKERS_NEC("561999", "Clerical and Office Support Workers nec"), PRODUCTION_CLERK("591112", "Production Clerk"), PURCHASING_OFFICER(
            "591113", "Purchasing Officer"), STOCK_CLERK("591115", "Stock Clerk"), WAREHOUSE_ADMINISTRATOR("591116", "Warehouse Administrator"), ORDER_CLERK("591117", "Order Clerk"), DESPATCHING_AND_RECEIVING_CLERK(
            "591211", "Despatching and Receiving Clerk"), IMPORT_EXPORT_CLERK("591212", "Import-Export Clerk"), CONVEYANCER("599111", "Conveyancer"), LEGAL_EXECUTIVE("599112", "Legal Executive"), CLERK_OF_COURT(
            "599211", "Clerk of Court"), COURT_BAILIFF_OR_SHERIFF("599212", "Court Bailiff or Sheriff"), COURT_ORDERLY("599213", "Court Orderly"), LAW_CLERK("599214", "Law Clerk"), TRUST_OFFICER(
            "599215", "Trust Officer"), DEBT_COLLECTOR("599311", "Debt Collector"), HUMAN_RESOURCE_CLERK("599411", "Human Resource Clerk"), CUSTOMS_OFFICER("599511", "Customs Officer"), IMMIGRATION_OFFICER(
            "599512", "Immigration Officer"), MOTOR_VEHICLE_LICENCE_EXAMINER("599513", "Motor Vehicle Licence Examiner"), NOXIOUS_WEEDS_AND_PEST_INSPECTOR("599514",
            "Noxious Weeds and Pest Inspector"), SOCIAL_SECURITY_ASSESSOR("599515", "Social Security Assessor"), TAXATION_INSPECTOR("599516", "Taxation Inspector"), TRAIN_EXAMINER("599517",
            "Train Examiner"), TRANSPORT_OPERATIONS_INSPECTOR("599518", "Transport Operations Inspector"), WATER_INSPECTOR("599521", "Water Inspector"), INSPECTORS_AND_REGULATORY_OFFICERS_NEC(
            "599599", "Inspectors and Regulatory Officers nec"), INSURANCE_INVESTIGATOR("599611", "Insurance Investigator"), INSURANCE_LOSS_ADJUSTER("599612", "Insurance Loss Adjuster"), INSURANCE_RISK_SURVEYOR(
            "599613", "Insurance Risk Surveyor"), LIBRARY_ASSISTANT("599711", "Library Assistant"), PRODUCTION_ASSISTANT_FILM_TELEVISION_RADIO_OR_STAGE("599912",
            "Production Assistant (Film, Television, Radio or Stage)"), PROOF_READER("599913", "Proof Reader"), RADIO_DESPATCHER("599914", "Radio Despatcher"), CLINICAL_CODER("599915",
            "Clinical Coder"), FACILITIES_ADMINISTRATOR("599916", "Facilities Administrator"), CLERICAL_AND_ADMINISTRATIVE_WORKERS_NEC("599999", "Clerical and Administrative Workers nec"), AUCTIONEER(
            "611111", "Auctioneer"), STOCK_AND_STATION_AGENT("611112", "Stock and Station Agent"), INSURANCE_AGENT("611211", "Insurance Agent"), SALES_REPRESENTATIVE_BUILDING_AND_PLUMBING_SUPPLIES(
            "611311", "Sales Representative (Building and Plumbing Supplies)"), SALES_REPRESENTATIVE_BUSINESS_SERVICES("611312", "Sales Representative (Business Services)"), SALES_REPRESENTATIVE_MOTOR_VEHICLE_PARTS_AND_ACCESSORIES(
            "611313", "Sales Representative (Motor Vehicle Parts and Accessories)"), SALES_REPRESENTATIVE_PERSONAL_AND_HOUSEHOLD_GOODS("611314",
            "Sales Representative (Personal and Household Goods)"), SALES_REPRESENTATIVES_NEC("611399", "Sales Representatives nec"), BUSINESS_BROKER("612111", "Business Broker"), PROPERTY_MANAGER(
            "612112", "Property Manager"), REAL_ESTATE_AGENCY_PRINCIPAL("612113", "Real Estate Agency Principal"), REAL_ESTATE_AGENT("612114", "Real Estate Agent"), REAL_ESTATE_REPRESENTATIVE(
            "612115", "Real Estate Representative"), SALES_ASSISTANT_GENERAL("621111", "Sales Assistant (General)"), ICT_SALES_ASSISTANT("621211", "ICT Sales Assistant"), MOTOR_VEHICLE_OR_CARAVAN_SALESPERSON(
            "621311", "Motor Vehicle or Caravan Salesperson"), MOTOR_VEHICLE_PARTS_INTERPRETER("621312", "Motor Vehicle Parts Interpreter"), PHARMACY_SALES_ASSISTANT("621411",
            "Pharmacy Sales Assistant"), RETAIL_SUPERVISOR("621511", "Retail Supervisor"), SERVICE_STATION_ATTENDANT("621611", "Service Station Attendant"), CASH_VAN_SALESPERSON("621711",
            "Cash Van Salesperson"), DOOR_TO_DOOR_SALESPERSON("621712", "Door-to-door Salesperson"), STREET_VENDOR("621713", "Street Vendor"), MATERIALS_RECYCLER("621911", "Materials Recycler"), RENTAL_SALESPERSON(
            "621912", "Rental Salesperson"), SALES_ASSISTANTS_AND_SALESPERSONS_NEC("621999", "Sales Assistants and Salespersons nec"), CHECKOUT_OPERATOR("631111", "Checkout Operator"), OFFICE_CASHIER(
            "631112", "Office Cashier"), MODEL("639111", "Model"), SALES_DEMONSTRATOR("639112", "Sales Demonstrator"), RETAIL_BUYER("639211", "Retail Buyer"), WOOL_BUYER("639212",
            "Wool Buyer"), TELEMARKETER("639311", "Telemarketer"), TICKET_SELLER("639411", "Ticket Seller"), TRANSPORT_CONDUCTOR("639412", "Transport Conductor"), VISUAL_MERCHANDISER(
            "639511", "Visual Merchandiser"), OTHER_SALES_SUPPORT_WORKER("639911", "Other Sales Support Worker"), CLAY_PRODUCTS_MACHINE_OPERATOR("711111", "Clay Products Machine Operator"), CONCRETE_PRODUCTS_MACHINE_OPERATOR(
            "711112", "Concrete Products Machine Operator"), GLASS_PRODUCTION_MACHINE_OPERATOR("711113", "Glass Production Machine Operator"), STONE_PROCESSING_MACHINE_OPERATOR("711114",
            "Stone Processing Machine Operator"), CLAY_CONCRETE_GLASS_AND_STONE_PROCESSING_MACHINE_OPERATORS_NEC("711199", "Clay, Concrete, Glass and Stone Processing Machine Operators nec"), INDUSTRIAL_SPRAYPAINTER(
            "711211", "Industrial Spraypainter"), PAPER_PRODUCTS_MACHINE_OPERATOR("711311", "Paper Products Machine Operator"), SAWMILLING_OPERATOR("711313", "Sawmilling Operator"), OTHER_WOOD_PROCESSING_MACHINE_OPERATOR(
            "711314", "Other Wood Processing Machine Operator"), PHOTOGRAPHIC_DEVELOPER_AND_PRINTER("711411", "Photographic Developer and Printer"), PLASTIC_CABLEMAKING_MACHINE_OPERATOR("711511",
            "Plastic Cablemaking Machine Operator"), PLASTIC_COMPOUNDING_AND_RECLAMATION_MACHINE_OPERATOR("711512", "Plastic Compounding and Reclamation Machine Operator"), PLASTICS_FABRICATOR_OR_WELDER(
            "711513", "Plastics Fabricator or Welder"), PLASTICS_PRODUCTION_MACHINE_OPERATOR_GENERAL("711514", "Plastics Production Machine Operator (General)"), REINFORCED_PLASTIC_AND_COMPOSITE_PRODUCTION_WORKER(
            "711515", "Reinforced Plastic and Composite Production Worker"), RUBBER_PRODUCTION_MACHINE_OPERATOR("711516", "Rubber Production Machine Operator"), PLASTICS_AND_RUBBER_PRODUCTION_MACHINE_OPERATORS_NEC(
            "711599", "Plastics and Rubber Production Machine Operators nec"), SEWING_MACHINIST("711611", "Sewing Machinist"), FOOTWEAR_PRODUCTION_MACHINE_OPERATOR("711711",
            "Footwear Production Machine Operator"), HIDE_AND_SKIN_PROCESSING_MACHINE_OPERATOR("711712", "Hide and Skin Processing Machine Operator"), KNITTING_MACHINE_OPERATOR("711713",
            "Knitting Machine Operator"), TEXTILE_DYEING_AND_FINISHING_MACHINE_OPERATOR("711714", "Textile Dyeing and Finishing Machine Operator"), WEAVING_MACHINE_OPERATOR("711715",
            "Weaving Machine Operator"), YARN_CARDING_AND_SPINNING_MACHINE_OPERATOR("711716", "Yarn Carding and Spinning Machine Operator"), TEXTILE_AND_FOOTWEAR_PRODUCTION_MACHINE_OPERATORS_NEC(
            "711799", "Textile and Footwear Production Machine Operators nec"), CHEMICAL_PRODUCTION_MACHINE_OPERATOR("711911", "Chemical Production Machine Operator"), MOTION_PICTURE_PROJECTIONIST(
            "711912", "Motion Picture Projectionist"), SAND_BLASTER("711913", "Sand Blaster"), STERILISATION_TECHNICIAN("711914", "Sterilisation Technician"), MACHINE_OPERATORS_NEC("711999",
            "Machine Operators nec"), CRANE_HOIST_OR_LIFT_OPERATOR("712111", "Crane, Hoist or Lift Operator"), DRILLER("712211", "Driller"), MINER("712212", "Miner"), SHOT_FIRER("712213",
            "Shot Firer"), ENGINEERING_PRODUCTION_WORKER("712311", "Engineering Production Worker"), BOILER_OR_ENGINE_OPERATOR("712911", "Boiler or Engine Operator"), BULK_MATERIALS_HANDLING_PLANT_OPERATOR(
            "712912", "Bulk Materials Handling Plant Operator"), CEMENT_PRODUCTION_PLANT_OPERATOR("712913", "Cement Production Plant Operator"), CONCRETE_BATCHING_PLANT_OPERATOR("712914",
            "Concrete Batching Plant Operator"), CONCRETE_PUMP_OPERATOR("712915", "Concrete Pump Operator"), PAPER_AND_PULP_MILL_OPERATOR("712916", "Paper and Pulp Mill Operator"), RAILWAY_SIGNAL_OPERATOR(
            "712917", "Railway Signal Operator"), TRAIN_CONTROLLER("712918", "Train Controller"), WASTE_WATER_OR_WATER_PLANT_OPERATOR("712921", "Waste Water or Water Plant Operator"), WEIGHBRIDGE_OPERATOR(
            "712922", "Weighbridge Operator"), STATIONARY_PLANT_OPERATORS_NEC("712999", "Stationary Plant Operators nec"), AGRICULTURAL_AND_HORTICULTURAL_MOBILE_PLANT_OPERATOR("721111",
            "Agricultural and Horticultural Mobile Plant Operator"), LOGGING_PLANT_OPERATOR("721112", "Logging Plant Operator"), EARTHMOVING_PLANT_OPERATOR_GENERAL("721211",
            "Earthmoving Plant Operator (General)"), BACKHOE_OPERATOR("721212", "Backhoe Operator"), BULLDOZER_OPERATOR("721213", "Bulldozer Operator"), EXCAVATOR_OPERATOR("721214",
            "Excavator Operator"), GRADER_OPERATOR("721215", "Grader Operator"), LOADER_OPERATOR("721216", "Loader Operator"), FORKLIFT_DRIVER("721311", "Forklift Driver"), AIRCRAFT_BAGGAGE_HANDLER_AND_AIRLINE_GROUND_CREW(
            "721911", "Aircraft Baggage Handler and Airline Ground Crew"), LINEMARKER("721912", "Linemarker"), PAVING_PLANT_OPERATOR("721913", "Paving Plant Operator"), RAILWAY_TRACK_PLANT_OPERATOR(
            "721914", "Railway Track Plant Operator"), ROAD_ROLLER_OPERATOR("721915", "Road Roller Operator"), STREETSWEEPER_OPERATOR("721916", "Streetsweeper Operator"), MOBILE_PLANT_OPERATORS_NEC(
            "721999", "Mobile Plant Operators nec"), CHAUFFEUR("731111", "Chauffeur"), TAXI_DRIVER("731112", "Taxi Driver"), AUTOMOBILE_DRIVERS_NEC("731199", "Automobile Drivers nec"), BUS_DRIVER(
            "731211", "Bus Driver"), CHARTER_AND_TOUR_BUS_DRIVER("731212", "Charter and Tour Bus Driver"), PASSENGER_COACH_DRIVER("731213", "Passenger Coach Driver"), TRAIN_DRIVER("731311",
            "Train Driver"), TRAM_DRIVER("731312", "Tram Driver"), DELIVERY_DRIVER("732111", "Delivery Driver"), TRUCK_DRIVER_GENERAL("733111", "Truck Driver (General)"), AIRCRAFT_REFUELLER(
            "733112", "Aircraft Refueller"), FURNITURE_REMOVALIST("733113", "Furniture Removalist"), TANKER_DRIVER("733114", "Tanker Driver"), TOW_TRUCK_DRIVER("733115", "Tow Truck Driver"), STOREPERSON(
            "741111", "Storeperson"), CAR_DETAILER("811111", "Car Detailer"), COMMERCIAL_CLEANER("811211", "Commercial Cleaner"), DOMESTIC_CLEANER("811311", "Domestic Cleaner"), COMMERCIAL_HOUSEKEEPER(
            "811411", "Commercial Housekeeper"), DOMESTIC_HOUSEKEEPER("811412", "Domestic Housekeeper"), LAUNDRY_WORKER_GENERAL("811511", "Laundry Worker (General)"), DRYCLEANER("811512",
            "Drycleaner"), IRONER_OR_PRESSER("811513", "Ironer or Presser"), CARPET_CLEANER("811611", "Carpet Cleaner"), WINDOW_CLEANER("811612", "Window Cleaner"), CLEANERS_NEC("811699",
            "Cleaners nec"), BUILDER_S_LABOURER("821111", "Builder's Labourer"), DRAINAGE_SEWERAGE_AND_STORMWATER_LABOURER("821112", "Drainage, Sewerage and Stormwater Labourer"), EARTHMOVING_LABOURER(
            "821113", "Earthmoving Labourer"), PLUMBER_S_ASSISTANT("821114", "Plumber's Assistant"), CONCRETER("821211", "Concreter"), FENCER("821311", "Fencer"), BUILDING_INSULATION_INSTALLER(
            "821411", "Building Insulation Installer"), HOME_IMPROVEMENT_INSTALLER("821412", "Home Improvement Installer"), PAVING_AND_SURFACING_LABOURER("821511", "Paving and Surfacing Labourer"), RAILWAY_TRACK_WORKER(
            "821611", "Railway Track Worker"), CONSTRUCTION_RIGGER("821711", "Construction Rigger"), SCAFFOLDER("821712", "Scaffolder"), STEEL_FIXER("821713", "Steel Fixer"), STRUCTURAL_STEEL_ERECTOR(
            "821714", "Structural Steel Erector"), CRANE_CHASER("821911", "Crane Chaser"), DRILLER_S_ASSISTANT("821912", "Driller's Assistant"), LAGGER("821913", "Lagger"), MINING_SUPPORT_WORKER(
            "821914", "Mining Support Worker"), SURVEYOR_S_ASSISTANT("821915", "Surveyor's Assistant"), BAKING_FACTORY_WORKER("831111", "Baking Factory Worker"), BREWERY_WORKER("831112",
            "Brewery Worker"), CONFECTIONERY_MAKER("831113", "Confectionery Maker"), DAIRY_PRODUCTS_MAKER("831114", "Dairy Products Maker"), FRUIT_AND_VEGETABLE_FACTORY_WORKER("831115",
            "Fruit and Vegetable Factory Worker"), GRAIN_MILL_WORKER("831116", "Grain Mill Worker"), SUGAR_MILL_WORKER("831117", "Sugar Mill Worker"), WINERY_CELLAR_HAND("831118",
            "Winery Cellar Hand"), FOOD_AND_DRINK_FACTORY_WORKERS_NEC("831199", "Food and Drink Factory Workers nec"), MEAT_BONER_AND_SLICER("831211", "Meat Boner and Slicer"), SLAUGHTERER(
            "831212", "Slaughterer"), MEAT_PROCESS_WORKER("831311", "Meat Process Worker"), POULTRY_PROCESS_WORKER("831312", "Poultry Process Worker"), SEAFOOD_PROCESS_WORKER("831313",
            "Seafood Process Worker"), CHOCOLATE_PACKER("832111", "Chocolate Packer"), CONTAINER_FILLER("832112", "Container Filler"), FRUIT_AND_VEGETABLE_PACKER("832113",
            "Fruit and Vegetable Packer"), MEAT_PACKER("832114", "Meat Packer"), SEAFOOD_PACKER("832115", "Seafood Packer"), PACKERS_NEC("832199", "Packers nec"), PRODUCT_ASSEMBLER("832211",
            "Product Assembler"), METAL_ENGINEERING_PROCESS_WORKER("839111", "Metal Engineering Process Worker"), PLASTICS_FACTORY_WORKER("839211", "Plastics Factory Worker"), RUBBER_FACTORY_WORKER(
            "839212", "Rubber Factory Worker"), PRODUCT_EXAMINER("839311", "Product Examiner"), PRODUCT_GRADER("839312", "Product Grader"), PRODUCT_TESTER("839313", "Product Tester"), PAPER_AND_PULP_MILL_WORKER(
            "839411", "Paper and Pulp Mill Worker"), SAWMILL_OR_TIMBER_YARD_WORKER("839412", "Sawmill or Timber Yard Worker"), WOOD_AND_WOOD_PRODUCTS_FACTORY_WORKER("839413",
            "Wood and Wood Products Factory Worker"), CEMENT_AND_CONCRETE_PLANT_WORKER("839911", "Cement and Concrete Plant Worker"), CHEMICAL_PLANT_WORKER("839912", "Chemical Plant Worker"), CLAY_PROCESSING_FACTORY_WORKER(
            "839913", "Clay Processing Factory Worker"), FABRIC_AND_TEXTILE_FACTORY_WORKER("839914", "Fabric and Textile Factory Worker"), FOOTWEAR_FACTORY_WORKER("839915",
            "Footwear Factory Worker"), GLASS_PROCESSING_WORKER("839916", "Glass Processing Worker"), HIDE_AND_SKIN_PROCESSING_WORKER("839917", "Hide and Skin Processing Worker"), RECYCLING_WORKER(
            "839918", "Recycling Worker"), FACTORY_PROCESS_WORKERS_NEC("839999", "Factory Process Workers nec"), AQUACULTURE_WORKER("841111", "Aquaculture Worker"), FRUIT_OR_NUT_FARM_WORKER(
            "841211", "Fruit or Nut Farm Worker"), FRUIT_OR_NUT_PICKER("841212", "Fruit or Nut Picker"), GRAIN_OILSEED_OR_PASTURE_FARM_WORKER("841213", "Grain, Oilseed or Pasture Farm Worker"), VEGETABLE_FARM_WORKER(
            "841214", "Vegetable Farm Worker"), VEGETABLE_PICKER("841215", "Vegetable Picker"), VINEYARD_WORKER("841216", "Vineyard Worker"), MUSHROOM_PICKER("841217", "Mushroom Picker"), CROP_FARM_WORKERS_NEC(
            "841299", "Crop Farm Workers nec"), FORESTRY_WORKER("841311", "Forestry Worker"), LOGGING_ASSISTANT("841312", "Logging Assistant"), TREE_FALLER("841313", "Tree Faller"), GARDEN_LABOURER(
            "841411", "Garden Labourer"), HORTICULTURAL_NURSERY_ASSISTANT("841412", "Horticultural Nursery Assistant"), BEEF_CATTLE_FARM_WORKER("841511", "Beef Cattle Farm Worker"), DAIRY_CATTLE_FARM_WORKER(
            "841512", "Dairy Cattle Farm Worker"), MIXED_LIVESTOCK_FARM_WORKER("841513", "Mixed Livestock Farm Worker"), POULTRY_FARM_WORKER("841514", "Poultry Farm Worker"), SHEEP_FARM_WORKER(
            "841515", "Sheep Farm Worker"), STABLEHAND("841516", "Stablehand"), WOOL_HANDLER("841517", "Wool Handler"), LIVESTOCK_FARM_WORKERS_NEC("841599", "Livestock Farm Workers nec"), MIXED_CROP_AND_LIVESTOCK_FARM_WORKER(
            "841611", "Mixed Crop and Livestock Farm Worker"), HUNTER_TRAPPER("841911", "Hunter-Trapper"), PEST_CONTROLLER("841913", "Pest Controller"), FARM_FORESTRY_AND_GARDEN_WORKERS_NEC(
            "841999", "Farm, Forestry and Garden Workers nec"), FAST_FOOD_COOK("851111", "Fast Food Cook"), PASTRYCOOK_S_ASSISTANT("851211", "Pastrycook's Assistant"), FOOD_TRADES_ASSISTANTS_NEC(
            "851299", "Food Trades Assistants nec"), KITCHENHAND("851311", "Kitchenhand"), FREIGHT_HANDLER_RAIL_OR_ROAD("891111", "Freight Handler (Rail or Road)"), TRUCK_DRIVER_S_OFFSIDER(
            "891112", "Truck Driver's Offsider"), WATERSIDE_WORKER("891113", "Waterside Worker"), SHELF_FILLER("891211", "Shelf Filler"), CARETAKER("899111", "Caretaker"), DECK_HAND("899211",
            "Deck Hand"), FISHING_HAND("899212", "Fishing Hand"), HANDYPERSON("899311", "Handyperson"), MOTOR_VEHICLE_PARTS_AND_ACCESSORIES_FITTER_GENERAL("899411",
            "Motor Vehicle Parts and Accessories Fitter (General)"), AUTOGLAZIER("899412", "Autoglazier"), EXHAUST_AND_MUFFLER_REPAIRER("899413", "Exhaust and Muffler Repairer"), RADIATOR_REPAIRER(
            "899414", "Radiator Repairer"), TYRE_FITTER("899415", "Tyre Fitter"), PRINTER_S_ASSISTANT("899511", "Printer's Assistant"), PRINTING_TABLE_WORKER("899512", "Printing Table Worker"), RECYCLING_OR_RUBBISH_COLLECTOR(
            "899611", "Recycling or Rubbish Collector"), VENDING_MACHINE_ATTENDANT("899711", "Vending Machine Attendant"), BICYCLE_MECHANIC("899911", "Bicycle Mechanic"), CAR_PARK_ATTENDANT(
            "899912", "Car Park Attendant"), CROSSING_SUPERVISOR("899913", "Crossing Supervisor"), ELECTRICAL_OR_TELECOMMUNICATIONS_TRADES_ASSISTANT("899914",
            "Electrical or Telecommunications Trades Assistant"), LEAFLET_OR_NEWSPAPER_DELIVERER("899915", "Leaflet or Newspaper Deliverer"), MECHANIC_S_ASSISTANT("899916", "Mechanic's Assistant"), RAILWAYS_ASSISTANT(
            "899917", "Railways Assistant"), SIGN_ERECTOR("899918", "Sign Erector"), TICKET_COLLECTOR_OR_USHER("899921", "Ticket Collector or Usher"), TROLLEY_COLLECTOR("899922",
            "Trolley Collector"), ROAD_TRAFFIC_CONTROLLER("899923", "Road Traffic Controller"), LABOURERS_NEC("899999", "Labourers nec"), PHARMACISTS("2515", "Pharmacists");

    private Coded anzsco;

    ANZSCO_1ED_2006(String code, String descriptor) {
        this.anzsco = new ANZSCO_1ED_2006_CD(code, descriptor);
    }

    public String getCode() {
        return anzsco.getCode();
    }

    public String getDescriptor() {
        return anzsco.getDisplayName();
    }

    @Override
    public String getCodeSystem() {
        return anzsco.getCodeSystem();
    }

    @Override
    public String getCodeSystemName() {
        return anzsco.getCodeSystemName();
    }

    @Override
    public String getCodeSystemVersion() {
        return anzsco.getCodeSystemVersion();
    }

    @Override
    public String getDisplayName() {
        return anzsco.getDisplayName();
    }

    @Override
    public String getOriginalText() {
        return anzsco.getOriginalText();
    }

    @Override
    public boolean isCoded() {
        return null != anzsco.getCode();
    }

    @Override
    public List<Code> getTranslations() {
        return Collections.emptyList();
    }
}
