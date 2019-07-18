package au.gov.nehta.model.cda.common.person_org;

import java.util.StringJoiner;

public enum Occupation {
 
    Undefined(null, null, null),

    Managersnfd("100000", "Managers nfd", "ANZSCO"),  

    ChiefExecutivesGeneralManagersandLegislatorsnfd("111000", "Chief Executives, General Managers and Legislators nfd", "ANZSCO"),

    ChiefExecutiveorManagingDirector("111111", "Chief Executive or Managing Director", "ANZSCO"),

    GeneralManagersnfd("111200", "General Managers nfd", "ANZSCO"),

            /// The corporate general manager
    CorporateGeneralManager("111211", "Corporate General Manager", "ANZSCO"),

            /// The defence force senior officer
    DefenceForceSeniorOfficer("111212", "Defence Force Senior Officer", "ANZSCO"),

            /// The legislatorsnfd
    Legislatorsnfd("111300", "Legislators nfd", "ANZSCO"),

            /// The local government legislator
    LocalGovernmentLegislator("111311", "Local Government Legislator", "ANZSCO"),

            /// The memberof parliament
    MemberofParliament("111312", "Member of Parliament", "ANZSCO"),

            /// The legislatorsnec
    Legislatorsnec("111399", "Legislators nec", "ANZSCO"),

            /// The farmersand farm managersnfd
    FarmersandFarmManagersnfd("121000", "Farmers and Farm Managers nfd", "ANZSCO"),

            /// The aquaculture farmer
    AquacultureFarmer("121111", "Aquaculture Farmer", "ANZSCO"),

            /// The crop farmersnfd
    CropFarmersnfd("121200", "Crop Farmers nfd", "ANZSCO"),

            /// The cotton grower
    CottonGrower("121211", "Cotton Grower", "ANZSCO"),

            /// The flower grower
    FlowerGrower("121212", "Flower Grower", "ANZSCO"),

            /// The fruitor nut grower
    FruitorNutGrower("121213", "Fruit or Nut Grower", "ANZSCO"),

            /// The grain oilseedor pasture grower
    GrainOilseedorPastureGrower("121214", "Grain, Oilseed or Pasture Grower", "ANZSCO"),

            /// The grape grower
    GrapeGrower("121215", "Grape Grower", "ANZSCO"),

            /// The mixed crop farmer
    MixedCropFarmer("121216", "Mixed Crop Farmer", "ANZSCO"),

            /// The sugar cane grower
    SugarCaneGrower("121217", "Sugar Cane Grower", "ANZSCO"),

            /// The turf grower
    TurfGrower("121218", "Turf Grower", "ANZSCO"),

            /// The vegetable grower
    VegetableGrower("121221", "Vegetable Grower", "ANZSCO"),

            /// The crop farmersnec
    CropFarmersnec("121299", "Crop Farmers nec", "ANZSCO"),

            /// The livestock farmersnfd
    LivestockFarmersnfd("121300", "Livestock Farmers nfd", "ANZSCO"),

            /// The apiarist
    Apiarist("121311", "Apiarist", "ANZSCO"),

            /// The beef cattle farmer
    BeefCattleFarmer("121312", "Beef Cattle Farmer", "ANZSCO"),

            /// The dairy cattle farmer
    DairyCattleFarmer("121313", "Dairy Cattle Farmer", "ANZSCO"),

            /// The deer farmer
    DeerFarmer("121314", "Deer Farmer", "ANZSCO"),

            /// The goat farmer
    GoatFarmer("121315", "Goat Farmer", "ANZSCO"),

            /// The horse breeder
    HorseBreeder("121316", "Horse Breeder", "ANZSCO"),

            /// The mixed livestock farmer
    MixedLivestockFarmer("121317", "Mixed Livestock Farmer", "ANZSCO"),

            /// The pig farmer
    PigFarmer("121318", "Pig Farmer", "ANZSCO"),

            /// The poultry farmer
    PoultryFarmer("121321", "Poultry Farmer", "ANZSCO"),

            /// The sheep farmer
    SheepFarmer("121322", "Sheep Farmer", "ANZSCO"),

            /// The livestock farmersnec
    LivestockFarmersnec("121399", "Livestock Farmers nec", "ANZSCO"),

            /// The mixed cropand livestock farmer
    MixedCropandLivestockFarmer("121411", "Mixed Crop and Livestock Farmer", "ANZSCO"),

            /// The specialist managersnfd
    SpecialistManagersnfd("130000", "Specialist Managers nfd", "ANZSCO"),

            /// The advertising public relationsand sales managersnfd
    AdvertisingPublicRelationsandSalesManagersnfd("131100", "Advertising, Public Relations and Sales Managers nfd", "ANZSCO"),

            /// The salesand marketing manager
    SalesandMarketingManager("131112", "Sales and Marketing Manager", "ANZSCO"),

            /// The advertising manager
    AdvertisingManager("131113", "Advertising Manager", "ANZSCO"),

            /// The public relations manager
    PublicRelationsManager("131114", "Public Relations Manager", "ANZSCO"),

            /// The business administration managersnfd
    BusinessAdministrationManagersnfd("132000", "Business Administration Managers nfd", "ANZSCO"),

            /// The corporate services manager
    CorporateServicesManager("132111", "Corporate Services Manager", "ANZSCO"),

            /// The finance manager
    FinanceManager("132211", "Finance Manager", "ANZSCO"),

            /// The human resource manager
    HumanResourceManager("132311", "Human Resource Manager", "ANZSCO"),

            /// The policyand planning manager
    PolicyandPlanningManager("132411", "Policy and Planning Manager", "ANZSCO"),

            /// The researchand development manager
    ResearchandDevelopmentManager("132511", "Research and Development Manager", "ANZSCO"),

            /// The construction distributionand production managersnfd
    ConstructionDistributionandProductionManagersnfd("133000", "Construction, Distribution and Production Managers nfd", "ANZSCO"),

            /// The construction managersnfd
    ConstructionManagersnfd("133100", "Construction Managers nfd", "ANZSCO"),

            /// The construction project manager
    ConstructionProjectManager("133111", "Construction Project Manager", "ANZSCO"),

            /// The project builder
    ProjectBuilder("133112", "Project Builder", "ANZSCO"),

            /// The engineering manager
    EngineeringManager("133211", "Engineering Manager", "ANZSCO"),

            /// The importers exportersand wholesalersnfd
    ImportersExportersandWholesalersnfd("133300", "Importers, Exporters and Wholesalers nfd", "ANZSCO"),

            /// The importeror exporter
    ImporterorExporter("133311", "Importer or Exporter", "ANZSCO"),

            /// The wholesaler
    Wholesaler("133312", "Wholesaler", "ANZSCO"),

            /// The manufacturer
    Manufacturer("133411", "Manufacturer", "ANZSCO"),

            /// The production managersnfd
    ProductionManagersnfd("133500", "Production Managers nfd", "ANZSCO"),

            /// The production manager forestry
    ProductionManagerForestry("133511", "Production Manager (Forestry)", "ANZSCO"),

            /// The production manager manufacturing
    ProductionManagerManufacturing("133512", "Production Manager (Manufacturing)", "ANZSCO"),

            /// The production manager mining
    ProductionManagerMining("133513", "Production Manager (Mining)", "ANZSCO"),

            /// The supplyand distribution manager
    SupplyandDistributionManager("133611", "Supply and Distribution Manager", "ANZSCO"),

            /// The education healthand welfare services managersnfd
    EducationHealthandWelfareServicesManagersnfd("134000", "Education, Health and Welfare Services Managers nfd", "ANZSCO"),

            /// The child care centre manager
    ChildCareCentreManager("134111", "Child Care Centre Manager", "ANZSCO"),
/// <summary>
/// The healthand welfare services managersnfd
/// </summary>    HealthandWelfareServicesManagersnfd("134200", "Health and Welfare Services Managers nfd", "ANZSCO"),

            /// The medical administrator
    MedicalAdministrator("134211", "Medical Administrator", "ANZSCO"),

            /// The nursing clinical director
    NursingClinicalDirector("134212", "Nursing Clinical Director", "ANZSCO"),

            /// The primary health organisation manager
    PrimaryHealthOrganisationManager("134213", "Primary Health Organisation Manager", "ANZSCO"),

            /// The welfare centre manager
    WelfareCentreManager("134214", "Welfare Centre Manager", "ANZSCO"),

            /// The healthand welfare services managersnec
    HealthandWelfareServicesManagersnec("134299", "Health and Welfare Services Managers nec", "ANZSCO"),

            /// The school principal
    SchoolPrincipal("134311", "School Principal", "ANZSCO"),

            /// The other education managersnfd
    OtherEducationManagersnfd("134400", "Other Education Managers nfd", "ANZSCO"),

            /// The faculty head
    FacultyHead("134411", "Faculty Head", "ANZSCO"),

            /// The regional education manager
    RegionalEducationManager("134412", "Regional Education Manager", "ANZSCO"),

            /// The education managersnec
    EducationManagersnec("134499", "Education Managers nec", "ANZSCO"),

            /// The ICT managersnfd
    ICTManagersnfd("135100", "ICT Managers nfd", "ANZSCO"),

            /// The chief information officer
    ChiefInformationOfficer("135111", "Chief Information Officer", "ANZSCO"),

            /// The ICT project manager
    ICTProjectManager("135112", "ICT Project Manager", "ANZSCO"),

            /// The ICT managersnec
    ICTManagersnec("135199", "ICT Managers nec", "ANZSCO"),

            /// The miscellaneous specialist managersnfd
    MiscellaneousSpecialistManagersnfd("139000", "Miscellaneous Specialist Managers nfd", "ANZSCO"),

            /// The commissioned officers managementnfd
    CommissionedOfficersManagementnfd("139100", "Commissioned Officers (Management) nfd", "ANZSCO"),

            /// The commissioned defence force officer
    CommissionedDefenceForceOfficer("139111", "Commissioned Defence Force Officer", "ANZSCO"),

            /// The commissioned fire officer
    CommissionedFireOfficer("139112", "Commissioned Fire Officer", "ANZSCO"),

            /// The commissioned police officer
    CommissionedPoliceOfficer("139113", "Commissioned Police Officer", "ANZSCO"),

            /// The senior noncommissioned defence force member
    SeniorNoncommissionedDefenceForceMember("139211", "Senior Non-commissioned Defence Force Member", "ANZSCO"),

            /// The other specialist managersnfd
    OtherSpecialistManagersnfd("139900", "Other Specialist Managers nfd", "ANZSCO"),

            /// The arts administratoror manager
    ArtsAdministratororManager("139911", "Arts Administrator or Manager", "ANZSCO"),

            /// The environmental manager
    EnvironmentalManager("139912", "Environmental Manager", "ANZSCO"),

            /// The laboratory manager
    LaboratoryManager("139913", "Laboratory Manager", "ANZSCO"),

            /// The quality assurance manager
    QualityAssuranceManager("139914", "Quality Assurance Manager", "ANZSCO"),

            /// The sports administrator
    SportsAdministrator("139915", "Sports Administrator", "ANZSCO"),

            /// The specialist managersnec
    SpecialistManagersnec("139999", "Specialist Managers nec", "ANZSCO"),

            /// The hospitality retailand service managersnfd
    HospitalityRetailandServiceManagersnfd("140000", "Hospitality, Retail and Service Managers nfd", "ANZSCO"),

            /// The accommodationand hospitality managersnfd
    AccommodationandHospitalityManagersnfd("141000", "Accommodation and Hospitality Managers nfd", "ANZSCO"),

            /// The cafeor restaurant manager
    CafeorRestaurantManager("141111", "Cafe or Restaurant Manager", "ANZSCO"),

            /// The caravan parkand camping ground manager
    CaravanParkandCampingGroundManager("141211", "Caravan Park and Camping Ground Manager", "ANZSCO"),

            /// The hotelor motel manager
    HotelorMotelManager("141311", "Hotel or Motel Manager", "ANZSCO"),

            /// The licensed club manager
    LicensedClubManager("141411", "Licensed Club Manager", "ANZSCO"),

            /// The other accommodationand hospitality managersnfd
    OtherAccommodationandHospitalityManagersnfd("141900", "Other Accommodation and Hospitality Managers nfd", "ANZSCO"),

            /// The bedand breakfast operator
    BedandBreakfastOperator("141911", "Bed and Breakfast Operator", "ANZSCO"),

            /// The retirement village manager
    RetirementVillageManager("141912", "Retirement Village Manager", "ANZSCO"),

            /// The accommodationand hospitality managersnec
    AccommodationandHospitalityManagersnec("141999", "Accommodation and Hospitality Managers nec", "ANZSCO"),

            /// The retail managersnfd
    RetailManagersnfd("142100", "Retail Managers nfd", "ANZSCO"),

            /// The retail manager general
    RetailManagerGeneral("142111", "Retail Manager (General)", "ANZSCO"),

            /// The antique dealer
    AntiqueDealer("142112", "Antique Dealer", "ANZSCO"),

            /// The betting agency manager
    BettingAgencyManager("142113", "Betting Agency Manager", "ANZSCO"),

            /// The hairor beauty salon manager
    HairorBeautySalonManager("142114", "Hair or Beauty Salon Manager", "ANZSCO"),

            /// The post office manager
    PostOfficeManager("142115", "Post Office Manager", "ANZSCO"),

            /// The travel agency manager
    TravelAgencyManager("142116", "Travel Agency Manager", "ANZSCO"),
/// <summary>
/// The miscellaneous hospitality retailand service managersnfd
/// </summary>    MiscellaneousHospitalityRetailandServiceManagersnfd("149000", "Miscellaneous Hospitality, Retail and Service Managers nfd", "ANZSCO"),

            /// The amusement fitnessand sports centre managersnfd
    AmusementFitnessandSportsCentreManagersnfd("149100", "Amusement, Fitness and Sports Centre Managers nfd", "ANZSCO"),

            /// The amusement centre manager
    AmusementCentreManager("149111", "Amusement Centre Manager", "ANZSCO"),

            /// The fitness centre manager
    FitnessCentreManager("149112", "Fitness Centre Manager", "ANZSCO"),

            /// The sports centre manager
    SportsCentreManager("149113", "Sports Centre Manager", "ANZSCO"),

            /// The callor contact centreand customer service managersnfd
    CallorContactCentreandCustomerServiceManagersnfd("149200", "Call or Contact Centre and Customer Service Managers nfd", "ANZSCO"),

            /// The callor contact centre manager
    CallorContactCentreManager("149211", "Call or Contact Centre Manager", "ANZSCO"),

            /// The customer service manager
    CustomerServiceManager("149212", "Customer Service Manager", "ANZSCO"),

            /// The conferenceand event organiser
    ConferenceandEventOrganiser("149311", "Conference and Event Organiser", "ANZSCO"),

            /// The transport services managersnfd
    TransportServicesManagersnfd("149400", "Transport Services Managers nfd", "ANZSCO"),

            /// The fleet manager
    FleetManager("149411", "Fleet Manager", "ANZSCO"),

            /// The railway station manager
    RailwayStationManager("149412", "Railway Station Manager", "ANZSCO"),

            /// The transport company manager
    TransportCompanyManager("149413", "Transport Company Manager", "ANZSCO"),

            /// The other hospitality retailand service managersnfd
    OtherHospitalityRetailandServiceManagersnfd("149900", "Other Hospitality, Retail and Service Managers nfd", "ANZSCO"),

            /// The boarding kennelor cattery operator
    BoardingKennelorCatteryOperator("149911", "Boarding Kennel or Cattery Operator", "ANZSCO"),

            /// The cinemaor theatre manager
    CinemaorTheatreManager("149912", "Cinema or Theatre Manager", "ANZSCO"),

            /// The facilities manager
    FacilitiesManager("149913", "Facilities Manager", "ANZSCO"),

            /// The financial institution branch manager
    FinancialInstitutionBranchManager("149914", "Financial Institution Branch Manager", "ANZSCO"),

            /// The equipment hire manager
    EquipmentHireManager("149915", "Equipment Hire Manager", "ANZSCO"),

            /// The hospitality retailand service managersnec
    HospitalityRetailandServiceManagersnec("149999", "Hospitality, Retail and Service Managers nec", "ANZSCO"),

            /// The professionalsnfd
    Professionalsnfd("200000", "Professionals nfd", "ANZSCO"),

            /// The artsand media professionalsnfd
    ArtsandMediaProfessionalsnfd("210000", "Arts and Media Professionals nfd", "ANZSCO"),
/// <summary>
/// The arts professionalsnfd
/// </summary>    ArtsProfessionalsnfd("211000", "Arts Professionals nfd", "ANZSCO"),

            /// The actors dancersand other entertainersnfd
    ActorsDancersandOtherEntertainersnfd("211100", "Actors, Dancers and Other Entertainers nfd", "ANZSCO"),

            /// The actor
    Actor("211111", "Actor", "ANZSCO"),

            /// The danceror choreographer
    DancerorChoreographer("211112", "Dancer or Choreographer", "ANZSCO"),

            /// The entertaineror variety artist
    EntertainerorVarietyArtist("211113", "Entertainer or Variety Artist", "ANZSCO"),

            /// The actors dancersand other entertainersnec
    ActorsDancersandOtherEntertainersnec("211199", "Actors, Dancers and Other Entertainers nec", "ANZSCO"),

            /// The music professionalsnfd
    MusicProfessionalsnfd("211200", "Music Professionals nfd", "ANZSCO"),

            /// The composer
    Composer("211211", "Composer", "ANZSCO"),

            /// The music director
    MusicDirector("211212", "Music Director", "ANZSCO"),

            /// The musician instrumental
    MusicianInstrumental("211213", "Musician (Instrumental)", "ANZSCO"),

            /// The singer
    Singer("211214", "Singer", "ANZSCO"),

            /// The music professionalsnec
    MusicProfessionalsnec("211299", "Music Professionals nec", "ANZSCO"),

            /// The photographer
    Photographer("211311", "Photographer", "ANZSCO"),

            /// The visual artsand crafts professionalsnfd
    VisualArtsandCraftsProfessionalsnfd("211400", "Visual Arts and Crafts Professionals nfd", "ANZSCO"),

            /// The painter visual arts
    PainterVisualArts("211411", "Painter (Visual Arts)", "ANZSCO"),

            /// The potteror ceramic artist
    PotterorCeramicArtist("211412", "Potter or Ceramic Artist", "ANZSCO"),

            /// The sculptor
    Sculptor("211413", "Sculptor", "ANZSCO"),

            /// The visual artsand crafts professionalsnec
    VisualArtsandCraftsProfessionalsnec("211499", "Visual Arts and Crafts Professionals nec", "ANZSCO"),

            /// The media professionalsnfd
    MediaProfessionalsnfd("212000", "Media Professionals nfd", "ANZSCO"),

            /// The artistic directorsand media producersand presentersnfd
    ArtisticDirectorsandMediaProducersandPresentersnfd("212100", "Artistic Directors, and Media Producers and Presenters nfd", "ANZSCO"),

            /// The artistic director
    ArtisticDirector("212111", "Artistic Director", "ANZSCO"),

            /// The media producerexcluding video
    MediaProducerexcludingVideo("212112", "Media Producer (excluding Video)", "ANZSCO"),

            /// The radio presenter
    RadioPresenter("212113", "Radio Presenter", "ANZSCO"),

            /// The television presenter
    TelevisionPresenter("212114", "Television Presenter", "ANZSCO"),

            /// The authorsand bookand script editorsnfd
    AuthorsandBookandScriptEditorsnfd("212200", "Authors, and Book and Script Editors nfd", "ANZSCO"),

            /// The author
    Author("212211", "Author", "ANZSCO"),

            /// The bookor script editor
    BookorScriptEditor("212212", "Book or Script Editor", "ANZSCO"),

            /// The film television radioand stage directorsnfd
    FilmTelevisionRadioandStageDirectorsnfd("212300", "Film, Television, Radio and Stage Directors nfd", "ANZSCO"),

            /// The art director film televisionor stage
    ArtDirectorFilmTelevisionorStage("212311", "Art Director (Film, Television or Stage)", "ANZSCO"),

            /// The director film television radioor stage
    DirectorFilmTelevisionRadioorStage("212312", "Director (Film, Television, Radio or Stage)", "ANZSCO"),

            /// The directorof photography
    DirectorofPhotography("212313", "Director of Photography", "ANZSCO"),

            /// The filmand video editor
    FilmandVideoEditor("212314", "Film and Video Editor", "ANZSCO"),

            /// The program director televisionor radio
    ProgramDirectorTelevisionorRadio("212315", "Program Director (Television or Radio)", "ANZSCO"),

            /// The stage manager
    StageManager("212316", "Stage Manager", "ANZSCO"),

            /// The technical director
    TechnicalDirector("212317", "Technical Director", "ANZSCO"),

            /// The video producer
    VideoProducer("212318", "Video Producer", "ANZSCO"),

            /// The film television radioand stage directorsnec
    FilmTelevisionRadioandStageDirectorsnec("212399", "Film, Television, Radio and Stage Directors nec", "ANZSCO"),

            /// The journalistsand other writersnfd
    JournalistsandOtherWritersnfd("212400", "Journalists and Other Writers nfd", "ANZSCO"),

            /// The copywriter
    Copywriter("212411", "Copywriter", "ANZSCO"),

            /// The newspaperor periodical editor
    NewspaperorPeriodicalEditor("212412", "Newspaper or Periodical Editor", "ANZSCO"),

            /// The print journalist
    PrintJournalist("212413", "Print Journalist", "ANZSCO"),

            /// The radio journalist
    RadioJournalist("212414", "Radio Journalist", "ANZSCO"),

            /// The technical writer
    TechnicalWriter("212415", "Technical Writer", "ANZSCO"),

            /// The television journalist
    TelevisionJournalist("212416", "Television Journalist", "ANZSCO"),

            /// The journalistsand other writersnec
    JournalistsandOtherWritersnec("212499", "Journalists and Other Writers nec", "ANZSCO"),

            /// The business human resourceand marketing professionalsnfd
    BusinessHumanResourceandMarketingProfessionalsnfd("220000", "Business, Human Resource and Marketing Professionals nfd", "ANZSCO"),

            /// The accountants auditorsand company secretariesnfd
    AccountantsAuditorsandCompanySecretariesnfd("221000", "Accountants, Auditors and Company Secretaries nfd", "ANZSCO"),

            /// The accountantsnfd
    Accountantsnfd("221100", "Accountants nfd", "ANZSCO"),

            /// The accountant general
    AccountantGeneral("221111", "Accountant (General)", "ANZSCO"),

            /// The management accountant
    ManagementAccountant("221112", "Management Accountant", "ANZSCO"),

            /// The taxation accountant
    TaxationAccountant("221113", "Taxation Accountant", "ANZSCO"),

            /// The auditors company secretariesand corporate treasurersnfd
    AuditorsCompanySecretariesandCorporateTreasurersnfd("221200", "Auditors, Company Secretaries and Corporate Treasurers nfd", "ANZSCO"),

            /// The company secretary
    CompanySecretary("221211", "Company Secretary", "ANZSCO"),

            /// The corporate treasurer
    CorporateTreasurer("221212", "Corporate Treasurer", "ANZSCO"),

            /// The external auditor
    ExternalAuditor("221213", "External Auditor", "ANZSCO"),

            /// The internal auditor
    InternalAuditor("221214", "Internal Auditor", "ANZSCO"),

            /// The financial brokersand dealersand investment advisersnfd
    FinancialBrokersandDealersandInvestmentAdvisersnfd("222000", "Financial Brokers and Dealers, and Investment Advisers nfd", "ANZSCO"),

            /// The financial brokersnfd
    FinancialBrokersnfd("222100", "Financial Brokers nfd", "ANZSCO"),

            /// The commodities trader
    CommoditiesTrader("222111", "Commodities Trader", "ANZSCO"),

            /// The finance broker
    FinanceBroker("222112", "Finance Broker", "ANZSCO"),

            /// The insurance broker
    InsuranceBroker("222113", "Insurance Broker", "ANZSCO"),

            /// The financial brokersnec
    FinancialBrokersnec("222199", "Financial Brokers nec", "ANZSCO"),

            /// The financial dealersnfd
    FinancialDealersnfd("222200", "Financial Dealers nfd", "ANZSCO"),

            /// The financial market dealer
    FinancialMarketDealer("222211", "Financial Market Dealer", "ANZSCO"),

            /// The futures trader
    FuturesTrader("222212", "Futures Trader", "ANZSCO"),

            /// The stockbroking dealer
    StockbrokingDealer("222213", "Stockbroking Dealer", "ANZSCO"),

            /// The financial dealersnec
    FinancialDealersnec("222299", "Financial Dealers nec", "ANZSCO"),

            /// The financial investment advisersand managersnfd
    FinancialInvestmentAdvisersandManagersnfd("222300", "Financial Investment Advisers and Managers nfd", "ANZSCO"),

            /// The financial investment adviser
    FinancialInvestmentAdviser("222311", "Financial Investment Adviser", "ANZSCO"),

            /// The financial investment manager
    FinancialInvestmentManager("222312", "Financial Investment Manager", "ANZSCO"),

            /// The human resourceand training professionalsnfd
    HumanResourceandTrainingProfessionalsnfd("223000", "Human Resource and Training Professionals nfd", "ANZSCO"),

            /// The human resource professionalsnfd
    HumanResourceProfessionalsnfd("223100", "Human Resource Professionals nfd", "ANZSCO"),

            /// The human resource adviser
    HumanResourceAdviser("223111", "Human Resource Adviser", "ANZSCO"),

            /// The recruitment consultant
    RecruitmentConsultant("223112", "Recruitment Consultant", "ANZSCO"),

            /// The workplace relations adviser
    WorkplaceRelationsAdviser("223113", "Workplace Relations Adviser", "ANZSCO"),

            /// The ICT trainer
    ICTTrainer("223211", "ICT Trainer", "ANZSCO"),

            /// The trainingand development professional
    TrainingandDevelopmentProfessional("223311", "Training and Development Professional", "ANZSCO"),

            /// The informationand organisation professionalsnfd
    InformationandOrganisationProfessionalsnfd("224000", "Information and Organisation Professionals nfd", "ANZSCO"),

            /// The actuaries mathematiciansand statisticiansnfd
    ActuariesMathematiciansandStatisticiansnfd("224100", "Actuaries, Mathematicians and Statisticians nfd", "ANZSCO"),

            /// The actuary
    Actuary("224111", "Actuary", "ANZSCO"),

            /// The mathematician
    Mathematician("224112", "Mathematician", "ANZSCO"),

            /// The statistician
    Statistician("224113", "Statistician", "ANZSCO"),

            /// The archivists curatorsand records managersnfd
    ArchivistsCuratorsandRecordsManagersnfd("224200", "Archivists, Curators and Records Managers nfd", "ANZSCO"),

            /// The archivist
    Archivist("224211", "Archivist", "ANZSCO"),

            /// The galleryor museum curator


    GalleryorMuseumCurator("224212", "Gallery or Museum Curator", "ANZSCO"),

            /// The health information manager


    HealthInformationManager("224213", "Health Information Manager", "ANZSCO"),

            /// The records manager
    RecordsManager("224214", "Records Manager", "ANZSCO"),

            /// The economist
    Economist("224311", "Economist", "ANZSCO"),

            /// The intelligenceand policy analystsnfd
    IntelligenceandPolicyAnalystsnfd("224400", "Intelligence and Policy Analysts nfd", "ANZSCO"),

            /// The intelligence officer
    IntelligenceOfficer("224411", "Intelligence Officer", "ANZSCO"),

            /// The policy analyst
    PolicyAnalyst("224412", "Policy Analyst", "ANZSCO"),

            /// The land economistsand valuersnfd
    LandEconomistsandValuersnfd("224500", "Land Economists and Valuers nfd", "ANZSCO"),

            /// The land economist
    LandEconomist("224511", "Land Economist", "ANZSCO"),

            /// The valuer
    Valuer("224512", "Valuer", "ANZSCO"),

            /// The librarian
    Librarian("224611", "Librarian", "ANZSCO"),

            /// The managementand organisation analystsnfd
    ManagementandOrganisationAnalystsnfd("224700", "Management and Organisation Analysts nfd", "ANZSCO"),

            /// The management consultant
    ManagementConsultant("224711", "Management Consultant", "ANZSCO"),

            /// The organisationand methods analyst
    OrganisationandMethodsAnalyst("224712", "Organisation and Methods Analyst", "ANZSCO"),

            /// The other informationand organisation professionalsnfd
    OtherInformationandOrganisationProfessionalsnfd("224900", "Other Information and Organisation Professionals nfd", "ANZSCO"),

            /// The electorate officer
    ElectorateOfficer("224911", "Electorate Officer", "ANZSCO"),

            /// The liaison officer
    LiaisonOfficer("224912", "Liaison Officer", "ANZSCO"),

            /// The migration agent
    MigrationAgent("224913", "Migration Agent", "ANZSCO"),

            /// The patents examiner
    PatentsExaminer("224914", "Patents Examiner", "ANZSCO"),

            /// The informationand organisation professionalsnec
    InformationandOrganisationProfessionalsnec("224999", "Information and Organisation Professionals nec", "ANZSCO"),

            /// The sales marketingand public relations professionalsnfd
    SalesMarketingandPublicRelationsProfessionalsnfd("225000", "Sales, Marketing and Public Relations Professionals nfd", "ANZSCO"),

            /// The advertisingand marketing professionalsnfd
    AdvertisingandMarketingProfessionalsnfd("225100", "Advertising and Marketing Professionals nfd", "ANZSCO"),

            /// The advertising specialist
    AdvertisingSpecialist("225111", "Advertising Specialist", "ANZSCO"),

            /// The market research analyst
    MarketResearchAnalyst("225112", "Market Research Analyst", "ANZSCO"),

            /// The marketing specialist
    MarketingSpecialist("225113", "Marketing Specialist", "ANZSCO"),

            /// The ICT sales professionalsnfd
    ICTSalesProfessionalsnfd("225200", "ICT Sales Professionals nfd", "ANZSCO"),

            /// The ICT account manager
    ICTAccountManager("225211", "ICT Account Manager", "ANZSCO"),

            /// The ICT business development manager
    ICTBusinessDevelopmentManager("225212", "ICT Business Development Manager", "ANZSCO"),

            /// The ICT sales representative
    ICTSalesRepresentative("225213", "ICT Sales Representative", "ANZSCO"),

            /// The public relations professional
    PublicRelationsProfessional("225311", "Public Relations Professional", "ANZSCO"),

            /// The technical sales representativesnfd
    TechnicalSalesRepresentativesnfd("225400", "Technical Sales Representatives nfd", "ANZSCO"),

            /// The sales representative industrial products
    SalesRepresentativeIndustrialProducts("225411", "Sales Representative (Industrial Products)", "ANZSCO"),

            /// The sales representative medicaland pharmaceutical products
    SalesRepresentativeMedicalandPharmaceuticalProducts("225412", "Sales Representative (Medical and Pharmaceutical Products)", "ANZSCO"),

            /// The technical sales representativesnec
    TechnicalSalesRepresentativesnec("225499", "Technical Sales Representatives nec", "ANZSCO"),

            /// The design engineering scienceand transport professionalsnfd
    DesignEngineeringScienceandTransportProfessionalsnfd("230000", "Design, Engineering, Science and Transport Professionals nfd", "ANZSCO"),

            /// The airand marine transport professionalsnfd
    AirandMarineTransportProfessionalsnfd("231000", "Air and Marine Transport Professionals nfd", "ANZSCO"),

            /// The air transport professionalsnfd
    AirTransportProfessionalsnfd("231100", "Air Transport Professionals nfd", "ANZSCO"),

            /// The aeroplane pilot
    AeroplanePilot("231111", "Aeroplane Pilot", "ANZSCO"),

            /// The air traffic controller
    AirTrafficController("231112", "Air Traffic Controller", "ANZSCO"),

            /// The flying instructor
    FlyingInstructor("231113", "Flying Instructor", "ANZSCO"),

            /// The helicopter pilot
    HelicopterPilot("231114", "Helicopter Pilot", "ANZSCO"),

            /// The air transport professionalsnec
    AirTransportProfessionalsnec("231199", "Air Transport Professionals nec", "ANZSCO"),

            /// The marine transport professionalsnfd
    MarineTransportProfessionalsnfd("231200", "Marine Transport Professionals nfd", "ANZSCO"),

            /// The master fisher
    MasterFisher("231211", "Master Fisher", "ANZSCO"),

            /// The ships engineer
    ShipsEngineer("231212", "Ship's Engineer", "ANZSCO"),

            /// The ships master
    ShipsMaster("231213", "Ship's Master", "ANZSCO"),

            /// The ships officer
    ShipsOfficer("231214", "Ship's Officer", "ANZSCO"),

            /// The ships surveyor
    ShipsSurveyor("231215", "Ship's Surveyor", "ANZSCO"),

            /// The marine transport professionalsnec
    MarineTransportProfessionalsnec("231299", "Marine Transport Professionals nec", "ANZSCO"),

            /// The architects designers plannersand surveyorsnfd
    ArchitectsDesignersPlannersandSurveyorsnfd("232000", "Architects, Designers, Planners and Surveyors nfd", "ANZSCO"),

            /// The architectsand landscape architectsnfd
    ArchitectsandLandscapeArchitectsnfd("232100", "Architects and Landscape Architects nfd", "ANZSCO"),

            /// The architect
    Architect("232111", "Architect", "ANZSCO"),

            /// The landscape architect
    LandscapeArchitect("232112", "Landscape Architect", "ANZSCO"),

            /// The surveyorsand spatial scientistsnfd
    SurveyorsandSpatialScientistsnfd("232200", "Surveyors and Spatial Scientists nfd", "ANZSCO"),

            /// The surveyor
    Surveyor("232212", "Surveyor", "ANZSCO"),

            /// The cartographer
    Cartographer("232213", "Cartographer", "ANZSCO"),

            /// The other spatial scientist
    OtherSpatialScientist("232214", "Other Spatial Scientist", "ANZSCO"),

            /// The fashion industrialand jewellery designersnfd
    FashionIndustrialandJewelleryDesignersnfd("232300", "Fashion, Industrial and Jewellery Designers nfd", "ANZSCO"),

            /// The fashion designer
    FashionDesigner("232311", "Fashion Designer", "ANZSCO"),

            /// The industrial designer
    IndustrialDesigner("232312", "Industrial Designer", "ANZSCO"),

            /// The jewellery designer
    JewelleryDesigner("232313", "Jewellery Designer", "ANZSCO"),

            /// The graphicand web designersand illustratorsnfd
    GraphicandWebDesignersandIllustratorsnfd("232400", "Graphic and Web Designers, and Illustrators nfd", "ANZSCO"),

            /// The graphic designer
    GraphicDesigner("232411", "Graphic Designer", "ANZSCO"),

            /// The illustrator
    Illustrator("232412", "Illustrator", "ANZSCO"),

            /// The multimedia designer
    MultimediaDesigner("232413", "Multimedia Designer", "ANZSCO"),

            /// The web designer
    WebDesigner("232414", "Web Designer", "ANZSCO"),

            /// The interior designer
    InteriorDesigner("232511", "Interior Designer", "ANZSCO"),

            /// The urbanand regional planner
    UrbanandRegionalPlanner("232611", "Urban and Regional Planner", "ANZSCO"),

            /// The engineering professionalsnfd
    EngineeringProfessionalsnfd("233000", "Engineering Professionals nfd", "ANZSCO"),

            /// The chemicaland materials engineersnfd
    ChemicalandMaterialsEngineersnfd("233100", "Chemical and Materials Engineers nfd", "ANZSCO"),

            /// The chemical engineer
    ChemicalEngineer("233111", "Chemical Engineer", "ANZSCO"),

            /// The materials engineer
    MaterialsEngineer("233112", "Materials Engineer", "ANZSCO"),

            /// The civil engineering professionalsnfd
    CivilEngineeringProfessionalsnfd("233200", "Civil Engineering Professionals nfd", "ANZSCO"),

            /// The civil engineer
    CivilEngineer("233211", "Civil Engineer", "ANZSCO"),

            /// The geotechnical engineer
    GeotechnicalEngineer("233212", "Geotechnical Engineer", "ANZSCO"),

            /// The quantity surveyor
    QuantitySurveyor("233213", "Quantity Surveyor", "ANZSCO"),

            /// The structural engineer
    StructuralEngineer("233214", "Structural Engineer", "ANZSCO"),

            /// The transport engineer
    TransportEngineer("233215", "Transport Engineer", "ANZSCO"),

            /// The electrical engineer
    ElectricalEngineer("233311", "Electrical Engineer", "ANZSCO"),

            /// The electronics engineer
    ElectronicsEngineer("233411", "Electronics Engineer", "ANZSCO"),

            /// The industrial mechanicaland production engineersnfd
    IndustrialMechanicalandProductionEngineersnfd("233500", "Industrial, Mechanical and Production Engineers nfd", "ANZSCO"),

            /// The industrial engineer
    IndustrialEngineer("233511", "Industrial Engineer", "ANZSCO"),

            /// The mechanical engineer
    MechanicalEngineer("233512", "Mechanical Engineer", "ANZSCO"),

            /// The productionor plant engineer
    ProductionorPlantEngineer("233513", "Production or Plant Engineer", "ANZSCO"),

            /// The mining engineersnfd
    MiningEngineersnfd("233600", "Mining Engineers nfd", "ANZSCO"),

            /// The mining engineerexcluding petroleum
    MiningEngineerexcludingPetroleum("233611", "Mining Engineer (excluding Petroleum)", "ANZSCO"),

            /// The petroleum engineer
    PetroleumEngineer("233612", "Petroleum Engineer", "ANZSCO"),

            /// The other engineering professionalsnfd
    OtherEngineeringProfessionalsnfd("233900", "Other Engineering Professionals nfd", "ANZSCO"),

            /// The aeronautical engineer
    AeronauticalEngineer("233911", "Aeronautical Engineer", "ANZSCO"),

            /// The agricultural engineer
    AgriculturalEngineer("233912", "Agricultural Engineer", "ANZSCO"),

            /// The biomedical engineer
    BiomedicalEngineer("233913", "Biomedical Engineer", "ANZSCO"),

            /// The engineering technologist
    EngineeringTechnologist("233914", "Engineering Technologist", "ANZSCO"),

            /// The environmental engineer
    EnvironmentalEngineer("233915", "Environmental Engineer", "ANZSCO"),

            /// The naval architect
    NavalArchitect("233916", "Naval Architect", "ANZSCO"),

            /// The engineering professionalsnec
    EngineeringProfessionalsnec("233999", "Engineering Professionals nec", "ANZSCO"),

            /// The naturaland physical science professionalsnfd
    NaturalandPhysicalScienceProfessionalsnfd("234000", "Natural and Physical Science Professionals nfd", "ANZSCO"),

            /// The agriculturaland forestry scientistsnfd
    AgriculturalandForestryScientistsnfd("234100", "Agricultural and Forestry Scientists nfd", "ANZSCO"),

            /// The agricultural consultant
    AgriculturalConsultant("234111", "Agricultural Consultant", "ANZSCO"),

            /// The agricultural scientist
    AgriculturalScientist("234112", "Agricultural Scientist", "ANZSCO"),

            /// The forester
    Forester("234113", "Forester", "ANZSCO"),

            /// The chemistsand foodand wine scientistsnfd
    ChemistsandFoodandWineScientistsnfd("234200", "Chemists, and Food and Wine Scientists nfd", "ANZSCO"),

            /// The chemist
    Chemist("234211", "Chemist", "ANZSCO"),

            /// The food technologist
    FoodTechnologist("234212", "Food Technologist", "ANZSCO"),

            /// The wine maker
    WineMaker("234213", "Wine Maker", "ANZSCO"),

            /// The environmental scientistsnfd
    EnvironmentalScientistsnfd("234300", "Environmental Scientists nfd", "ANZSCO"),

            /// The conservation officer
    ConservationOfficer("234311", "Conservation Officer", "ANZSCO"),

            /// The environmental consultant
    EnvironmentalConsultant("234312", "Environmental Consultant", "ANZSCO"),

            /// The environmental research scientist
    EnvironmentalResearchScientist("234313", "Environmental Research Scientist", "ANZSCO"),

            /// The park ranger
    ParkRanger("234314", "Park Ranger", "ANZSCO"),

            /// The environmental scientistsnec
    EnvironmentalScientistsnec("234399", "Environmental Scientists nec", "ANZSCO"),

            /// The geologistsand geophysicistsnfd
    GeologistsandGeophysicistsnfd("234400", "Geologists and Geophysicists nfd", "ANZSCO"),

            /// The geologist
    Geologist("234411", "Geologist", "ANZSCO"),

            /// The geophysicist
    Geophysicist("234412", "Geophysicist", "ANZSCO"),

            /// The life scientistsnfd
    LifeScientistsnfd("234500", "Life Scientists nfd", "ANZSCO"),

            /// The life scientist general
    LifeScientistGeneral("234511", "Life Scientist (General)", "ANZSCO"),

            /// The anatomistor physiologist
    AnatomistorPhysiologist("234512", "Anatomist or Physiologist", "ANZSCO"),

            /// The biochemist
    Biochemist("234513", "Biochemist", "ANZSCO"),

            /// The biotechnologist
    Biotechnologist("234514", "Biotechnologist", "ANZSCO"),

            /// The botanist
    Botanist("234515", "Botanist", "ANZSCO"),

            /// The marine biologist
    MarineBiologist("234516", "Marine Biologist", "ANZSCO"),

            /// The microbiologist
    Microbiologist("234517", "Microbiologist", "ANZSCO"),

            /// The zoologist
    Zoologist("234518", "Zoologist", "ANZSCO"),

            /// The life scientistsnec
    LifeScientistsnec("234599", "Life Scientists nec", "ANZSCO"),

            /// The medical laboratory scientist
    MedicalLaboratoryScientist("234611", "Medical Laboratory Scientist", "ANZSCO"),

            /// The veterinarian
    Veterinarian("234711", "Veterinarian", "ANZSCO"),

            /// The other naturaland physical science professionalsnfd
    OtherNaturalandPhysicalScienceProfessionalsnfd("234900", "Other Natural and Physical Science Professionals nfd", "ANZSCO"),

            /// The conservator
    Conservator("234911", "Conservator", "ANZSCO"),

            /// The metallurgist
    Metallurgist("234912", "Metallurgist", "ANZSCO"),

            /// The meteorologist
    Meteorologist("234913", "Meteorologist", "ANZSCO"),

            /// The physicist
    Physicist("234914", "Physicist", "ANZSCO"),

            /// The naturaland physical science professionalsnec
    NaturalandPhysicalScienceProfessionalsnec("234999", "Natural and Physical Science Professionals nec", "ANZSCO"),

            /// The education professionalsnfd
    EducationProfessionalsnfd("240000", "Education Professionals nfd", "ANZSCO"),

            /// The school teachersnfd
    SchoolTeachersnfd("241000", "School Teachers nfd", "ANZSCO"),

            /// The early childhood preprimary school teacher
    EarlyChildhoodPreprimarySchoolTeacher("241111", "Early Childhood (Pre-primary School) Teacher", "ANZSCO"),

            /// The primary school teacher
    PrimarySchoolTeacher("241213", "Primary School Teacher", "ANZSCO"),

            /// The middle school teacher
    MiddleSchoolTeacher("241311", "Middle School Teacher", "ANZSCO"),

            /// The secondary school teacher
    SecondarySchoolTeacher("241411", "Secondary School Teacher", "ANZSCO"),

            /// The special education teachersnfd
    SpecialEducationTeachersnfd("241500", "Special Education Teachers nfd", "ANZSCO"),

            /// The special needs teacher
    SpecialNeedsTeacher("241511", "Special Needs Teacher", "ANZSCO"),

            /// The teacherofthe hearing impaired
    TeacheroftheHearingImpaired("241512", "Teacher of the Hearing Impaired", "ANZSCO"),

            /// The teacherofthe sight impaired
    TeacheroftheSightImpaired("241513", "Teacher of the Sight Impaired", "ANZSCO"),

            /// The special education teachersnec
    SpecialEducationTeachersnec("241599", "Special Education Teachers nec", "ANZSCO"),

            /// The tertiary education teachersnfd
    TertiaryEducationTeachersnfd("242000", "Tertiary Education Teachers nfd", "ANZSCO"),

            /// The university lecturersand tutorsnfd
    UniversityLecturersandTutorsnfd("242100", "University Lecturers and Tutors nfd", "ANZSCO"),

            /// The university lecturer
    UniversityLecturer("242111", "University Lecturer", "ANZSCO"),

            /// The university tutor
    UniversityTutor("242112", "University Tutor", "ANZSCO"),

            /// The vocational education teacher
    VocationalEducationTeacher("242211", "Vocational Education Teacher", "ANZSCO"),

            /// The miscellaneous education professionalsnfd
    MiscellaneousEducationProfessionalsnfd("249000", "Miscellaneous Education Professionals nfd", "ANZSCO"),

            /// The education advisersand reviewersnfd
    EducationAdvisersandReviewersnfd("249100", "Education Advisers and Reviewers nfd", "ANZSCO"),

            /// The education adviser
    EducationAdviser("249111", "Education Adviser", "ANZSCO"),

            /// The education reviewer
    EducationReviewer("249112", "Education Reviewer", "ANZSCO"),

            /// The private tutorsand teachersnfd
    PrivateTutorsandTeachersnfd("249200", "Private Tutors and Teachers nfd", "ANZSCO"),

            /// The art teacher private tuition
    ArtTeacherPrivateTuition("249211", "Art Teacher (Private Tuition)", "ANZSCO"),

            /// The dance teacher private tuition
    DanceTeacherPrivateTuition("249212", "Dance Teacher (Private Tuition)", "ANZSCO"),

            /// The drama teacher private tuition
    DramaTeacherPrivateTuition("249213", "Drama Teacher (Private Tuition)", "ANZSCO"),

            /// The music teacher private tuition
    MusicTeacherPrivateTuition("249214", "Music Teacher (Private Tuition)", "ANZSCO"),

            /// The private tutorsand teachersnec
    PrivateTutorsandTeachersnec("249299", "Private Tutors and Teachers nec", "ANZSCO"),

            /// The teacherof englishto speakersof other languages
    TeacherofEnglishtoSpeakersofOtherLanguages("249311", "Teacher of English to Speakers of Other Languages", "ANZSCO"),

            /// The health professionalsnfd
    HealthProfessionalsnfd("250000", "Health Professionals nfd", "ANZSCO"),

            /// The health diagnosticand promotion professionalsnfd
    HealthDiagnosticandPromotionProfessionalsnfd("251000", "Health Diagnostic and Promotion Professionals nfd", "ANZSCO"),

            /// The dietitian
    Dietitian("251111", "Dietitian", "ANZSCO"),

            /// The medical imaging professionalsnfd
    MedicalImagingProfessionalsnfd("251200", "Medical Imaging Professionals nfd", "ANZSCO"),

            /// The medical diagnostic radiographer
    MedicalDiagnosticRadiographer("251211", "Medical Diagnostic Radiographer", "ANZSCO"),

            /// The medical radiation therapist
    MedicalRadiationTherapist("251212", "Medical Radiation Therapist", "ANZSCO"),

            /// The nuclear medicine technologist

    NuclearMedicineTechnologist("251213", "Nuclear Medicine Technologist", "ANZSCO"),

            /// The sonographer

    Sonographer("251214", "Sonographer", "ANZSCO"),

            /// The occupationaland environmental health professionalsnfd

    OccupationalandEnvironmentalHealthProfessionalsnfd("251300", "Occupational and Environmental Health Professionals nfd", "ANZSCO"),

            /// The environmental health officer

    EnvironmentalHealthOfficer("251311", "Environmental Health Officer", "ANZSCO"),

            /// The occupational healthand safety adviser

    OccupationalHealthandSafetyAdviser("251312", "Occupational Health and Safety Adviser", "ANZSCO"),

            /// The optometristsand orthoptistsnfd

    OptometristsandOrthoptistsnfd("251400", "Optometrists and Orthoptists nfd", "ANZSCO"),

            /// The optometrist

    Optometrist("251411", "Optometrist", "ANZSCO"),

            /// The orthoptist

    Orthoptist("251412", "Orthoptist", "ANZSCO"),

            /// The pharmacists

    Pharmacists("2515", "Pharmacists", "ANZSCO"),

            /// The pharmacistsnfd

    Pharmacistsnfd("251500", "Pharmacists nfd", "ANZSCO"),

            /// The hospital pharmacist

    HospitalPharmacist("251511", "Hospital Pharmacist", "ANZSCO"),

            /// The industrial pharmacist

    IndustrialPharmacist("251512", "Industrial Pharmacist", "ANZSCO"),

            /// The retail pharmacist

    RetailPharmacist("251513", "Retail Pharmacist", "ANZSCO"),

            /// The other health diagnosticand promotion professionalsnfd

    OtherHealthDiagnosticandPromotionProfessionalsnfd("251900", "Other Health Diagnostic and Promotion Professionals nfd", "ANZSCO"),

            /// The health promotion officer

    HealthPromotionOfficer("251911", "Health Promotion Officer", "ANZSCO"),

            /// The orthotistor prosthetist

    OrthotistorProsthetist("251912", "Orthotist or Prosthetist", "ANZSCO"),

            /// The health diagnosticand promotion professionalsnec

    HealthDiagnosticandPromotionProfessionalsnec("251999", "Health Diagnostic and Promotion Professionals nec", "ANZSCO"),

            /// The health therapy professionalsnfd

    HealthTherapyProfessionalsnfd("252000", "Health Therapy Professionals nfd", "ANZSCO"),

            /// The chiropractorsand osteopathsnfd

    ChiropractorsandOsteopathsnfd("252100", "Chiropractors and Osteopaths nfd", "ANZSCO"),

            /// The chiropractor

    Chiropractor("252111", "Chiropractor", "ANZSCO"),

            /// The osteopath

    Osteopath("252112", "Osteopath", "ANZSCO"),

            /// The complementary health therapistsnfd

    ComplementaryHealthTherapistsnfd("252200", "Complementary Health Therapists nfd", "ANZSCO"),

            /// The acupuncturist

    Acupuncturist("252211", "Acupuncturist", "ANZSCO"),

            /// The homoeopath

    Homoeopath("252212", "Homoeopath", "ANZSCO"),

            /// The naturopath

    Naturopath("252213", "Naturopath", "ANZSCO"),

            /// The traditional chinese medicine practitioner

    TraditionalChineseMedicinePractitioner("252214", "Traditional Chinese Medicine Practitioner", "ANZSCO"),

            /// The complementary health therapistsnec

    ComplementaryHealthTherapistsnec("252299", "Complementary Health Therapists nec", "ANZSCO"),

            /// The dental practitionersnfd

    DentalPractitionersnfd("252300", "Dental Practitioners nfd", "ANZSCO"),

            /// The dental specialist

    DentalSpecialist("252311", "Dental Specialist", "ANZSCO"),

            /// The dentist

    Dentist("252312", "Dentist", "ANZSCO"),

            /// The occupational therapist

    OccupationalTherapist("252411", "Occupational Therapist", "ANZSCO"),

            /// The physiotherapist

    Physiotherapist("252511", "Physiotherapist", "ANZSCO"),

            /// The podiatrist

    Podiatrist("252611", "Podiatrist", "ANZSCO"),

            /// The speech professionalsand audiologistsnfd

    SpeechProfessionalsandAudiologistsnfd("252700", "Speech Professionals and Audiologists nfd", "ANZSCO"),

            /// The audiologist

    Audiologist("252711", "Audiologist", "ANZSCO"),

            /// The speech pathologist

    SpeechPathologist("252712", "Speech Pathologist", "ANZSCO"),

            /// The medical practitionersnfd

    MedicalPractitionersnfd("253000", "Medical Practitioners nfd", "ANZSCO"),

            /// The generalist medical practitionersnfd

    GeneralistMedicalPractitionersnfd("253100", "Generalist Medical Practitioners nfd", "ANZSCO"),

            /// The general medical practitioner

    GeneralMedicalPractitioner("253111", "General Medical Practitioner", "ANZSCO"),

            /// The resident medical officer

    ResidentMedicalOfficer("253112", "Resident Medical Officer", "ANZSCO"),

            /// The anaesthetist

    Anaesthetist("253211", "Anaesthetist", "ANZSCO"),

            /// The specialist physiciansnfd

    SpecialistPhysiciansnfd("253300", "Specialist Physicians nfd", "ANZSCO"),

            /// The specialist physician general medicine

    SpecialistPhysicianGeneralMedicine("253311", "Specialist Physician (General Medicine)", "ANZSCO"),

            /// The cardiologist

    Cardiologist("253312", "Cardiologist", "ANZSCO"),

            /// The clinical haematologist

    ClinicalHaematologist("253313", "Clinical Haematologist", "ANZSCO"),

            /// The medical oncologist

    MedicalOncologist("253314", "Medical Oncologist", "ANZSCO"),

            /// The endocrinologist

    Endocrinologist("253315", "Endocrinologist", "ANZSCO"),

            /// The gastroenterologist

    Gastroenterologist("253316", "Gastroenterologist", "ANZSCO"),

            /// The intensive care specialist

    IntensiveCareSpecialist("253317", "Intensive Care Specialist", "ANZSCO"),

            /// The neurologist

    Neurologist("253318", "Neurologist", "ANZSCO"),

            /// The paediatrician

    Paediatrician("253321", "Paediatrician", "ANZSCO"),

            /// The renal medicine specialist

    RenalMedicineSpecialist("253322", "Renal Medicine Specialist", "ANZSCO"),

            /// The rheumatologist

    Rheumatologist("253323", "Rheumatologist", "ANZSCO"),

            /// The thoracic medicine specialist

    ThoracicMedicineSpecialist("253324", "Thoracic Medicine Specialist", "ANZSCO"),

            /// The specialist physiciansnec

    SpecialistPhysiciansnec("253399", "Specialist Physicians nec", "ANZSCO"),

            /// The psychiatrist

    Psychiatrist("253411", "Psychiatrist", "ANZSCO"),

            /// The surgeonsnfd

    Surgeonsnfd("253500", "Surgeons nfd", "ANZSCO"),

            /// The surgeon general

    SurgeonGeneral("253511", "Surgeon (General)", "ANZSCO"),

            /// The cardiothoracic surgeon

    CardiothoracicSurgeon("253512", "Cardiothoracic Surgeon", "ANZSCO"),

            /// The neurosurgeon

    Neurosurgeon("253513", "Neurosurgeon", "ANZSCO"),

            /// The orthopaedic surgeon

    OrthopaedicSurgeon("253514", "Orthopaedic Surgeon", "ANZSCO"),

            /// The otorhinolaryngologist

    Otorhinolaryngologist("253515", "Otorhinolaryngologist", "ANZSCO"),

            /// The paediatric surgeon

    PaediatricSurgeon("253516", "Paediatric Surgeon", "ANZSCO"),

            /// The plasticand reconstructive surgeon

    PlasticandReconstructiveSurgeon("253517", "Plastic and Reconstructive Surgeon", "ANZSCO"),

            /// The urologist

    Urologist("253518", "Urologist", "ANZSCO"),

            /// The vascular surgeon

    VascularSurgeon("253521", "Vascular Surgeon", "ANZSCO"),

            /// The other medical practitionersnfd

    OtherMedicalPractitionersnfd("253900", "Other Medical Practitioners nfd", "ANZSCO"),

            /// The dermatologist

    Dermatologist("253911", "Dermatologist", "ANZSCO"),

            /// The emergency medicine specialist

    EmergencyMedicineSpecialist("253912", "Emergency Medicine Specialist", "ANZSCO"),

            /// The obstetricianand gynaecologist

    ObstetricianandGynaecologist("253913", "Obstetrician and Gynaecologist", "ANZSCO"),

            /// The ophthalmologist

    Ophthalmologist("253914", "Ophthalmologist", "ANZSCO"),

            /// The pathologist

    Pathologist("253915", "Pathologist", "ANZSCO"),

            /// The diagnosticand interventional radiologist

    DiagnosticandInterventionalRadiologist("253917", "Diagnostic and Interventional Radiologist", "ANZSCO"),

            /// The radiation oncologist

    RadiationOncologist("253918", "Radiation Oncologist", "ANZSCO"),

            /// The medical practitionersnec

    MedicalPractitionersnec("253999", "Medical Practitioners nec", "ANZSCO"),

            /// The midwiferyand nursing professionalsnfd

    MidwiferyandNursingProfessionalsnfd("254000", "Midwifery and Nursing Professionals nfd", "ANZSCO"),

            /// The midwife

    Midwife("254111", "Midwife", "ANZSCO"),

            /// The nurse educatorsand researchersnfd

    NurseEducatorsandResearchersnfd("254200", "Nurse Educators and Researchers nfd", "ANZSCO"),

            /// The nurse educator

    NurseEducator("254211", "Nurse Educator", "ANZSCO"),

            /// The nurse researcher

    NurseResearcher("254212", "Nurse Researcher", "ANZSCO"),

            /// The nurse manager

    NurseManager("254311", "Nurse Manager", "ANZSCO"),

            /// The registered nursesnfd

    RegisteredNursesnfd("254400", "Registered Nurses nfd", "ANZSCO"),

            /// The nurse practitioner

    NursePractitioner("254411", "Nurse Practitioner", "ANZSCO"),

            /// The registered nurse aged care

    RegisteredNurseAgedCare("254412", "Registered Nurse (Aged Care)", "ANZSCO"),

            /// The registered nurse childand family health

    RegisteredNurseChildandFamilyHealth("254413", "Registered Nurse (Child and Family Health)", "ANZSCO"),

            /// The registered nurse community health

    RegisteredNurseCommunityHealth("254414", "Registered Nurse (Community Health)", "ANZSCO"),

            /// The registered nurse critical careand emergency

    RegisteredNurseCriticalCareandEmergency("254415", "Registered Nurse (Critical Care and Emergency)", "ANZSCO"),

            /// The registered nurse developmental disability

    RegisteredNurseDevelopmentalDisability("254416", "Registered Nurse (Developmental Disability)", "ANZSCO"),

            /// The registered nurse disabilityand rehabilitation

    RegisteredNurseDisabilityandRehabilitation("254417", "Registered Nurse (Disability and Rehabilitation)", "ANZSCO"),

            /// The registered nurse medical

    RegisteredNurseMedical("254418", "Registered Nurse (Medical)", "ANZSCO"),

            /// The registered nurse medical practice

    RegisteredNurseMedicalPractice("254421", "Registered Nurse (Medical Practice)", "ANZSCO"),

            /// The registered nurse mental health

    RegisteredNurseMentalHealth("254422", "Registered Nurse (Mental Health)", "ANZSCO"),

            /// The registered nurse perioperative

    RegisteredNursePerioperative("254423", "Registered Nurse (Perioperative)", "ANZSCO"),

            /// The registered nurse surgical

    RegisteredNurseSurgical("254424", "Registered Nurse (Surgical)", "ANZSCO"),

            /// The registered nursesnec

    RegisteredNursesnec("254499", "Registered Nurses nec", "ANZSCO"),

            /// The ICT professionalsnfd

    ICTProfessionalsnfd("260000", "ICT Professionals nfd", "ANZSCO"),

            /// The businessand systems analystsand programmersnfd

    BusinessandSystemsAnalystsandProgrammersnfd("261000", "Business and Systems Analysts, and Programmers nfd", "ANZSCO"),

            /// The ICT businessand systems analystsnfd

    ICTBusinessandSystemsAnalystsnfd("261100", "ICT Business and Systems Analysts nfd", "ANZSCO"),

            /// The ICT business analyst

    ICTBusinessAnalyst("261111", "ICT Business Analyst", "ANZSCO"),

            /// The systems analyst

    SystemsAnalyst("261112", "Systems Analyst", "ANZSCO"),

            /// The multimedia specialistsand web developersnfd

    MultimediaSpecialistsandWebDevelopersnfd("261200", "Multimedia Specialists and Web Developers nfd", "ANZSCO"),

            /// The multimedia specialist

    MultimediaSpecialist("261211", "Multimedia Specialist", "ANZSCO"),

            /// The web developer

    WebDeveloper("261212", "Web Developer", "ANZSCO"),

            /// The softwareand applications programmersnfd

    SoftwareandApplicationsProgrammersnfd("261300", "Software and Applications Programmers nfd", "ANZSCO"),

            /// The analyst programmer

    AnalystProgrammer("261311", "Analyst Programmer", "ANZSCO"),

            /// The developer programmer

    DeveloperProgrammer("261312", "Developer Programmer", "ANZSCO"),

            /// The software engineer

    SoftwareEngineer("261313", "Software Engineer", "ANZSCO"),

            /// The software tester

    SoftwareTester("261314", "Software Tester", "ANZSCO"),

            /// The softwareand applications programmersnec

    SoftwareandApplicationsProgrammersnec("261399", "Software and Applications Programmers nec", "ANZSCO"),

            /// The databaseand systems administratorsand ICT security specialistsnfd

    DatabaseandSystemsAdministratorsandICTSecuritySpecialistsnfd("262100", "Database and Systems Administrators, and ICT Security Specialists nfd", "ANZSCO"),

            /// The database administrator

    DatabaseAdministrator("262111", "Database Administrator", "ANZSCO"),

            /// The ICT security specialist

    ICTSecuritySpecialist("262112", "ICT Security Specialist", "ANZSCO"),

            /// The systems administrator

    SystemsAdministrator("262113", "Systems Administrator", "ANZSCO"),

            /// The ICT networkand support professionalsnfd

    ICTNetworkandSupportProfessionalsnfd("263000", "ICT Network and Support Professionals nfd", "ANZSCO"),

            /// The computer network professionalsnfd

    ComputerNetworkProfessionalsnfd("263100", "Computer Network Professionals nfd", "ANZSCO"),

            /// The computer networkand systems engineer

    ComputerNetworkandSystemsEngineer("263111", "Computer Network and Systems Engineer", "ANZSCO"),

            /// The network administrator

    NetworkAdministrator("263112", "Network Administrator", "ANZSCO"),

            /// The network analyst

    NetworkAnalyst("263113", "Network Analyst", "ANZSCO"),

            /// The ICT supportand test engineersnfd

    ICTSupportandTestEngineersnfd("263200", "ICT Support and Test Engineers nfd", "ANZSCO"),

            /// The ICT quality assurance engineer

    ICTQualityAssuranceEngineer("263211", "ICT Quality Assurance Engineer", "ANZSCO"),

            /// The ICT support engineer

    ICTSupportEngineer("263212", "ICT Support Engineer", "ANZSCO"),

            /// The ICT systems test engineer

    ICTSystemsTestEngineer("263213", "ICT Systems Test Engineer", "ANZSCO"),

            /// The ICT supportand test engineersnec

    ICTSupportandTestEngineersnec("263299", "ICT Support and Test Engineers nec", "ANZSCO"),

            /// The telecommunications engineering professionalsnfd

    TelecommunicationsEngineeringProfessionalsnfd("263300", "Telecommunications Engineering Professionals nfd", "ANZSCO"),

            /// The telecommunications engineer

    TelecommunicationsEngineer("263311", "Telecommunications Engineer", "ANZSCO"),

            /// The telecommunications network engineer

    TelecommunicationsNetworkEngineer("263312", "Telecommunications Network Engineer", "ANZSCO"),

            /// The legal socialand welfare professionalsnfd

    LegalSocialandWelfareProfessionalsnfd("270000", "Legal, Social and Welfare Professionals nfd", "ANZSCO"),

            /// The legal professionalsnfd

    LegalProfessionalsnfd("271000", "Legal Professionals nfd", "ANZSCO"),

            /// The barrister

    Barrister("271111", "Barrister", "ANZSCO"),

            /// The judicialand other legal professionalsnfd

    JudicialandOtherLegalProfessionalsnfd("271200", "Judicial and Other Legal Professionals nfd", "ANZSCO"),

            /// The judge

    Judge("271211", "Judge", "ANZSCO"),

            /// The magistrate

    Magistrate("271212", "Magistrate", "ANZSCO"),

            /// The tribunal member

    TribunalMember("271213", "Tribunal Member", "ANZSCO"),

            /// The judicialand other legal professionalsnec

    JudicialandOtherLegalProfessionalsnec("271299", "Judicial and Other Legal Professionals nec", "ANZSCO"),

            /// The solicitor

    Solicitor("271311", "Solicitor", "ANZSCO"),

            /// The socialand welfare professionalsnfd

    SocialandWelfareProfessionalsnfd("272000", "Social and Welfare Professionals nfd", "ANZSCO"),

            /// The counsellorsnfd

    Counsellorsnfd("272100", "Counsellors nfd", "ANZSCO"),

            /// The careers counsellor

    CareersCounsellor("272111", "Careers Counsellor", "ANZSCO"),

            /// The drugand alcohol counsellor

    DrugandAlcoholCounsellor("272112", "Drug and Alcohol Counsellor", "ANZSCO"),

            /// The familyand marriage counsellor

    FamilyandMarriageCounsellor("272113", "Family and Marriage Counsellor", "ANZSCO"),

            /// The rehabilitation counsellor

    RehabilitationCounsellor("272114", "Rehabilitation Counsellor", "ANZSCO"),

            /// The student counsellor

    StudentCounsellor("272115", "Student Counsellor", "ANZSCO"),

            /// The counsellorsnec

    Counsellorsnec("272199", "Counsellors nec", "ANZSCO"),

            /// The ministerof religion

    MinisterofReligion("272211", "Minister of Religion", "ANZSCO"),

            /// The psychologistsnfd

    Psychologistsnfd("272300", "Psychologists nfd", "ANZSCO"),

            /// The clinical psychologist

    ClinicalPsychologist("272311", "Clinical Psychologist", "ANZSCO"),

            /// The educational psychologist

    EducationalPsychologist("272312", "Educational Psychologist", "ANZSCO"),

            /// The organisational psychologist

    OrganisationalPsychologist("272313", "Organisational Psychologist", "ANZSCO"),

            /// The psychotherapist

    Psychotherapist("272314", "Psychotherapist", "ANZSCO"),

            /// The psychologistsnec

    Psychologistsnec("272399", "Psychologists nec", "ANZSCO"),

            /// The social professionalsnfd

    SocialProfessionalsnfd("272400", "Social Professionals nfd", "ANZSCO"),

            /// The historian

    Historian("272411", "Historian", "ANZSCO"),

            /// The interpreter

    Interpreter("272412", "Interpreter", "ANZSCO"),

            /// The translator

    Translator("272413", "Translator", "ANZSCO"),

            /// The social professionalsnec

    SocialProfessionalsnec("272499", "Social Professionals nec", "ANZSCO"),

            /// The social worker

    SocialWorker("272511", "Social Worker", "ANZSCO"),

            /// The welfare recreationand community arts workersnfd

    WelfareRecreationandCommunityArtsWorkersnfd("272600", "Welfare, Recreation and Community Arts Workers nfd", "ANZSCO"),

            /// The community arts worker

    CommunityArtsWorker("272611", "Community Arts Worker", "ANZSCO"),

            /// The recreation officer

    RecreationOfficer("272612", "Recreation Officer", "ANZSCO"),

            /// The welfare worker

    WelfareWorker("272613", "Welfare Worker", "ANZSCO"),

            /// The techniciansand trades workersnfd

    TechniciansandTradesWorkersnfd("300000", "Technicians and Trades Workers nfd", "ANZSCO"),

            /// The engineering IC tand science techniciansnfd

    EngineeringICTandScienceTechniciansnfd("310000", "Engineering, ICT and Science Technicians nfd", "ANZSCO"),

            /// The agricultural medicaland science techniciansnfd

    AgriculturalMedicalandScienceTechniciansnfd("311000", "Agricultural, Medical and Science Technicians nfd", "ANZSCO"),

            /// The agricultural technician

    AgriculturalTechnician("311111", "Agricultural Technician", "ANZSCO"),

            /// The medical techniciansnfd

    MedicalTechniciansnfd("311200", "Medical Technicians nfd", "ANZSCO"),

            /// The anaesthetic technician

    AnaestheticTechnician("311211", "Anaesthetic Technician", "ANZSCO"),

            /// The cardiac technician

    CardiacTechnician("311212", "Cardiac Technician", "ANZSCO"),

            /// The medical laboratory technician

    MedicalLaboratoryTechnician("311213", "Medical Laboratory Technician", "ANZSCO"),

            /// The operating theatre technician

    OperatingTheatreTechnician("311214", "Operating Theatre Technician", "ANZSCO"),

            /// The pharmacy technician

    PharmacyTechnician("311215", "Pharmacy Technician", "ANZSCO"),

            /// The pathology collector

    PathologyCollector("311216", "Pathology Collector", "ANZSCO"),

            /// The medical techniciansnec

    MedicalTechniciansnec("311299", "Medical Technicians nec", "ANZSCO"),

            /// The primary products inspectorsnfd

    PrimaryProductsInspectorsnfd("311300", "Primary Products Inspectors nfd", "ANZSCO"),

            /// The fisheries officer

    FisheriesOfficer("311311", "Fisheries Officer", "ANZSCO"),

            /// The meat inspector

    MeatInspector("311312", "Meat Inspector", "ANZSCO"),

            /// The quarantine officer

    QuarantineOfficer("311313", "Quarantine Officer", "ANZSCO"),

            /// The primary products inspectorsnec

    PrimaryProductsInspectorsnec("311399", "Primary Products Inspectors nec", "ANZSCO"),

            /// The science techniciansnfd

    ScienceTechniciansnfd("311400", "Science Technicians nfd", "ANZSCO"),

            /// The chemistry technician

    ChemistryTechnician("311411", "Chemistry Technician", "ANZSCO"),

            /// The earth science technician

    EarthScienceTechnician("311412", "Earth Science Technician", "ANZSCO"),

            /// The life science technician

    LifeScienceTechnician("311413", "Life Science Technician", "ANZSCO"),

            /// The school laboratory technician

    SchoolLaboratoryTechnician("311414", "School Laboratory Technician", "ANZSCO"),

            /// The science techniciansnec

    ScienceTechniciansnec("311499", "Science Technicians nec", "ANZSCO"),

            /// The buildingand engineering techniciansnfd

    BuildingandEngineeringTechniciansnfd("312000", "Building and Engineering Technicians nfd", "ANZSCO"),

            /// The architectural buildingand surveying techniciansnfd

    ArchitecturalBuildingandSurveyingTechniciansnfd("312100", "Architectural, Building and Surveying Technicians nfd", "ANZSCO"),

            /// The architectural draftsperson

    ArchitecturalDraftsperson("312111", "Architectural Draftsperson", "ANZSCO"),

            /// The building associate

    BuildingAssociate("312112", "Building Associate", "ANZSCO"),

            /// The building inspector

    BuildingInspector("312113", "Building Inspector", "ANZSCO"),

            /// The construction estimator

    ConstructionEstimator("312114", "Construction Estimator", "ANZSCO"),

            /// The plumbing inspector

    PlumbingInspector("312115", "Plumbing Inspector", "ANZSCO"),

            /// The surveyingor spatial science technician

    SurveyingorSpatialScienceTechnician("312116", "Surveying or Spatial Science Technician", "ANZSCO"),

            /// The architectural buildingand surveying techniciansnec

    ArchitecturalBuildingandSurveyingTechniciansnec("312199", "Architectural, Building and Surveying Technicians nec", "ANZSCO"),

            /// The civil engineering draftspersonsand techniciansnfd

    CivilEngineeringDraftspersonsandTechniciansnfd("312200", "Civil Engineering Draftspersons and Technicians nfd", "ANZSCO"),

            /// The civil engineering draftsperson

    CivilEngineeringDraftsperson("312211", "Civil Engineering Draftsperson", "ANZSCO"),

            /// The civil engineering technician

    CivilEngineeringTechnician("312212", "Civil Engineering Technician", "ANZSCO"),

            /// The electrical engineering draftspersonsand techniciansnfd

    ElectricalEngineeringDraftspersonsandTechniciansnfd("312300", "Electrical Engineering Draftspersons and Technicians nfd", "ANZSCO"),

            /// The electrical engineering draftsperson

    ElectricalEngineeringDraftsperson("312311", "Electrical Engineering Draftsperson", "ANZSCO"),

            /// The electrical engineering technician

    ElectricalEngineeringTechnician("312312", "Electrical Engineering Technician", "ANZSCO"),

            /// The electronic engineering draftspersonsand techniciansnfd

    ElectronicEngineeringDraftspersonsandTechniciansnfd("312400", "Electronic Engineering Draftspersons and Technicians nfd", "ANZSCO"),

            /// The electronic engineering draftsperson

    ElectronicEngineeringDraftsperson("312411", "Electronic Engineering Draftsperson", "ANZSCO"),

            /// The electronic engineering technician

    ElectronicEngineeringTechnician("312412", "Electronic Engineering Technician", "ANZSCO"),

            /// The mechanical engineering draftspersonsand techniciansnfd

    MechanicalEngineeringDraftspersonsandTechniciansnfd("312500", "Mechanical Engineering Draftspersons and Technicians nfd", "ANZSCO"),

            /// The mechanical engineering draftsperson

    MechanicalEngineeringDraftsperson("312511", "Mechanical Engineering Draftsperson", "ANZSCO"),

            /// The mechanical engineering technician

    MechanicalEngineeringTechnician("312512", "Mechanical Engineering Technician", "ANZSCO"),

            /// The safety inspector

    SafetyInspector("312611", "Safety Inspector", "ANZSCO"),

            /// The other buildingand engineering techniciansnfd

    OtherBuildingandEngineeringTechniciansnfd("312900", "Other Building and Engineering Technicians nfd", "ANZSCO"),

            /// The maintenance planner

    MaintenancePlanner("312911", "Maintenance Planner", "ANZSCO"),

            /// The metallurgicalor materials technician

    MetallurgicalorMaterialsTechnician("312912", "Metallurgical or Materials Technician", "ANZSCO"),

            /// The mine deputy

    MineDeputy("312913", "Mine Deputy", "ANZSCO"),

            /// The buildingand engineering techniciansnec

    BuildingandEngineeringTechniciansnec("312999", "Building and Engineering Technicians nec", "ANZSCO"),

            /// The IC tand telecommunications techniciansnfd

    ICTandTelecommunicationsTechniciansnfd("313000", "ICT and Telecommunications Technicians nfd", "ANZSCO"),

            /// The ICT support techniciansnfd

    ICTSupportTechniciansnfd("313100", "ICT Support Technicians nfd", "ANZSCO"),

            /// The hardware technician

    HardwareTechnician("313111", "Hardware Technician", "ANZSCO"),

            /// The ICT customer support officer

    ICTCustomerSupportOfficer("313112", "ICT Customer Support Officer", "ANZSCO"),

            /// The web administrator

    WebAdministrator("313113", "Web Administrator", "ANZSCO"),

            /// The ICT support techniciansnec

    ICTSupportTechniciansnec("313199", "ICT Support Technicians nec", "ANZSCO"),

            /// The telecommunications technical specialistsnfd

    TelecommunicationsTechnicalSpecialistsnfd("313200", "Telecommunications Technical Specialists nfd", "ANZSCO"),

            /// The radiocommunications technician

    RadiocommunicationsTechnician("313211", "Radiocommunications Technician", "ANZSCO"),

            /// The telecommunications field engineer

    TelecommunicationsFieldEngineer("313212", "Telecommunications Field Engineer", "ANZSCO"),

            /// The telecommunications network planner

    TelecommunicationsNetworkPlanner("313213", "Telecommunications Network Planner", "ANZSCO"),

            /// The telecommunications technical officeror technologist

    TelecommunicationsTechnicalOfficerorTechnologist("313214", "Telecommunications Technical Officer or Technologist", "ANZSCO"),

            /// The automotiveand engineering trades workersnfd

    AutomotiveandEngineeringTradesWorkersnfd("320000", "Automotive and Engineering Trades Workers nfd", "ANZSCO"),

            /// The automotive electriciansand mechanicsnfd

    AutomotiveElectriciansandMechanicsnfd("321000", "Automotive Electricians and Mechanics nfd", "ANZSCO"),

            /// The automotive electrician

    AutomotiveElectrician("321111", "Automotive Electrician", "ANZSCO"),

            /// The motor mechanicsnfd

    MotorMechanicsnfd("321200", "Motor Mechanics nfd", "ANZSCO"),

            /// The motor mechanic general

    MotorMechanicGeneral("321211", "Motor Mechanic (General)", "ANZSCO"),

            /// The diesel motor mechanic

    DieselMotorMechanic("321212", "Diesel Motor Mechanic", "ANZSCO"),

            /// The motorcycle mechanic

    MotorcycleMechanic("321213", "Motorcycle Mechanic", "ANZSCO"),

            /// The small engine mechanic

    SmallEngineMechanic("321214", "Small Engine Mechanic", "ANZSCO"),

            /// The fabrication engineering trades workersnfd

    FabricationEngineeringTradesWorkersnfd("322000", "Fabrication Engineering Trades Workers nfd", "ANZSCO"),

            /// The metal casting forgingand finishing trades workersnfd

    MetalCastingForgingandFinishingTradesWorkersnfd("322100", "Metal Casting, Forging and Finishing Trades Workers nfd", "ANZSCO"),

            /// The blacksmith

    Blacksmith("322111", "Blacksmith", "ANZSCO"),

            /// The electroplater

    Electroplater("322112", "Electroplater", "ANZSCO"),

            /// The farrier

    Farrier("322113", "Farrier", "ANZSCO"),

            /// The metal casting trades worker

    MetalCastingTradesWorker("322114", "Metal Casting Trades Worker", "ANZSCO"),

            /// The metal polisher

    MetalPolisher("322115", "Metal Polisher", "ANZSCO"),

            /// The sheetmetal trades worker

    SheetmetalTradesWorker("322211", "Sheetmetal Trades Worker", "ANZSCO"),

            /// The structural steeland welding trades workersnfd

    StructuralSteelandWeldingTradesWorkersnfd("322300", "Structural Steel and Welding Trades Workers nfd", "ANZSCO"),

            /// The metal fabricator

    MetalFabricator("322311", "Metal Fabricator", "ANZSCO"),

            /// The pressure welder

    PressureWelder("322312", "Pressure Welder", "ANZSCO"),

            /// The welder first class

    WelderFirstClass("322313", "Welder (First Class)", "ANZSCO"),

            /// The mechanical engineering trades workersnfd

    MechanicalEngineeringTradesWorkersnfd("323000", "Mechanical Engineering Trades Workers nfd", "ANZSCO"),

            /// The aircraft maintenance engineersnfd

    AircraftMaintenanceEngineersnfd("323100", "Aircraft Maintenance Engineers nfd", "ANZSCO"),

            /// The aircraft maintenance engineer avionics

    AircraftMaintenanceEngineerAvionics("323111", "Aircraft Maintenance Engineer (Avionics)", "ANZSCO"),

            /// The aircraft maintenance engineer mechanical

    AircraftMaintenanceEngineerMechanical("323112", "Aircraft Maintenance Engineer (Mechanical)", "ANZSCO"),

            /// The aircraft maintenance engineer structures

    AircraftMaintenanceEngineerStructures("323113", "Aircraft Maintenance Engineer (Structures)", "ANZSCO"),

            /// The metal fittersand machinistsnfd

    MetalFittersandMachinistsnfd("323200", "Metal Fitters and Machinists nfd", "ANZSCO"),

            /// The fitter general

    FitterGeneral("323211", "Fitter (General)", "ANZSCO"),

            /// The fitterand turner

    FitterandTurner("323212", "Fitter and Turner", "ANZSCO"),

            /// The fitter welder

    FitterWelder("323213", "Fitter-Welder", "ANZSCO"),

            /// The metal machinist first class

    MetalMachinistFirstClass("323214", "Metal Machinist (First Class)", "ANZSCO"),

            /// The textile clothingand footwear mechanic

    TextileClothingandFootwearMechanic("323215", "Textile, Clothing and Footwear Mechanic", "ANZSCO"),

            /// The metal fittersand machinistsnec

    MetalFittersandMachinistsnec("323299", "Metal Fitters and Machinists nec", "ANZSCO"),

            /// The precision metal trades workersnfd

    PrecisionMetalTradesWorkersnfd("323300", "Precision Metal Trades Workers nfd", "ANZSCO"),

            /// The engraver

    Engraver("323311", "Engraver", "ANZSCO"),

            /// The gunsmith

    Gunsmith("323312", "Gunsmith", "ANZSCO"),

            /// The locksmith

    Locksmith("323313", "Locksmith", "ANZSCO"),

            /// The precision instrument makerand repairer

    PrecisionInstrumentMakerandRepairer("323314", "Precision Instrument Maker and Repairer", "ANZSCO"),

            /// The saw makerand repairer

    SawMakerandRepairer("323315", "Saw Maker and Repairer", "ANZSCO"),

            /// The watchand clock makerand repairer

    WatchandClockMakerandRepairer("323316", "Watch and Clock Maker and Repairer", "ANZSCO"),

            /// The toolmakersand engineering patternmakersnfd

    ToolmakersandEngineeringPatternmakersnfd("323400", "Toolmakers and Engineering Patternmakers nfd", "ANZSCO"),

            /// The engineering patternmaker

    EngineeringPatternmaker("323411", "Engineering Patternmaker", "ANZSCO"),

            /// The toolmaker

    Toolmaker("323412", "Toolmaker", "ANZSCO"),

            /// The panelbeatersand vehicle body builders trimmersand paintersnfd

    PanelbeatersandVehicleBodyBuildersTrimmersandPaintersnfd("324000", "Panelbeaters, and Vehicle Body Builders, Trimmers and Painters nfd", "ANZSCO"),

            /// The panelbeater

    Panelbeater("324111", "Panelbeater", "ANZSCO"),

            /// The vehicle body buildersand trimmersnfd

    VehicleBodyBuildersandTrimmersnfd("324200", "Vehicle Body Builders and Trimmers nfd", "ANZSCO"),

            /// The vehicle body builder

    VehicleBodyBuilder("324211", "Vehicle Body Builder", "ANZSCO"),

            /// The vehicle trimmer

    VehicleTrimmer("324212", "Vehicle Trimmer", "ANZSCO"),

            /// The vehicle painter

    VehiclePainter("324311", "Vehicle Painter", "ANZSCO"),

            /// The construction trades workersnfd

    ConstructionTradesWorkersnfd("330000", "Construction Trades Workers nfd", "ANZSCO"),

            /// The bricklayersand carpentersand joinersnfd

    BricklayersandCarpentersandJoinersnfd("331000", "Bricklayers, and Carpenters and Joiners nfd", "ANZSCO"),

            /// The bricklayersand stonemasonsnfd

    BricklayersandStonemasonsnfd("331100", "Bricklayers and Stonemasons nfd", "ANZSCO"),

            /// The bricklayer

    Bricklayer("331111", "Bricklayer", "ANZSCO"),

            /// The stonemason

    Stonemason("331112", "Stonemason", "ANZSCO"),

            /// The carpenterand joiner

    CarpenterandJoiner("331211", "Carpenter and Joiner", "ANZSCO"),

            /// The carpenter

    Carpenter("331212", "Carpenter", "ANZSCO"),

            /// The joiner

    Joiner("331213", "Joiner", "ANZSCO"),

            /// The floor finishersand painting trades workersnfd

    FloorFinishersandPaintingTradesWorkersnfd("332000", "Floor Finishers and Painting Trades Workers nfd", "ANZSCO"),

            /// The floor finisher

    FloorFinisher("332111", "Floor Finisher", "ANZSCO"),

            /// The painting trades worker

    PaintingTradesWorker("332211", "Painting Trades Worker", "ANZSCO"),

            /// The glaziers plasterersand tilersnfd

    GlaziersPlasterersandTilersnfd("333000", "Glaziers, Plasterers and Tilers nfd", "ANZSCO"),

            /// The glazier

    Glazier("333111", "Glazier", "ANZSCO"),

            /// The plasterersnfd

    Plasterersnfd("333200", "Plasterers nfd", "ANZSCO"),

            /// The fibrous plasterer

    FibrousPlasterer("333211", "Fibrous Plasterer", "ANZSCO"),

            /// The solid plasterer

    SolidPlasterer("333212", "Solid Plasterer", "ANZSCO"),

            /// The roof tiler

    RoofTiler("333311", "Roof Tiler", "ANZSCO"),

            /// The walland floor tiler

    WallandFloorTiler("333411", "Wall and Floor Tiler", "ANZSCO"),

            /// The plumbersnfd

    Plumbersnfd("334100", "Plumbers nfd", "ANZSCO"),

            /// The plumber general

    PlumberGeneral("334111", "Plumber (General)", "ANZSCO"),

            /// The airconditioningand mechanical services plumber

    AirconditioningandMechanicalServicesPlumber("334112", "Airconditioning and Mechanical Services Plumber", "ANZSCO"),

            /// The drainer

    Drainer("334113", "Drainer", "ANZSCO"),

            /// The gasfitter

    Gasfitter("334114", "Gasfitter", "ANZSCO"),

            /// The roof plumber

    RoofPlumber("334115", "Roof Plumber", "ANZSCO"),

            /// The electrotechnologyand telecommunications trades workersnfd

    ElectrotechnologyandTelecommunicationsTradesWorkersnfd("340000", "Electrotechnology and Telecommunications Trades Workers nfd", "ANZSCO"),

            /// The electriciansnfd

    Electriciansnfd("341100", "Electricians nfd", "ANZSCO"),

            /// The electrician general

    ElectricianGeneral("341111", "Electrician (General)", "ANZSCO"),

            /// The electrician special class

    ElectricianSpecialClass("341112", "Electrician (Special Class)", "ANZSCO"),

            /// The lift mechanic

    LiftMechanic("341113", "Lift Mechanic", "ANZSCO"),

            /// The electronicsand telecommunications trades workersnfd

    ElectronicsandTelecommunicationsTradesWorkersnfd("342000", "Electronics and Telecommunications Trades Workers nfd", "ANZSCO"),

            /// The airconditioningand refrigeration mechanic

    AirconditioningandRefrigerationMechanic("342111", "Airconditioning and Refrigeration Mechanic", "ANZSCO"),

            /// The electrical distribution trades workersnfd

    ElectricalDistributionTradesWorkersnfd("342200", "Electrical Distribution Trades Workers nfd", "ANZSCO"),

            /// The electrical linesworker

    ElectricalLinesworker("342211", "Electrical Linesworker", "ANZSCO"),

            /// The technical cable jointer

    TechnicalCableJointer("342212", "Technical Cable Jointer", "ANZSCO"),

            /// The electronics trades workersnfd

    ElectronicsTradesWorkersnfd("342300", "Electronics Trades Workers nfd", "ANZSCO"),

            /// The business machine mechanic

    BusinessMachineMechanic("342311", "Business Machine Mechanic", "ANZSCO"),

            /// The communications operator

    CommunicationsOperator("342312", "Communications Operator", "ANZSCO"),

            /// The electronic equipment trades worker

    ElectronicEquipmentTradesWorker("342313", "Electronic Equipment Trades Worker", "ANZSCO"),

            /// The electronic instrument trades worker general

    ElectronicInstrumentTradesWorkerGeneral("342314", "Electronic Instrument Trades Worker (General)", "ANZSCO"),

            /// The electronic instrument trades worker special class

    ElectronicInstrumentTradesWorkerSpecialClass("342315", "Electronic Instrument Trades Worker (Special Class)", "ANZSCO"),

            /// The telecommunications trades workersnfd

    TelecommunicationsTradesWorkersnfd("342400", "Telecommunications Trades Workers nfd", "ANZSCO"),

            /// The cabler dataand telecommunications

    CablerDataandTelecommunications("342411", "Cabler (Data and Telecommunications)", "ANZSCO"),

            /// The telecommunications cable jointer

    TelecommunicationsCableJointer("342412", "Telecommunications Cable Jointer", "ANZSCO"),

            /// The telecommunications linesworker

    TelecommunicationsLinesworker("342413", "Telecommunications Linesworker", "ANZSCO"),

            /// The telecommunications technician

    TelecommunicationsTechnician("342414", "Telecommunications Technician", "ANZSCO"),

            /// The food trades workersnfd

    FoodTradesWorkersnfd("351000", "Food Trades Workers nfd", "ANZSCO"),

            /// The bakersand pastrycooksnfd

    BakersandPastrycooksnfd("351100", "Bakers and Pastrycooks nfd", "ANZSCO"),

            /// The baker

    Baker("351111", "Baker", "ANZSCO"),

            /// The pastrycook

    Pastrycook("351112", "Pastrycook", "ANZSCO"),

            /// The butcheror smallgoods maker

    ButcherorSmallgoodsMaker("351211", "Butcher or Smallgoods Maker", "ANZSCO"),

            /// The chef

    Chef("351311", "Chef", "ANZSCO"),

            /// The cook

    Cook("351411", "Cook", "ANZSCO"),

            /// The skilled animaland horticultural workersnfd

    SkilledAnimalandHorticulturalWorkersnfd("360000", "Skilled Animal and Horticultural Workers nfd", "ANZSCO"),

            /// The animal attendantsand trainersand shearersnfd

    AnimalAttendantsandTrainersandShearersnfd("361000", "Animal Attendants and Trainers, and Shearers nfd", "ANZSCO"),

            /// The animal attendantsand trainersnfd

    AnimalAttendantsandTrainersnfd("361100", "Animal Attendants and Trainers nfd", "ANZSCO"),

            /// The dog handleror trainer

    DogHandlerorTrainer("361111", "Dog Handler or Trainer", "ANZSCO"),

            /// The horse trainer

    HorseTrainer("361112", "Horse Trainer", "ANZSCO"),

            /// The pet groomer

    PetGroomer("361113", "Pet Groomer", "ANZSCO"),

            /// The zookeeper

    Zookeeper("361114", "Zookeeper", "ANZSCO"),

            /// The animal attendantsand trainersnec

    AnimalAttendantsandTrainersnec("361199", "Animal Attendants and Trainers nec", "ANZSCO"),

            /// The shearer

    Shearer("361211", "Shearer", "ANZSCO"),

            /// The veterinary nurse

    VeterinaryNurse("361311", "Veterinary Nurse", "ANZSCO"),

            /// The horticultural trades workersnfd

    HorticulturalTradesWorkersnfd("362000", "Horticultural Trades Workers nfd", "ANZSCO"),

            /// The florist

    Florist("362111", "Florist", "ANZSCO"),

            /// The gardenersnfd

    Gardenersnfd("362200", "Gardeners nfd", "ANZSCO"),

            /// The gardener general

    GardenerGeneral("362211", "Gardener (General)", "ANZSCO"),

            /// The arborist

    Arborist("362212", "Arborist", "ANZSCO"),

            /// The landscape gardener

    LandscapeGardener("362213", "Landscape Gardener", "ANZSCO"),

            /// The greenkeeper

    Greenkeeper("362311", "Greenkeeper", "ANZSCO"),

            /// The nurseryperson

    Nurseryperson("362411", "Nurseryperson", "ANZSCO"),

            /// The other techniciansand trades workersnfd

    OtherTechniciansandTradesWorkersnfd("390000", "Other Technicians and Trades Workers nfd", "ANZSCO"),

            /// The hairdresser

    Hairdresser("391111", "Hairdresser", "ANZSCO"),

            /// The printing trades workersnfd

    PrintingTradesWorkersnfd("392000", "Printing Trades Workers nfd", "ANZSCO"),

            /// The print finishersand screen printersnfd

    PrintFinishersandScreenPrintersnfd("392100", "Print Finishers and Screen Printers nfd", "ANZSCO"),

            /// The print finisher

    PrintFinisher("392111", "Print Finisher", "ANZSCO"),

            /// The screen printer

    ScreenPrinter("392112", "Screen Printer", "ANZSCO"),

            /// The graphic prepress trades worker

    GraphicPrepressTradesWorker("392211", "Graphic Pre-press Trades Worker", "ANZSCO"),

            /// The printersnfd

    Printersnfd("392300", "Printers nfd", "ANZSCO"),

            /// The printing machinist

    PrintingMachinist("392311", "Printing Machinist", "ANZSCO"),

            /// The small offset printer

    SmallOffsetPrinter("392312", "Small Offset Printer", "ANZSCO"),

            /// The textile clothingand footwear trades workersnfd

    TextileClothingandFootwearTradesWorkersnfd("393000", "Textile, Clothing and Footwear Trades Workers nfd", "ANZSCO"),

            /// The canvasand leather goods makersnfd

    CanvasandLeatherGoodsMakersnfd("393100", "Canvas and Leather Goods Makers nfd", "ANZSCO"),

            /// The canvas goods fabricator

    CanvasGoodsFabricator("393111", "Canvas Goods Fabricator", "ANZSCO"),

            /// The leather goods maker

    LeatherGoodsMaker("393112", "Leather Goods Maker", "ANZSCO"),

            /// The sail maker

    SailMaker("393113", "Sail Maker", "ANZSCO"),

            /// The shoemaker

    Shoemaker("393114", "Shoemaker", "ANZSCO"),

            /// The clothing trades workersnfd

    ClothingTradesWorkersnfd("393200", "Clothing Trades Workers nfd", "ANZSCO"),

            /// The apparel cutter

    ApparelCutter("393211", "Apparel Cutter", "ANZSCO"),

            /// The clothing patternmaker

    ClothingPatternmaker("393212", "Clothing Patternmaker", "ANZSCO"),

            /// The dressmakeror tailor

    DressmakerorTailor("393213", "Dressmaker or Tailor", "ANZSCO"),

            /// The clothing trades workersnec

    ClothingTradesWorkersnec("393299", "Clothing Trades Workers nec", "ANZSCO"),

            /// The upholsterer

    Upholsterer("393311", "Upholsterer", "ANZSCO"),

            /// The wood trades workersnfd

    WoodTradesWorkersnfd("394000", "Wood Trades Workers nfd", "ANZSCO"),

            /// The cabinetmaker

    Cabinetmaker("394111", "Cabinetmaker", "ANZSCO"),

            /// The wood machinistsand other wood trades workersnfd

    WoodMachinistsandOtherWoodTradesWorkersnfd("394200", "Wood Machinists and Other Wood Trades Workers nfd", "ANZSCO"),

            /// The furniture finisher

    FurnitureFinisher("394211", "Furniture Finisher", "ANZSCO"),

            /// The picture framer

    PictureFramer("394212", "Picture Framer", "ANZSCO"),

            /// The wood machinist

    WoodMachinist("394213", "Wood Machinist", "ANZSCO"),

            /// The wood turner

    WoodTurner("394214", "Wood Turner", "ANZSCO"),

            /// The wood machinistsand other wood trades workersnec

    WoodMachinistsandOtherWoodTradesWorkersnec("394299", "Wood Machinists and Other Wood Trades Workers nec", "ANZSCO"),

            /// The miscellaneous techniciansand trades workersnfd

    MiscellaneousTechniciansandTradesWorkersnfd("399000", "Miscellaneous Technicians and Trades Workers nfd", "ANZSCO"),

            /// The boat buildersand shipwrightsnfd

    BoatBuildersandShipwrightsnfd("399100", "Boat Builders and Shipwrights nfd", "ANZSCO"),

            /// The boat builderand repairer

    BoatBuilderandRepairer("399111", "Boat Builder and Repairer", "ANZSCO"),

            /// The shipwright

    Shipwright("399112", "Shipwright", "ANZSCO"),

            /// The chemical gas petroleumand power generation plant operatorsnfd

    ChemicalGasPetroleumandPowerGenerationPlantOperatorsnfd("399200", "Chemical, Gas, Petroleum and Power Generation Plant Operators nfd", "ANZSCO"),

            /// The chemical plant operator

    ChemicalPlantOperator("399211", "Chemical Plant Operator", "ANZSCO"),

            /// The gasor petroleum operator

    GasorPetroleumOperator("399212", "Gas or Petroleum Operator", "ANZSCO"),

            /// The power generation plant operator

    PowerGenerationPlantOperator("399213", "Power Generation Plant Operator", "ANZSCO"),

            /// The gallery libraryand museum techniciansnfd

    GalleryLibraryandMuseumTechniciansnfd("399300", "Gallery, Library and Museum Technicians nfd", "ANZSCO"),

            /// The galleryor museum technician

    GalleryorMuseumTechnician("399311", "Gallery or Museum Technician", "ANZSCO"),

            /// The library technician

    LibraryTechnician("399312", "Library Technician", "ANZSCO"),

            /// The jeweller

    Jeweller("399411", "Jeweller", "ANZSCO"),

            /// The performing arts techniciansnfd

    PerformingArtsTechniciansnfd("399500", "Performing Arts Technicians nfd", "ANZSCO"),

            /// The broadcast transmitter operator

    BroadcastTransmitterOperator("399511", "Broadcast Transmitter Operator", "ANZSCO"),

            /// The camera operator film televisionor video

    CameraOperatorFilmTelevisionorVideo("399512", "Camera Operator (Film, Television or Video)", "ANZSCO"),

            /// The light technician

    LightTechnician("399513", "Light Technician", "ANZSCO"),

            /// The make up artist

    MakeUpArtist("399514", "Make Up Artist", "ANZSCO"),

            /// The musical instrument makeror repairer

    MusicalInstrumentMakerorRepairer("399515", "Musical Instrument Maker or Repairer", "ANZSCO"),

            /// The sound technician

    SoundTechnician("399516", "Sound Technician", "ANZSCO"),

            /// The television equipment operator

    TelevisionEquipmentOperator("399517", "Television Equipment Operator", "ANZSCO"),

            /// The performing arts techniciansnec

    PerformingArtsTechniciansnec("399599", "Performing Arts Technicians nec", "ANZSCO"),

            /// The signwriter

    Signwriter("399611", "Signwriter", "ANZSCO"),

            /// The other miscellaneous techniciansand trades workersnfd

    OtherMiscellaneousTechniciansandTradesWorkersnfd("399900", "Other Miscellaneous Technicians and Trades Workers nfd", "ANZSCO"),

            /// The diver

    Diver("399911", "Diver", "ANZSCO"),

            /// The interior decorator

    InteriorDecorator("399912", "Interior Decorator", "ANZSCO"),

            /// The optical dispenser

    OpticalDispenser("399913", "Optical Dispenser", "ANZSCO"),

            /// The optical mechanic

    OpticalMechanic("399914", "Optical Mechanic", "ANZSCO"),

            /// The photographers assistant

    PhotographersAssistant("399915", "Photographer's Assistant", "ANZSCO"),

            /// The plastics technician

    PlasticsTechnician("399916", "Plastics Technician", "ANZSCO"),

            /// The wool classer

    WoolClasser("399917", "Wool Classer", "ANZSCO"),

            /// The fire protection equipment technician

    FireProtectionEquipmentTechnician("399918", "Fire Protection Equipment Technician", "ANZSCO"),

            /// The techniciansand trades workersnec

    TechniciansandTradesWorkersnec("399999", "Technicians and Trades Workers nec", "ANZSCO"),

            /// The communityand personal service workersnfd

    CommunityandPersonalServiceWorkersnfd("400000", "Community and Personal Service Workers nfd", "ANZSCO"),

            /// The healthand welfare support workersnfd

    HealthandWelfareSupportWorkersnfd("411000", "Health and Welfare Support Workers nfd", "ANZSCO"),

            /// The ambulance officersand paramedicsnfd

    AmbulanceOfficersandParamedicsnfd("411100", "Ambulance Officers and Paramedics nfd", "ANZSCO"),

            /// The ambulance officer

    AmbulanceOfficer("411111", "Ambulance Officer", "ANZSCO"),

            /// The intensive care ambulance paramedic

    IntensiveCareAmbulanceParamedic("411112", "Intensive Care Ambulance Paramedic", "ANZSCO"),

            /// The dental hygienists techniciansand therapistsnfd

    DentalHygienistsTechniciansandTherapistsnfd("411200", "Dental Hygienists, Technicians and Therapists nfd", "ANZSCO"),

            /// The dental hygienist

    DentalHygienist("411211", "Dental Hygienist", "ANZSCO"),

            /// The dental prosthetist

    DentalProsthetist("411212", "Dental Prosthetist", "ANZSCO"),

            /// The dental technician

    DentalTechnician("411213", "Dental Technician", "ANZSCO"),

            /// The dental therapist

    DentalTherapist("411214", "Dental Therapist", "ANZSCO"),

            /// The diversional therapist

    DiversionalTherapist("411311", "Diversional Therapist", "ANZSCO"),

            /// The enrolledand mothercraft nursesnfd

    EnrolledandMothercraftNursesnfd("411400", "Enrolled and Mothercraft Nurses nfd", "ANZSCO"),

            /// The enrolled nurse

    EnrolledNurse("411411", "Enrolled Nurse", "ANZSCO"),

            /// The mothercraft nurse

    MothercraftNurse("411412", "Mothercraft Nurse", "ANZSCO"),

            /// The aboriginaland torres strait islander health worker

    AboriginalandTorresStraitIslanderHealthWorker("411511", "Aboriginal and Torres Strait Islander Health Worker", "ANZSCO"),

            /// The massage therapist

    MassageTherapist("411611", "Massage Therapist", "ANZSCO"),

            /// The welfare support workersnfd

    WelfareSupportWorkersnfd("411700", "Welfare Support Workers nfd", "ANZSCO"),

            /// The community worker

    CommunityWorker("411711", "Community Worker", "ANZSCO"),

            /// The disabilities services officer

    DisabilitiesServicesOfficer("411712", "Disabilities Services Officer", "ANZSCO"),

            /// The family support worker

    FamilySupportWorker("411713", "Family Support Worker", "ANZSCO"),

            /// The paroleor probation officer

    ParoleorProbationOfficer("411714", "Parole or Probation Officer", "ANZSCO"),

            /// The residential care officer

    ResidentialCareOfficer("411715", "Residential Care Officer", "ANZSCO"),

            /// The youth worker

    YouthWorker("411716", "Youth Worker", "ANZSCO"),

            /// The carersand aidesnfd

    CarersandAidesnfd("420000", "Carers and Aides nfd", "ANZSCO"),

            /// The child carersnfd

    ChildCarersnfd("421100", "Child Carers nfd", "ANZSCO"),

            /// The child care worker

    ChildCareWorker("421111", "Child Care Worker", "ANZSCO"),

            /// The family day care worker

    FamilyDayCareWorker("421112", "Family Day Care Worker", "ANZSCO"),

            /// The nanny

    Nanny("421113", "Nanny", "ANZSCO"),

            /// The outof school hours care worker

    OutofSchoolHoursCareWorker("421114", "Out of School Hours Care Worker", "ANZSCO"),

            /// The education aidesnfd

    EducationAidesnfd("422100", "Education Aides nfd", "ANZSCO"),

            /// The aboriginaland torres strait islander education worker

    AboriginalandTorresStraitIslanderEducationWorker("422111", "Aboriginal and Torres Strait Islander Education Worker", "ANZSCO"),

            /// The integration aide

    IntegrationAide("422112", "Integration Aide", "ANZSCO"),

            /// The preschool aide

    PreschoolAide("422115", "Preschool Aide", "ANZSCO"),

            /// The teachers aide

    TeachersAide("422116", "Teachers' Aide", "ANZSCO"),

            /// The personal carersand assistantsnfd

    PersonalCarersandAssistantsnfd("423000", "Personal Carers and Assistants nfd", "ANZSCO"),

            /// The aged or disabled carer

    AgedOrDisabledCarer("423111", "Aged or Disabled Carer", "ANZSCO"),

            /// The dental assistant

    DentalAssistant("423211", "Dental Assistant", "ANZSCO"),

            /// The nursing supportand personal care workersnfd

    NursingSupportandPersonalCareWorkersnfd("423300", "Nursing Support and Personal Care Workers nfd", "ANZSCO"),

            /// The hospital orderly

    HospitalOrderly("423311", "Hospital Orderly", "ANZSCO"),

            /// The nursing support worker

    NursingSupportWorker("423312", "Nursing Support Worker", "ANZSCO"),

            /// The personal care assistant

    PersonalCareAssistant("423313", "Personal Care Assistant", "ANZSCO"),

            /// The therapy aide

    TherapyAide("423314", "Therapy Aide", "ANZSCO"),

            /// The special care workersnfd

    SpecialCareWorkersnfd("423400", "Special Care Workers nfd", "ANZSCO"),

            /// The childor youth residential care assistant

    ChildorYouthResidentialCareAssistant("423411", "Child or Youth Residential Care Assistant", "ANZSCO"),

            /// The hostel parent

    HostelParent("423412", "Hostel Parent", "ANZSCO"),

            /// The refuge worker

    RefugeWorker("423413", "Refuge Worker", "ANZSCO"),

            /// The hospitality workersnfd

    HospitalityWorkersnfd("431000", "Hospitality Workers nfd", "ANZSCO"),

            /// The bar attendantsand baristasnfd

    BarAttendantsandBaristasnfd("431100", "Bar Attendants and Baristas nfd", "ANZSCO"),

            /// The bar attendant

    BarAttendant("431111", "Bar Attendant", "ANZSCO"),

            /// The barista

    Barista("431112", "Barista", "ANZSCO"),

            /// The cafe worker

    CafeWorker("431211", "Cafe Worker", "ANZSCO"),

            /// The gaming worker

    GamingWorker("431311", "Gaming Worker", "ANZSCO"),

            /// The hotel service manager

    HotelServiceManager("431411", "Hotel Service Manager", "ANZSCO"),

            /// The waiter

    Waiter("431511", "Waiter", "ANZSCO"),

            /// The other hospitality workersnfd

    OtherHospitalityWorkersnfd("431900", "Other Hospitality Workers nfd", "ANZSCO"),

            /// The bar usefulor busser

    BarUsefulorBusser("431911", "Bar Useful or Busser", "ANZSCO"),

            /// The doorpersonor luggage porter

    DoorpersonorLuggagePorter("431912", "Doorperson or Luggage Porter", "ANZSCO"),

            /// The hospitality workersnec

    HospitalityWorkersnec("431999", "Hospitality Workers nec", "ANZSCO"),

            /// The protective service workersnfd

    ProtectiveServiceWorkersnfd("440000", "Protective Service Workers nfd", "ANZSCO"),

            /// The defence force members fire fightersand policenfd

    DefenceForceMembersFireFightersandPolicenfd("441000", "Defence Force Members, Fire Fighters and Police nfd", "ANZSCO"),

            /// The defence force member other ranks

    DefenceForceMemberOtherRanks("441111", "Defence Force Member - Other Ranks", "ANZSCO"),

            /// The fireand emergency workersnfd

    FireandEmergencyWorkersnfd("441200", "Fire and Emergency Workers nfd", "ANZSCO"),

            /// The emergency service worker

    EmergencyServiceWorker("441211", "Emergency Service Worker", "ANZSCO"),

            /// The fire fighter

    FireFighter("441212", "Fire Fighter", "ANZSCO"),

            /// The policenfd

    Policenfd("441300", "Police nfd", "ANZSCO"),

            /// The detective

    Detective("441311", "Detective", "ANZSCO"),

            /// The police officer

    PoliceOfficer("441312", "Police Officer", "ANZSCO"),

            /// The prisonand security officersnfd

    PrisonandSecurityOfficersnfd("442000", "Prison and Security Officers nfd", "ANZSCO"),

            /// The prison officer

    PrisonOfficer("442111", "Prison Officer", "ANZSCO"),

            /// The security officersand guardsnfd

    SecurityOfficersandGuardsnfd("442200", "Security Officers and Guards nfd", "ANZSCO"),

            /// The alarm securityor surveillance monitor

    AlarmSecurityorSurveillanceMonitor("442211", "Alarm, Security or Surveillance Monitor", "ANZSCO"),

            /// The armoured car escort

    ArmouredCarEscort("442212", "Armoured Car Escort", "ANZSCO"),

            /// The crowd controller

    CrowdController("442213", "Crowd Controller", "ANZSCO"),

            /// The private investigator

    PrivateInvestigator("442214", "Private Investigator", "ANZSCO"),

            /// The retail loss prevention officer

    RetailLossPreventionOfficer("442215", "Retail Loss Prevention Officer", "ANZSCO"),

            /// The security consultant

    SecurityConsultant("442216", "Security Consultant", "ANZSCO"),

            /// The security officer

    SecurityOfficer("442217", "Security Officer", "ANZSCO"),

            /// The security officersand guardsnec

    SecurityOfficersandGuardsnec("442299", "Security Officers and Guards nec", "ANZSCO"),

            /// The sportsand personal service workersnfd

    SportsandPersonalServiceWorkersnfd("450000", "Sports and Personal Service Workers nfd", "ANZSCO"),

            /// The personal serviceand travel workersnfd

    PersonalServiceandTravelWorkersnfd("451000", "Personal Service and Travel Workers nfd", "ANZSCO"),

            /// The beauty therapist

    BeautyTherapist("451111", "Beauty Therapist", "ANZSCO"),

            /// The driving instructor

    DrivingInstructor("451211", "Driving Instructor", "ANZSCO"),

            /// The funeral workersnfd

    FuneralWorkersnfd("451300", "Funeral Workers nfd", "ANZSCO"),

            /// The funeral director

    FuneralDirector("451311", "Funeral Director", "ANZSCO"),

            /// The funeral workersnec

    FuneralWorkersnec("451399", "Funeral Workers nec", "ANZSCO"),

            /// The gallery museumand tour guidesnfd

    GalleryMuseumandTourGuidesnfd("451400", "Gallery, Museum and Tour Guides nfd", "ANZSCO"),

            /// The galleryor museum guide

    GalleryorMuseumGuide("451411", "Gallery or Museum Guide", "ANZSCO"),

            /// The tour guide

    TourGuide("451412", "Tour Guide", "ANZSCO"),

            /// The personal care consultantsnfd

    PersonalCareConsultantsnfd("451500", "Personal Care Consultants nfd", "ANZSCO"),

            /// The natural remedy consultant

    NaturalRemedyConsultant("451511", "Natural Remedy Consultant", "ANZSCO"),

            /// The weight loss consultant

    WeightLossConsultant("451512", "Weight Loss Consultant", "ANZSCO"),

            /// The tourismand travel advisersnfd

    TourismandTravelAdvisersnfd("451600", "Tourism and Travel Advisers nfd", "ANZSCO"),

            /// The tourist information officer

    TouristInformationOfficer("451611", "Tourist Information Officer", "ANZSCO"),

            /// The travel consultant

    TravelConsultant("451612", "Travel Consultant", "ANZSCO"),

            /// The travel attendantsnfd

    TravelAttendantsnfd("451700", "Travel Attendants nfd", "ANZSCO"),

            /// The flight attendant

    FlightAttendant("451711", "Flight Attendant", "ANZSCO"),

            /// The travel attendantsnec

    TravelAttendantsnec("451799", "Travel Attendants nec", "ANZSCO"),

            /// The other personal service workersnfd

    OtherPersonalServiceWorkersnfd("451800", "Other Personal Service Workers nfd", "ANZSCO"),

            /// The civil celebrant

    CivilCelebrant("451811", "Civil Celebrant", "ANZSCO"),

            /// The hairor beauty salon assistant

    HairorBeautySalonAssistant("451812", "Hair or Beauty Salon Assistant", "ANZSCO"),

            /// The sex workeror escort

    SexWorkerorEscort("451813", "Sex Worker or Escort", "ANZSCO"),

            /// The body artist

    BodyArtist("451814", "Body Artist", "ANZSCO"),

            /// The first aid trainer

    FirstAidTrainer("451815", "First Aid Trainer", "ANZSCO"),

            /// The religious assistant

    ReligiousAssistant("451816", "Religious Assistant", "ANZSCO"),

            /// The personal service workersnec

    PersonalServiceWorkersnec("451899", "Personal Service Workers nec", "ANZSCO"),

            /// The sportsand fitness workersnfd

    SportsandFitnessWorkersnfd("452000", "Sports and Fitness Workers nfd", "ANZSCO"),

            /// The fitness instructor

    FitnessInstructor("452111", "Fitness Instructor", "ANZSCO"),

            /// The outdoor adventure guidesnfd

    OutdoorAdventureGuidesnfd("452200", "Outdoor Adventure Guides nfd", "ANZSCO"),

            /// The bungy jump master

    BungyJumpMaster("452211", "Bungy Jump Master", "ANZSCO"),

            /// The fishing guide

    FishingGuide("452212", "Fishing Guide", "ANZSCO"),

            /// The hunting guide

    HuntingGuide("452213", "Hunting Guide", "ANZSCO"),

            /// The mountainor glacier guide

    MountainorGlacierGuide("452214", "Mountain or Glacier Guide", "ANZSCO"),

            /// The outdoor adventure instructor

    OutdoorAdventureInstructor("452215", "Outdoor Adventure Instructor", "ANZSCO"),

            /// The trekking guide

    TrekkingGuide("452216", "Trekking Guide", "ANZSCO"),

            /// The whitewater rafting guide

    WhitewaterRaftingGuide("452217", "Whitewater Rafting Guide", "ANZSCO"),

            /// The outdoor adventure guidesnec

    OutdoorAdventureGuidesnec("452299", "Outdoor Adventure Guides nec", "ANZSCO"),

            /// The sports coaches instructorsand officialsnfd

    SportsCoachesInstructorsandOfficialsnfd("452300", "Sports Coaches, Instructors and Officials nfd", "ANZSCO"),

            /// The diving instructor open water

    DivingInstructorOpenWater("452311", "Diving Instructor (Open Water)", "ANZSCO"),

            /// The gymnastics coachor instructor

    GymnasticsCoachorInstructor("452312", "Gymnastics Coach or Instructor", "ANZSCO"),

            /// The horse riding coachor instructor

    HorseRidingCoachorInstructor("452313", "Horse Riding Coach or Instructor", "ANZSCO"),

            /// The snowsport instructor

    SnowsportInstructor("452314", "Snowsport Instructor", "ANZSCO"),

            /// The swimming coachor instructor

    SwimmingCoachorInstructor("452315", "Swimming Coach or Instructor", "ANZSCO"),

            /// The tennis coach

    TennisCoach("452316", "Tennis Coach", "ANZSCO"),

            /// The other sports coachor instructor

    OtherSportsCoachorInstructor("452317", "Other Sports Coach or Instructor", "ANZSCO"),

            /// The dogor horse racing official

    DogorHorseRacingOfficial("452318", "Dog or Horse Racing Official", "ANZSCO"),

            /// The sports development officer

    SportsDevelopmentOfficer("452321", "Sports Development Officer", "ANZSCO"),

            /// The sports umpire

    SportsUmpire("452322", "Sports Umpire", "ANZSCO"),

            /// The other sports official

    OtherSportsOfficial("452323", "Other Sports Official", "ANZSCO"),

            /// The sportspersonsnfd

    Sportspersonsnfd("452400", "Sportspersons nfd", "ANZSCO"),

            /// The footballer

    Footballer("452411", "Footballer", "ANZSCO"),

            /// The golfer

    Golfer("452412", "Golfer", "ANZSCO"),

            /// The jockey

    Jockey("452413", "Jockey", "ANZSCO"),

            /// The lifeguard

    Lifeguard("452414", "Lifeguard", "ANZSCO"),

            /// The sportspersonsnec

    Sportspersonsnec("452499", "Sportspersons nec", "ANZSCO"),

            /// The clericaland administrative workersnfd

    ClericalandAdministrativeWorkersnfd("500000", "Clerical and Administrative Workers nfd", "ANZSCO"),

            /// The office managersand program administratorsnfd

    OfficeManagersandProgramAdministratorsnfd("510000", "Office Managers and Program Administrators nfd", "ANZSCO"),

            /// The contract programand project administratorsnfd

    ContractProgramandProjectAdministratorsnfd("511100", "Contract, Program and Project Administrators nfd", "ANZSCO"),

            /// The contract administrator

    ContractAdministrator("511111", "Contract Administrator", "ANZSCO"),

            /// The programor project administrator

    ProgramorProjectAdministrator("511112", "Program or Project Administrator", "ANZSCO"),

            /// The officeand practice managersnfd

    OfficeandPracticeManagersnfd("512000", "Office and Practice Managers nfd", "ANZSCO"),

            /// The office manager

    OfficeManager("512111", "Office Manager", "ANZSCO"),

            /// The practice managersnfd

    PracticeManagersnfd("512200", "Practice Managers nfd", "ANZSCO"),

            /// The health practice manager

    HealthPracticeManager("512211", "Health Practice Manager", "ANZSCO"),

            /// The practice managersnec

    PracticeManagersnec("512299", "Practice Managers nec", "ANZSCO"),

            /// The personal assistantsand secretariesnfd

    PersonalAssistantsandSecretariesnfd("521000", "Personal Assistants and Secretaries nfd", "ANZSCO"),

            /// The personal assistant

    PersonalAssistant("521111", "Personal Assistant", "ANZSCO"),

            /// The secretariesnfd

    Secretariesnfd("521200", "Secretaries nfd", "ANZSCO"),

            /// The secretary general

    SecretaryGeneral("521211", "Secretary (General)", "ANZSCO"),

            /// The legal secretary

    LegalSecretary("521212", "Legal Secretary", "ANZSCO"),

            /// The general clerical workersnfd

    GeneralClericalWorkersnfd("530000", "General Clerical Workers nfd", "ANZSCO"),

            /// The general clerk

    GeneralClerk("531111", "General Clerk", "ANZSCO"),

            /// The keyboard operatorsnfd

    KeyboardOperatorsnfd("532100", "Keyboard Operators nfd", "ANZSCO"),

            /// The data entry operator

    DataEntryOperator("532111", "Data Entry Operator", "ANZSCO"),

            /// The machine shorthand reporter

    MachineShorthandReporter("532112", "Machine Shorthand Reporter", "ANZSCO"),

            /// The word processing operator

    WordProcessingOperator("532113", "Word Processing Operator", "ANZSCO"),

            /// The inquiry clerksand receptionistsnfd

    InquiryClerksandReceptionistsnfd("540000", "Inquiry Clerks and Receptionists nfd", "ANZSCO"),

            /// The callor contact centre information clerksnfd

    CallorContactCentreInformationClerksnfd("541000", "Call or Contact Centre Information Clerks nfd", "ANZSCO"),

            /// The callor contact centre workersnfd

    CallorContactCentreWorkersnfd("541100", "Call or Contact Centre Workers nfd", "ANZSCO"),

            /// The callor contact centre team leader

    CallorContactCentreTeamLeader("541111", "Call or Contact Centre Team Leader", "ANZSCO"),

            /// The callor contact centre operator

    CallorContactCentreOperator("541112", "Call or Contact Centre Operator", "ANZSCO"),

            /// The inquiry clerk

    InquiryClerk("541211", "Inquiry Clerk", "ANZSCO"),

            /// The receptionistsnfd

    Receptionistsnfd("542100", "Receptionists nfd", "ANZSCO"),

            /// The receptionist general

    ReceptionistGeneral("542111", "Receptionist (General)", "ANZSCO"),

            /// The admissions clerk

    AdmissionsClerk("542112", "Admissions Clerk", "ANZSCO"),

            /// The hotelor motel receptionist

    HotelorMotelReceptionist("542113", "Hotel or Motel Receptionist", "ANZSCO"),

            /// The medical receptionist

    MedicalReceptionist("542114", "Medical Receptionist", "ANZSCO"),

            /// The numerical clerksnfd

    NumericalClerksnfd("550000", "Numerical Clerks nfd", "ANZSCO"),

            /// The accounting clerksand bookkeepersnfd

    AccountingClerksandBookkeepersnfd("551000", "Accounting Clerks and Bookkeepers nfd", "ANZSCO"),

            /// The accounting clerksnfd

    AccountingClerksnfd("551100", "Accounting Clerks nfd", "ANZSCO"),

            /// The accounts clerk

    AccountsClerk("551111", "Accounts Clerk", "ANZSCO"),

            /// The cost clerk

    CostClerk("551112", "Cost Clerk", "ANZSCO"),

            /// The bookkeeper

    Bookkeeper("551211", "Bookkeeper", "ANZSCO"),

            /// The payroll clerk

    PayrollClerk("551311", "Payroll Clerk", "ANZSCO"),

            /// The financialand insurance clerksnfd

    FinancialandInsuranceClerksnfd("552000", "Financial and Insurance Clerks nfd", "ANZSCO"),

            /// The bank worker

    BankWorker("552111", "Bank Worker", "ANZSCO"),

            /// The creditor loans officer

    CreditorLoansOfficer("552211", "Credit or Loans Officer", "ANZSCO"),

            /// The insurance money marketand statistical clerksnfd

    InsuranceMoneyMarketandStatisticalClerksnfd("552300", "Insurance, Money Market and Statistical Clerks nfd", "ANZSCO"),

            /// The bookmaker

    Bookmaker("552311", "Bookmaker", "ANZSCO"),

            /// The insurance consultant

    InsuranceConsultant("552312", "Insurance Consultant", "ANZSCO"),

            /// The money market clerk

    MoneyMarketClerk("552313", "Money Market Clerk", "ANZSCO"),

            /// The statistical clerk

    StatisticalClerk("552314", "Statistical Clerk", "ANZSCO"),

            /// The clericaland office support workersnfd

    ClericalandOfficeSupportWorkersnfd("561000", "Clerical and Office Support Workers nfd", "ANZSCO"),

            /// The betting clerksnfd

    BettingClerksnfd("561100", "Betting Clerks nfd", "ANZSCO"),

            /// The betting agency counter clerk

    BettingAgencyCounterClerk("561111", "Betting Agency Counter Clerk", "ANZSCO"),

            /// The bookmakers clerk

    BookmakersClerk("561112", "Bookmaker's Clerk", "ANZSCO"),

            /// The telephone betting clerk

    TelephoneBettingClerk("561113", "Telephone Betting Clerk", "ANZSCO"),

            /// The betting clerksnec

    BettingClerksnec("561199", "Betting Clerks nec", "ANZSCO"),

            /// The couriersand postal deliverersnfd

    CouriersandPostalDeliverersnfd("561200", "Couriers and Postal Deliverers nfd", "ANZSCO"),

            /// The courier

    Courier("561211", "Courier", "ANZSCO"),

            /// The postal delivery officer

    PostalDeliveryOfficer("561212", "Postal Delivery Officer", "ANZSCO"),

            /// The filingor registry clerk

    FilingorRegistryClerk("561311", "Filing or Registry Clerk", "ANZSCO"),

            /// The mail sortersnfd

    MailSortersnfd("561400", "Mail Sorters nfd", "ANZSCO"),

            /// The mail clerk

    MailClerk("561411", "Mail Clerk", "ANZSCO"),

            /// The postal sorting officer

    PostalSortingOfficer("561412", "Postal Sorting Officer", "ANZSCO"),

            /// The survey interviewer

    SurveyInterviewer("561511", "Survey Interviewer", "ANZSCO"),

            /// The switchboard operator

    SwitchboardOperator("561611", "Switchboard Operator", "ANZSCO"),

            /// The other clericaland office support workersnfd

    OtherClericalandOfficeSupportWorkersnfd("561900", "Other Clerical and Office Support Workers nfd", "ANZSCO"),

            /// The classified advertising clerk

    ClassifiedAdvertisingClerk("561911", "Classified Advertising Clerk", "ANZSCO"),

            /// The meter reader

    MeterReader("561912", "Meter Reader", "ANZSCO"),

            /// The parking inspector

    ParkingInspector("561913", "Parking Inspector", "ANZSCO"),

            /// The clericaland office support workersnec

    ClericalandOfficeSupportWorkersnec("561999", "Clerical and Office Support Workers nec", "ANZSCO"),

            /// The other clericaland administrative workersnfd

    OtherClericalandAdministrativeWorkersnfd("590000", "Other Clerical and Administrative Workers nfd", "ANZSCO"),

            /// The logistics clerksnfd

    LogisticsClerksnfd("591000", "Logistics Clerks nfd", "ANZSCO"),

            /// The purchasingand supply logistics clerksnfd

    PurchasingandSupplyLogisticsClerksnfd("591100", "Purchasing and Supply Logistics Clerks nfd", "ANZSCO"),

            /// The production clerk

    ProductionClerk("591112", "Production Clerk", "ANZSCO"),

            /// The purchasing officer

    PurchasingOfficer("591113", "Purchasing Officer", "ANZSCO"),

            /// The stock clerk

    StockClerk("591115", "Stock Clerk", "ANZSCO"),

            /// The warehouse administrator

    WarehouseAdministrator("591116", "Warehouse Administrator", "ANZSCO"),

            /// The order clerk

    OrderClerk("591117", "Order Clerk", "ANZSCO"),

            /// The transportand despatch clerksnfd

    TransportandDespatchClerksnfd("591200", "Transport and Despatch Clerks nfd", "ANZSCO"),

            /// The despatchingand receiving clerk

    DespatchingandReceivingClerk("591211", "Despatching and Receiving Clerk", "ANZSCO"),

            /// The import export clerk

    ImportExportClerk("591212", "Import-Export Clerk", "ANZSCO"),

            /// The miscellaneous clericaland administrative workersnfd

    MiscellaneousClericalandAdministrativeWorkersnfd("599000", "Miscellaneous Clerical and Administrative Workers nfd", "ANZSCO"),

            /// The conveyancersand legal executivesnfd

    ConveyancersandLegalExecutivesnfd("599100", "Conveyancers and Legal Executives nfd", "ANZSCO"),

            /// The conveyancer

    Conveyancer("599111", "Conveyancer", "ANZSCO"),

            /// The legal executive

    LegalExecutive("599112", "Legal Executive", "ANZSCO"),

            /// The courtand legal clerksnfd

    CourtandLegalClerksnfd("599200", "Court and Legal Clerks nfd", "ANZSCO"),

            /// The clerkof court

    ClerkofCourt("599211", "Clerk of Court", "ANZSCO"),

            /// The court bailiffor sheriff

    CourtBailifforSheriff("599212", "Court Bailiff or Sheriff", "ANZSCO"),

            /// The court orderly

    CourtOrderly("599213", "Court Orderly", "ANZSCO"),

            /// The law clerk

    LawClerk("599214", "Law Clerk", "ANZSCO"),

            /// The trust officer

    TrustOfficer("599215", "Trust Officer", "ANZSCO"),

            /// The debt collector

    DebtCollector("599311", "Debt Collector", "ANZSCO"),

            /// The human resource clerk

    HumanResourceClerk("599411", "Human Resource Clerk", "ANZSCO"),

            /// The inspectorsand regulatory officersnfd

    InspectorsandRegulatoryOfficersnfd("599500", "Inspectors and Regulatory Officers nfd", "ANZSCO"),

            /// The customs officer

    CustomsOfficer("599511", "Customs Officer", "ANZSCO"),

            /// The immigration officer

    ImmigrationOfficer("599512", "Immigration Officer", "ANZSCO"),

            /// The motor vehicle licence examiner

    MotorVehicleLicenceExaminer("599513", "Motor Vehicle Licence Examiner", "ANZSCO"),

            /// The noxious weedsand pest inspector

    NoxiousWeedsandPestInspector("599514", "Noxious Weeds and Pest Inspector", "ANZSCO"),

            /// The social security assessor

    SocialSecurityAssessor("599515", "Social Security Assessor", "ANZSCO"),

            /// The taxation inspector

    TaxationInspector("599516", "Taxation Inspector", "ANZSCO"),

            /// The train examiner

    TrainExaminer("599517", "Train Examiner", "ANZSCO"),

            /// The transport operations inspector

    TransportOperationsInspector("599518", "Transport Operations Inspector", "ANZSCO"),

            /// The water inspector

    WaterInspector("599521", "Water Inspector", "ANZSCO"),

            /// The inspectorsand regulatory officersnec

    InspectorsandRegulatoryOfficersnec("599599", "Inspectors and Regulatory Officers nec", "ANZSCO"),

            /// The insurance investigators loss adjustersand risk surveyorsnfd

    InsuranceInvestigatorsLossAdjustersandRiskSurveyorsnfd("599600", "Insurance Investigators, Loss Adjusters and Risk Surveyors nfd", "ANZSCO"),

            /// The insurance investigator

    InsuranceInvestigator("599611", "Insurance Investigator", "ANZSCO"),

            /// The insurance loss adjuster

    InsuranceLossAdjuster("599612", "Insurance Loss Adjuster", "ANZSCO"),

            /// The insurance risk surveyor

    InsuranceRiskSurveyor("599613", "Insurance Risk Surveyor", "ANZSCO"),

            /// The library assistant

    LibraryAssistant("599711", "Library Assistant", "ANZSCO"),

            /// The other miscellaneous clericaland administrative workersnfd

    OtherMiscellaneousClericalandAdministrativeWorkersnfd("599900", "Other Miscellaneous Clerical and Administrative Workers nfd", "ANZSCO"),

            /// The production assistant film television radioor stage

    ProductionAssistantFilmTelevisionRadioorStage("599912", "Production Assistant (Film, Television, Radio or Stage)", "ANZSCO"),

            /// The proof reader

    ProofReader("599913", "Proof Reader", "ANZSCO"),

            /// The radio despatcher

    RadioDespatcher("599914", "Radio Despatcher", "ANZSCO"),

            /// The clinical coder

    ClinicalCoder("599915", "Clinical Coder", "ANZSCO"),

            /// The facilities administrator

    FacilitiesAdministrator("599916", "Facilities Administrator", "ANZSCO"),

            /// The clericaland administrative workersnec

    ClericalandAdministrativeWorkersnec("599999", "Clerical and Administrative Workers nec", "ANZSCO"),

            /// The sales workersnfd

    SalesWorkersnfd("600000", "Sales Workers nfd", "ANZSCO"),

            /// The sales representativesand agentsnfd

    SalesRepresentativesandAgentsnfd("610000", "Sales Representatives and Agents nfd", "ANZSCO"),

            /// The insurance agentsand sales representativesnfd

    InsuranceAgentsandSalesRepresentativesnfd("611000", "Insurance Agents and Sales Representatives nfd", "ANZSCO"),

            /// The auctioneersand stockand station agentsnfd

    AuctioneersandStockandStationAgentsnfd("611100", "Auctioneers, and Stock and Station Agents nfd", "ANZSCO"),

            /// The auctioneer

    Auctioneer("611111", "Auctioneer", "ANZSCO"),

            /// The stockand station agent

    StockandStationAgent("611112", "Stock and Station Agent", "ANZSCO"),

            /// The insurance agent

    InsuranceAgent("611211", "Insurance Agent", "ANZSCO"),

            /// The sales representativesnfd

    SalesRepresentativesnfd("611300", "Sales Representatives nfd", "ANZSCO"),

            /// The sales representative buildingand plumbing supplies

    SalesRepresentativeBuildingandPlumbingSupplies("611311", "Sales Representative (Building and Plumbing Supplies)", "ANZSCO"),

            /// The sales representative business services

    SalesRepresentativeBusinessServices("611312", "Sales Representative (Business Services)", "ANZSCO"),

            /// The sales representative motor vehicle partsand accessories

    SalesRepresentativeMotorVehiclePartsandAccessories("611313", "Sales Representative (Motor Vehicle Parts and Accessories)", "ANZSCO"),

            /// The sales representative personaland household goods

    SalesRepresentativePersonalandHouseholdGoods("611314", "Sales Representative (Personal and Household Goods)", "ANZSCO"),

            /// The sales representativesnec

    SalesRepresentativesnec("611399", "Sales Representatives nec", "ANZSCO"),

            /// The real estate sales agentsnfd

    RealEstateSalesAgentsnfd("612100", "Real Estate Sales Agents nfd", "ANZSCO"),

            /// The business broker

    BusinessBroker("612111", "Business Broker", "ANZSCO"),

            /// The property manager

    PropertyManager("612112", "Property Manager", "ANZSCO"),

            /// The real estate agency principal

    RealEstateAgencyPrincipal("612113", "Real Estate Agency Principal", "ANZSCO"),

            /// The real estate agent

    RealEstateAgent("612114", "Real Estate Agent", "ANZSCO"),

            /// The real estate representative

    RealEstateRepresentative("612115", "Real Estate Representative", "ANZSCO"),

            /// The sales assistantsand salespersonsnfd

    SalesAssistantsandSalespersonsnfd("621000", "Sales Assistants and Salespersons nfd", "ANZSCO"),

            /// The sales assistant general

    SalesAssistantGeneral("621111", "Sales Assistant (General)", "ANZSCO"),

            /// The ICT sales assistant

    ICTSalesAssistant("621211", "ICT Sales Assistant", "ANZSCO"),

            /// The motor vehicleand vehicle parts salespersonsnfd

    MotorVehicleandVehiclePartsSalespersonsnfd("621300", "Motor Vehicle and Vehicle Parts Salespersons nfd", "ANZSCO"),

            /// The motor vehicleor caravan salesperson

    MotorVehicleorCaravanSalesperson("621311", "Motor Vehicle or Caravan Salesperson", "ANZSCO"),

            /// The motor vehicle parts interpreter

    MotorVehiclePartsInterpreter("621312", "Motor Vehicle Parts Interpreter", "ANZSCO"),

            /// The pharmacy sales assistant

    PharmacySalesAssistant("621411", "Pharmacy Sales Assistant", "ANZSCO"),

            /// The retail supervisor

    RetailSupervisor("621511", "Retail Supervisor", "ANZSCO"),

            /// The service station attendant

    ServiceStationAttendant("621611", "Service Station Attendant", "ANZSCO"),

            /// The street vendorsand related salespersonsnfd

    StreetVendorsandRelatedSalespersonsnfd("621700", "Street Vendors and Related Salespersons nfd", "ANZSCO"),

            /// The cash van salesperson

    CashVanSalesperson("621711", "Cash Van Salesperson", "ANZSCO"),

            /// The doortodoor salesperson

    DoortodoorSalesperson("621712", "Door-to-door Salesperson", "ANZSCO"),

            /// The street vendor

    StreetVendor("621713", "Street Vendor", "ANZSCO"),

            /// The other sales assistantsand salespersonsnfd

    OtherSalesAssistantsandSalespersonsnfd("621900", "Other Sales Assistants and Salespersons nfd", "ANZSCO"),

            /// The materials recycler

    MaterialsRecycler("621911", "Materials Recycler", "ANZSCO"),

            /// The rental salesperson

    RentalSalesperson("621912", "Rental Salesperson", "ANZSCO"),

            /// The sales assistantsand salespersonsnec

    SalesAssistantsandSalespersonsnec("621999", "Sales Assistants and Salespersons nec", "ANZSCO"),

            /// The sales support workersnfd

    SalesSupportWorkersnfd("630000", "Sales Support Workers nfd", "ANZSCO"),

            /// The checkout operatorsand office cashiersnfd

    CheckoutOperatorsandOfficeCashiersnfd("631100", "Checkout Operators and Office Cashiers nfd", "ANZSCO"),

            /// The checkout operator

    CheckoutOperator("631111", "Checkout Operator", "ANZSCO"),

            /// The office cashier

    OfficeCashier("631112", "Office Cashier", "ANZSCO"),

            /// The miscellaneous sales support workersnfd

    MiscellaneousSalesSupportWorkersnfd("639000", "Miscellaneous Sales Support Workers nfd", "ANZSCO"),

            /// The modelsand sales demonstratorsnfd

    ModelsandSalesDemonstratorsnfd("639100", "Models and Sales Demonstrators nfd", "ANZSCO"),

            /// The model

    Model("639111", "Model", "ANZSCO"),

            /// The sales demonstrator

    SalesDemonstrator("639112", "Sales Demonstrator", "ANZSCO"),

            /// The retailand wool buyersnfd

    RetailandWoolBuyersnfd("639200", "Retail and Wool Buyers nfd", "ANZSCO"),

            /// The retail buyer

    RetailBuyer("639211", "Retail Buyer", "ANZSCO"),

            /// The wool buyer

    WoolBuyer("639212", "Wool Buyer", "ANZSCO"),

            /// The telemarketer

    Telemarketer("639311", "Telemarketer", "ANZSCO"),

            /// The ticket salespersonsnfd

    TicketSalespersonsnfd("639400", "Ticket Salespersons nfd", "ANZSCO"),

            /// The ticket seller

    TicketSeller("639411", "Ticket Seller", "ANZSCO"),

            /// The transport conductor

    TransportConductor("639412", "Transport Conductor", "ANZSCO"),

            /// The visual merchandiser

    VisualMerchandiser("639511", "Visual Merchandiser", "ANZSCO"),

            /// The other sales support worker

    OtherSalesSupportWorker("639911", "Other Sales Support Worker", "ANZSCO"),

            /// The machinery operatorsand driversnfd

    MachineryOperatorsandDriversnfd("700000", "Machinery Operators and Drivers nfd", "ANZSCO"),

            /// The machineand stationary plant operatorsnfd

    MachineandStationaryPlantOperatorsnfd("710000", "Machine and Stationary Plant Operators nfd", "ANZSCO"),

            /// The machine operatorsnfd

    MachineOperatorsnfd("711000", "Machine Operators nfd", "ANZSCO"),

            /// The clay concrete glassand stone processing machine operatorsnfd

    ClayConcreteGlassandStoneProcessingMachineOperatorsnfd("711100", "Clay, Concrete, Glass and Stone Processing Machine Operators nfd", "ANZSCO"),

            /// The clay products machine operator

    ClayProductsMachineOperator("711111", "Clay Products Machine Operator", "ANZSCO"),

            /// The concrete products machine operator

    ConcreteProductsMachineOperator("711112", "Concrete Products Machine Operator", "ANZSCO"),

            /// The glass production machine operator

    GlassProductionMachineOperator("711113", "Glass Production Machine Operator", "ANZSCO"),

            /// The stone processing machine operator

    StoneProcessingMachineOperator("711114", "Stone Processing Machine Operator", "ANZSCO"),

            /// The clay concrete glassand stone processing machine operatorsnec

    ClayConcreteGlassandStoneProcessingMachineOperatorsnec("711199", "Clay, Concrete, Glass and Stone Processing Machine Operators nec", "ANZSCO"),

            /// The industrial spraypainter

    IndustrialSpraypainter("711211", "Industrial Spraypainter", "ANZSCO"),

            /// The paperand wood processing machine operatorsnfd

    PaperandWoodProcessingMachineOperatorsnfd("711300", "Paper and Wood Processing Machine Operators nfd", "ANZSCO"),

            /// The paper products machine operator

    PaperProductsMachineOperator("711311", "Paper Products Machine Operator", "ANZSCO"),

            /// The sawmilling operator

    SawmillingOperator("711313", "Sawmilling Operator", "ANZSCO"),

            /// The other wood processing machine operator

    OtherWoodProcessingMachineOperator("711314", "Other Wood Processing Machine Operator", "ANZSCO"),

            /// The photographic developerand printer

    PhotographicDeveloperandPrinter("711411", "Photographic Developer and Printer", "ANZSCO"),

            /// The plasticsand rubber production machine operatorsnfd

    PlasticsandRubberProductionMachineOperatorsnfd("711500", "Plastics and Rubber Production Machine Operators nfd", "ANZSCO"),

            /// The plastic cablemaking machine operator

    PlasticCablemakingMachineOperator("711511", "Plastic Cablemaking Machine Operator", "ANZSCO"),

            /// The plastic compoundingand reclamation machine operator

    PlasticCompoundingandReclamationMachineOperator("711512", "Plastic Compounding and Reclamation Machine Operator", "ANZSCO"),

            /// The plastics fabricatoror welder

    PlasticsFabricatororWelder("711513", "Plastics Fabricator or Welder", "ANZSCO"),

            /// The plastics production machine operator general

    PlasticsProductionMachineOperatorGeneral("711514", "Plastics Production Machine Operator (General)", "ANZSCO"),

            /// The reinforced plasticand composite production worker

    ReinforcedPlasticandCompositeProductionWorker("711515", "Reinforced Plastic and Composite Production Worker", "ANZSCO"),

            /// The rubber production machine operator

    RubberProductionMachineOperator("711516", "Rubber Production Machine Operator", "ANZSCO"),

            /// The plasticsand rubber production machine operatorsnec

    PlasticsandRubberProductionMachineOperatorsnec("711599", "Plastics and Rubber Production Machine Operators nec", "ANZSCO"),

            /// The sewing machinist

    SewingMachinist("711611", "Sewing Machinist", "ANZSCO"),

            /// The textileand footwear production machine operatorsnfd

    TextileandFootwearProductionMachineOperatorsnfd("711700", "Textile and Footwear Production Machine Operators nfd", "ANZSCO"),

            /// The footwear production machine operator

    FootwearProductionMachineOperator("711711", "Footwear Production Machine Operator", "ANZSCO"),

            /// The hideand skin processing machine operator

    HideandSkinProcessingMachineOperator("711712", "Hide and Skin Processing Machine Operator", "ANZSCO"),

            /// The knitting machine operator

    KnittingMachineOperator("711713", "Knitting Machine Operator", "ANZSCO"),

            /// The textile dyeingand finishing machine operator

    TextileDyeingandFinishingMachineOperator("711714", "Textile Dyeing and Finishing Machine Operator", "ANZSCO"),

            /// The weaving machine operator

    WeavingMachineOperator("711715", "Weaving Machine Operator", "ANZSCO"),

            /// The yarn cardingand spinning machine operator

    YarnCardingandSpinningMachineOperator("711716", "Yarn Carding and Spinning Machine Operator", "ANZSCO"),

            /// The textileand footwear production machine operatorsnec

    TextileandFootwearProductionMachineOperatorsnec("711799", "Textile and Footwear Production Machine Operators nec", "ANZSCO"),

            /// The other machine operatorsnfd

    OtherMachineOperatorsnfd("711900", "Other Machine Operators nfd", "ANZSCO"),

            /// The chemical production machine operator

    ChemicalProductionMachineOperator("711911", "Chemical Production Machine Operator", "ANZSCO"),

            /// The motion picture projectionist

    MotionPictureProjectionist("711912", "Motion Picture Projectionist", "ANZSCO"),

            /// The sand blaster

    SandBlaster("711913", "Sand Blaster", "ANZSCO"),

            /// The sterilisation technician

    SterilisationTechnician("711914", "Sterilisation Technician", "ANZSCO"),

            /// The machine operatorsnec

    MachineOperatorsnec("711999", "Machine Operators nec", "ANZSCO"),

            /// The stationary plant operatorsnfd

    StationaryPlantOperatorsnfd("712000", "Stationary Plant Operators nfd", "ANZSCO"),

            /// The crane hoistor lift operator

    CraneHoistorLiftOperator("712111", "Crane, Hoist or Lift Operator", "ANZSCO"),

            /// The drillers minersand shot firersnfd

    DrillersMinersandShotFirersnfd("712200", "Drillers, Miners and Shot Firers nfd", "ANZSCO"),

            /// The driller

    Driller("712211", "Driller", "ANZSCO"),

            /// The miner

    Miner("712212", "Miner", "ANZSCO"),

            /// The shot firer

    ShotFirer("712213", "Shot Firer", "ANZSCO"),

            /// The engineering production worker

    EngineeringProductionWorker("712311", "Engineering Production Worker", "ANZSCO"),

            /// The other stationary plant operatorsnfd

    OtherStationaryPlantOperatorsnfd("712900", "Other Stationary Plant Operators nfd", "ANZSCO"),

            /// The boileror engine operator

    BoilerorEngineOperator("712911", "Boiler or Engine Operator", "ANZSCO"),

            /// The bulk materials handling plant operator

    BulkMaterialsHandlingPlantOperator("712912", "Bulk Materials Handling Plant Operator", "ANZSCO"),

            /// The cement production plant operator

    CementProductionPlantOperator("712913", "Cement Production Plant Operator", "ANZSCO"),

            /// The concrete batching plant operator

    ConcreteBatchingPlantOperator("712914", "Concrete Batching Plant Operator", "ANZSCO"),

            /// The concrete pump operator

    ConcretePumpOperator("712915", "Concrete Pump Operator", "ANZSCO"),

            /// The paperand pulp mill operator

    PaperandPulpMillOperator("712916", "Paper and Pulp Mill Operator", "ANZSCO"),

            /// The railway signal operator

    RailwaySignalOperator("712917", "Railway Signal Operator", "ANZSCO"),

            /// The train controller

    TrainController("712918", "Train Controller", "ANZSCO"),

            /// The waste wateror water plant operator

    WasteWaterorWaterPlantOperator("712921", "Waste Water or Water Plant Operator", "ANZSCO"),

            /// The weighbridge operator

    WeighbridgeOperator("712922", "Weighbridge Operator", "ANZSCO"),

            /// The stationary plant operatorsnec

    StationaryPlantOperatorsnec("712999", "Stationary Plant Operators nec", "ANZSCO"),

            /// The mobile plant operatorsnfd

    MobilePlantOperatorsnfd("721000", "Mobile Plant Operators nfd", "ANZSCO"),

            /// The agricultural forestryand horticultural plant operatorsnfd

    AgriculturalForestryandHorticulturalPlantOperatorsnfd("721100", "Agricultural, Forestry and Horticultural Plant Operators nfd", "ANZSCO"),

            /// The agriculturaland horticultural mobile plant operator

    AgriculturalandHorticulturalMobilePlantOperator("721111", "Agricultural and Horticultural Mobile Plant Operator", "ANZSCO"),

            /// The logging plant operator

    LoggingPlantOperator("721112", "Logging Plant Operator", "ANZSCO"),

            /// The earthmoving plant operatorsnfd

    EarthmovingPlantOperatorsnfd("721200", "Earthmoving Plant Operators nfd", "ANZSCO"),

            /// The earthmoving plant operator general

    EarthmovingPlantOperatorGeneral("721211", "Earthmoving Plant Operator (General)", "ANZSCO"),

            /// The backhoe operator

    BackhoeOperator("721212", "Backhoe Operator", "ANZSCO"),

            /// The bulldozer operator

    BulldozerOperator("721213", "Bulldozer Operator", "ANZSCO"),

            /// The excavator operator

    ExcavatorOperator("721214", "Excavator Operator", "ANZSCO"),

            /// The grader operator

    GraderOperator("721215", "Grader Operator", "ANZSCO"),

            /// The loader operator

    LoaderOperator("721216", "Loader Operator", "ANZSCO"),

            /// The forklift driver

    ForkliftDriver("721311", "Forklift Driver", "ANZSCO"),

            /// The other mobile plant operatorsnfd

    OtherMobilePlantOperatorsnfd("721900", "Other Mobile Plant Operators nfd", "ANZSCO"),

            /// The aircraft baggage handlerand airline ground crew

    AircraftBaggageHandlerandAirlineGroundCrew("721911", "Aircraft Baggage Handler and Airline Ground Crew", "ANZSCO"),

            /// The linemarker

    Linemarker("721912", "Linemarker", "ANZSCO"),

            /// The paving plant operator

    PavingPlantOperator("721913", "Paving Plant Operator", "ANZSCO"),

            /// The railway track plant operator

    RailwayTrackPlantOperator("721914", "Railway Track Plant Operator", "ANZSCO"),

            /// The road roller operator

    RoadRollerOperator("721915", "Road Roller Operator", "ANZSCO"),

            /// The streetsweeper operator

    StreetsweeperOperator("721916", "Streetsweeper Operator", "ANZSCO"),

            /// The mobile plant operatorsnec

    MobilePlantOperatorsnec("721999", "Mobile Plant Operators nec", "ANZSCO"),

            /// The roadand rail driversnfd

    RoadandRailDriversnfd("730000", "Road and Rail Drivers nfd", "ANZSCO"),

            /// The automobile busand rail driversnfd

    AutomobileBusandRailDriversnfd("731000", "Automobile, Bus and Rail Drivers nfd", "ANZSCO"),

            /// The automobile driversnfd

    AutomobileDriversnfd("731100", "Automobile Drivers nfd", "ANZSCO"),

            /// The chauffeur

    Chauffeur("731111", "Chauffeur", "ANZSCO"),

            /// The taxi driver

    TaxiDriver("731112", "Taxi Driver", "ANZSCO"),

            /// The automobile driversnec

    AutomobileDriversnec("731199", "Automobile Drivers nec", "ANZSCO"),

            /// The busand coach driversnfd

    BusandCoachDriversnfd("731200", "Bus and Coach Drivers nfd", "ANZSCO"),

            /// The bus driver

    BusDriver("731211", "Bus Driver", "ANZSCO"),

            /// The charterand tour bus driver

    CharterandTourBusDriver("731212", "Charter and Tour Bus Driver", "ANZSCO"),

            /// The passenger coach driver

    PassengerCoachDriver("731213", "Passenger Coach Driver", "ANZSCO"),

            /// The trainand tram driversnfd

    TrainandTramDriversnfd("731300", "Train and Tram Drivers nfd", "ANZSCO"),

            /// The train driver

    TrainDriver("731311", "Train Driver", "ANZSCO"),

            /// The tram driver

    TramDriver("731312", "Tram Driver", "ANZSCO"),

            /// The delivery driver

    DeliveryDriver("732111", "Delivery Driver", "ANZSCO"),

            /// The truck driversnfd

    TruckDriversnfd("733100", "Truck Drivers nfd", "ANZSCO"),

            /// The truck driver general

    TruckDriverGeneral("733111", "Truck Driver (General)", "ANZSCO"),

            /// The aircraft refueller

    AircraftRefueller("733112", "Aircraft Refueller", "ANZSCO"),

            /// The furniture removalist

    FurnitureRemovalist("733113", "Furniture Removalist", "ANZSCO"),

            /// The tanker driver

    TankerDriver("733114", "Tanker Driver", "ANZSCO"),

            /// The tow truck driver

    TowTruckDriver("733115", "Tow Truck Driver", "ANZSCO"),

            /// The storeperson

    Storeperson("741111", "Storeperson", "ANZSCO"),

            /// The labourersnfd

    Labourersnfd("800000", "Labourers nfd", "ANZSCO"),

            /// The cleanersand laundry workersnfd

    CleanersandLaundryWorkersnfd("811000", "Cleaners and Laundry Workers nfd", "ANZSCO"),

            /// The car detailer

    CarDetailer("811111", "Car Detailer", "ANZSCO"),

            /// The commercial cleaner

    CommercialCleaner("811211", "Commercial Cleaner", "ANZSCO"),

            /// The domestic cleaner

    DomesticCleaner("811311", "Domestic Cleaner", "ANZSCO"),

            /// The housekeepersnfd

    Housekeepersnfd("811400", "Housekeepers nfd", "ANZSCO"),

            /// The commercial housekeeper

    CommercialHousekeeper("811411", "Commercial Housekeeper", "ANZSCO"),

            /// The domestic housekeeper

    DomesticHousekeeper("811412", "Domestic Housekeeper", "ANZSCO"),

            /// The laundry workersnfd

    LaundryWorkersnfd("811500", "Laundry Workers nfd", "ANZSCO"),

            /// The laundry worker general

    LaundryWorkerGeneral("811511", "Laundry Worker (General)", "ANZSCO"),

            /// The drycleaner

    Drycleaner("811512", "Drycleaner", "ANZSCO"),

            /// The ironeror presser

    IronerorPresser("811513", "Ironer or Presser", "ANZSCO"),

            /// The other cleanersnfd

    OtherCleanersnfd("811600", "Other Cleaners nfd", "ANZSCO"),

            /// The carpet cleaner

    CarpetCleaner("811611", "Carpet Cleaner", "ANZSCO"),

            /// The window cleaner

    WindowCleaner("811612", "Window Cleaner", "ANZSCO"),

            /// The cleanersnec

    Cleanersnec("811699", "Cleaners nec", "ANZSCO"),

            /// The constructionand mining labourersnfd

    ConstructionandMiningLabourersnfd("821000", "Construction and Mining Labourers nfd", "ANZSCO"),

            /// The buildingand plumbing labourersnfd

    BuildingandPlumbingLabourersnfd("821100", "Building and Plumbing Labourers nfd", "ANZSCO"),

            /// The builders labourer

    BuildersLabourer("821111", "Builder's Labourer", "ANZSCO"),

            /// The drainage sewerageand stormwater labourer

    DrainageSewerageandStormwaterLabourer("821112", "Drainage, Sewerage and Stormwater Labourer", "ANZSCO"),

            /// The earthmoving labourer

    EarthmovingLabourer("821113", "Earthmoving Labourer", "ANZSCO"),

            /// The plumbers assistant

    PlumbersAssistant("821114", "Plumber's Assistant", "ANZSCO"),

            /// The concreter

    Concreter("821211", "Concreter", "ANZSCO"),

            /// The fencer

    Fencer("821311", "Fencer", "ANZSCO"),

            /// The insulationand home improvement installersnfd

    InsulationandHomeImprovementInstallersnfd("821400", "Insulation and Home Improvement Installers nfd", "ANZSCO"),

            /// The building insulation installer

    BuildingInsulationInstaller("821411", "Building Insulation Installer", "ANZSCO"),

            /// The home improvement installer

    HomeImprovementInstaller("821412", "Home Improvement Installer", "ANZSCO"),

            /// The pavingand surfacing labourer

    PavingandSurfacingLabourer("821511", "Paving and Surfacing Labourer", "ANZSCO"),

            /// The railway track worker

    RailwayTrackWorker("821611", "Railway Track Worker", "ANZSCO"),

            /// The structural steel construction workersnfd

    StructuralSteelConstructionWorkersnfd("821700", "Structural Steel Construction Workers nfd", "ANZSCO"),

            /// The construction rigger

    ConstructionRigger("821711", "Construction Rigger", "ANZSCO"),

            /// The scaffolder

    Scaffolder("821712", "Scaffolder", "ANZSCO"),

            /// The steel fixer

    SteelFixer("821713", "Steel Fixer", "ANZSCO"),

            /// The structural steel erector

    StructuralSteelErector("821714", "Structural Steel Erector", "ANZSCO"),

            /// The other constructionand mining labourersnfd

    OtherConstructionandMiningLabourersnfd("821900", "Other Construction and Mining Labourers nfd", "ANZSCO"),

            /// The crane chaser

    CraneChaser("821911", "Crane Chaser", "ANZSCO"),

            /// The drillers assistant

    DrillersAssistant("821912", "Driller's Assistant", "ANZSCO"),

            /// The lagger

    Lagger("821913", "Lagger", "ANZSCO"),

            /// The mining support worker

    MiningSupportWorker("821914", "Mining Support Worker", "ANZSCO"),

            /// The surveyors assistant

    SurveyorsAssistant("821915", "Surveyor's Assistant", "ANZSCO"),

            /// The factory process workersnfd

    FactoryProcessWorkersnfd("830000", "Factory Process Workers nfd", "ANZSCO"),

            /// The food process workersnfd

    FoodProcessWorkersnfd("831000", "Food Process Workers nfd", "ANZSCO"),

            /// The foodand drink factory workersnfd

    FoodandDrinkFactoryWorkersnfd("831100", "Food and Drink Factory Workers nfd", "ANZSCO"),

            /// The baking factory worker

    BakingFactoryWorker("831111", "Baking Factory Worker", "ANZSCO"),

            /// The brewery worker

    BreweryWorker("831112", "Brewery Worker", "ANZSCO"),

            /// The confectionery maker

    ConfectioneryMaker("831113", "Confectionery Maker", "ANZSCO"),

            /// The dairy products maker

    DairyProductsMaker("831114", "Dairy Products Maker", "ANZSCO"),

            /// The fruitand vegetable factory worker

    FruitandVegetableFactoryWorker("831115", "Fruit and Vegetable Factory Worker", "ANZSCO"),

            /// The grain mill worker

    GrainMillWorker("831116", "Grain Mill Worker", "ANZSCO"),

            /// The sugar mill worker

    SugarMillWorker("831117", "Sugar Mill Worker", "ANZSCO"),

            /// The winery cellar hand

    WineryCellarHand("831118", "Winery Cellar Hand", "ANZSCO"),

            /// The foodand drink factory workersnec

    FoodandDrinkFactoryWorkersnec("831199", "Food and Drink Factory Workers nec", "ANZSCO"),

            /// The meat bonersand slicersand slaughterersnfd

    MeatBonersandSlicersandSlaughterersnfd("831200", "Meat Boners and Slicers, and Slaughterers nfd", "ANZSCO"),

            /// The meat bonerand slicer

    MeatBonerandSlicer("831211", "Meat Boner and Slicer", "ANZSCO"),

            /// The slaughterer

    Slaughterer("831212", "Slaughterer", "ANZSCO"),

            /// The meat poultryand seafood process workersnfd

    MeatPoultryandSeafoodProcessWorkersnfd("831300", "Meat, Poultry and Seafood Process Workers nfd", "ANZSCO"),

            /// The meat process worker

    MeatProcessWorker("831311", "Meat Process Worker", "ANZSCO"),

            /// The poultry process worker

    PoultryProcessWorker("831312", "Poultry Process Worker", "ANZSCO"),

            /// The seafood process worker

    SeafoodProcessWorker("831313", "Seafood Process Worker", "ANZSCO"),

            /// The packersand product assemblersnfd

    PackersandProductAssemblersnfd("832000", "Packers and Product Assemblers nfd", "ANZSCO"),

            /// The packersnfd

    Packersnfd("832100", "Packers nfd", "ANZSCO"),

            /// The chocolate packer

    ChocolatePacker("832111", "Chocolate Packer", "ANZSCO"),

            /// The container filler

    ContainerFiller("832112", "Container Filler", "ANZSCO"),

            /// The fruitand vegetable packer

    FruitandVegetablePacker("832113", "Fruit and Vegetable Packer", "ANZSCO"),

            /// The meat packer

    MeatPacker("832114", "Meat Packer", "ANZSCO"),

            /// The seafood packer

    SeafoodPacker("832115", "Seafood Packer", "ANZSCO"),

            /// The packersnec

    Packersnec("832199", "Packers nec", "ANZSCO"),

            /// The product assembler

    ProductAssembler("832211", "Product Assembler", "ANZSCO"),

            /// The miscellaneous factory process workersnfd

    MiscellaneousFactoryProcessWorkersnfd("839000", "Miscellaneous Factory Process Workers nfd", "ANZSCO"),

            /// The metal engineering process worker

    MetalEngineeringProcessWorker("839111", "Metal Engineering Process Worker", "ANZSCO"),

            /// The plasticsand rubber factory workersnfd

    PlasticsandRubberFactoryWorkersnfd("839200", "Plastics and Rubber Factory Workers nfd", "ANZSCO"),

            /// The plastics factory worker

    PlasticsFactoryWorker("839211", "Plastics Factory Worker", "ANZSCO"),

            /// The rubber factory worker

    RubberFactoryWorker("839212", "Rubber Factory Worker", "ANZSCO"),

            /// The product quality controllersnfd

    ProductQualityControllersnfd("839300", "Product Quality Controllers nfd", "ANZSCO"),

            /// The product examiner

    ProductExaminer("839311", "Product Examiner", "ANZSCO"),

            /// The product grader

    ProductGrader("839312", "Product Grader", "ANZSCO"),

            /// The product tester

    ProductTester("839313", "Product Tester", "ANZSCO"),

            /// The timberand wood process workersnfd

    TimberandWoodProcessWorkersnfd("839400", "Timber and Wood Process Workers nfd", "ANZSCO"),

            /// The paperand pulp mill worker

    PaperandPulpMillWorker("839411", "Paper and Pulp Mill Worker", "ANZSCO"),

            /// The sawmillor timber yard worker

    SawmillorTimberYardWorker("839412", "Sawmill or Timber Yard Worker", "ANZSCO"),

            /// The woodand wood products factory worker

    WoodandWoodProductsFactoryWorker("839413", "Wood and Wood Products Factory Worker", "ANZSCO"),

            /// The other factory process workersnfd

    OtherFactoryProcessWorkersnfd("839900", "Other Factory Process Workers nfd", "ANZSCO"),

            /// The cementand concrete plant worker

    CementandConcretePlantWorker("839911", "Cement and Concrete Plant Worker", "ANZSCO"),

            /// The chemical plant worker

    ChemicalPlantWorker("839912", "Chemical Plant Worker", "ANZSCO"),

            /// The clay processing factory worker

    ClayProcessingFactoryWorker("839913", "Clay Processing Factory Worker", "ANZSCO"),

            /// The fabricand textile factory worker

    FabricandTextileFactoryWorker("839914", "Fabric and Textile Factory Worker", "ANZSCO"),

            /// The footwear factory worker

    FootwearFactoryWorker("839915", "Footwear Factory Worker", "ANZSCO"),

            /// The glass processing worker

    GlassProcessingWorker("839916", "Glass Processing Worker", "ANZSCO"),

            /// The hideand skin processing worker

    HideandSkinProcessingWorker("839917", "Hide and Skin Processing Worker", "ANZSCO"),

            /// The recycling worker

    RecyclingWorker("839918", "Recycling Worker", "ANZSCO"),

            /// The factory process workersnec

    FactoryProcessWorkersnec("839999", "Factory Process Workers nec", "ANZSCO"),

            /// The farm forestryand garden workersnfd

    FarmForestryandGardenWorkersnfd("841000", "Farm, Forestry and Garden Workers nfd", "ANZSCO"),

            /// The aquaculture worker

    AquacultureWorker("841111", "Aquaculture Worker", "ANZSCO"),

            /// The crop farm workersnfd

    CropFarmWorkersnfd("841200", "Crop Farm Workers nfd", "ANZSCO"),

            /// The fruitor nut farm worker

    FruitorNutFarmWorker("841211", "Fruit or Nut Farm Worker", "ANZSCO"),

            /// The fruitor nut picker

    FruitorNutPicker("841212", "Fruit or Nut Picker", "ANZSCO"),

            /// The grain oilseedor pasture farm worker

    GrainOilseedorPastureFarmWorker("841213", "Grain, Oilseed or Pasture Farm Worker", "ANZSCO"),

            /// The vegetable farm worker

    VegetableFarmWorker("841214", "Vegetable Farm Worker", "ANZSCO"),

            /// The vegetable picker

    VegetablePicker("841215", "Vegetable Picker", "ANZSCO"),

            /// The vineyard worker

    VineyardWorker("841216", "Vineyard Worker", "ANZSCO"),

            /// The mushroom picker

    MushroomPicker("841217", "Mushroom Picker", "ANZSCO"),

            /// The crop farm workersnec

    CropFarmWorkersnec("841299", "Crop Farm Workers nec", "ANZSCO"),

            /// The forestryand logging workersnfd

    ForestryandLoggingWorkersnfd("841300", "Forestry and Logging Workers nfd", "ANZSCO"),

            /// The forestry worker

    ForestryWorker("841311", "Forestry Worker", "ANZSCO"),

            /// The logging assistant

    LoggingAssistant("841312", "Logging Assistant", "ANZSCO"),

            /// The tree faller

    TreeFaller("841313", "Tree Faller", "ANZSCO"),

            /// The gardenand nursery labourersnfd

    GardenandNurseryLabourersnfd("841400", "Garden and Nursery Labourers nfd", "ANZSCO"),

            /// The garden labourer

    GardenLabourer("841411", "Garden Labourer", "ANZSCO"),

            /// The horticultural nursery assistant

    HorticulturalNurseryAssistant("841412", "Horticultural Nursery Assistant", "ANZSCO"),

            /// The livestock farm workersnfd

    LivestockFarmWorkersnfd("841500", "Livestock Farm Workers nfd", "ANZSCO"),

            /// The beef cattle farm worker

    BeefCattleFarmWorker("841511", "Beef Cattle Farm Worker", "ANZSCO"),

            /// The dairy cattle farm worker

    DairyCattleFarmWorker("841512", "Dairy Cattle Farm Worker", "ANZSCO"),

            /// The mixed livestock farm worker

    MixedLivestockFarmWorker("841513", "Mixed Livestock Farm Worker", "ANZSCO"),

            /// The poultry farm worker

    PoultryFarmWorker("841514", "Poultry Farm Worker", "ANZSCO"),

            /// The sheep farm worker

    SheepFarmWorker("841515", "Sheep Farm Worker", "ANZSCO"),

            /// The stablehand

    Stablehand("841516", "Stablehand", "ANZSCO"),

            /// The wool handler

    WoolHandler("841517", "Wool Handler", "ANZSCO"),

            /// The livestock farm workersnec

    LivestockFarmWorkersnec("841599", "Livestock Farm Workers nec", "ANZSCO"),

            /// The mixed cropand livestock farm worker

    MixedCropandLivestockFarmWorker("841611", "Mixed Crop and Livestock Farm Worker", "ANZSCO"),

            /// The other farm forestryand garden workersnfd

    OtherFarmForestryandGardenWorkersnfd("841900", "Other Farm, Forestry and Garden Workers nfd", "ANZSCO"),

            /// The hunter trapper

    HunterTrapper("841911", "Hunter-Trapper", "ANZSCO"),

            /// The pest controller

    PestController("841913", "Pest Controller", "ANZSCO"),

            /// The farm forestryand garden workersnec

    FarmForestryandGardenWorkersnec("841999", "Farm, Forestry and Garden Workers nec", "ANZSCO"),

            /// The food preparation assistantsnfd

    FoodPreparationAssistantsnfd("851000", "Food Preparation Assistants nfd", "ANZSCO"),

            /// The fast food cook

    FastFoodCook("851111", "Fast Food Cook", "ANZSCO"),

            /// The food trades assistantsnfd

    FoodTradesAssistantsnfd("851200", "Food Trades Assistants nfd", "ANZSCO"),

            /// The pastrycooks assistant

    PastrycooksAssistant("851211", "Pastrycook's Assistant", "ANZSCO"),

            /// The food trades assistantsnec

    FoodTradesAssistantsnec("851299", "Food Trades Assistants nec", "ANZSCO"),

            /// The kitchenhand

    Kitchenhand("851311", "Kitchenhand", "ANZSCO"),

            /// The other labourersnfd

    OtherLabourersnfd("890000", "Other Labourers nfd", "ANZSCO"),

            /// The freight handlersand shelf fillersnfd

    FreightHandlersandShelfFillersnfd("891000", "Freight Handlers and Shelf Fillers nfd", "ANZSCO"),

            /// The freightand furniture handlersnfd

    FreightandFurnitureHandlersnfd("891100", "Freight and Furniture Handlers nfd", "ANZSCO"),

            /// The freight handler rail or road

    FreightHandlerRailOrRoad("891111", "Freight Handler (Rail or Road)", "ANZSCO"),

            /// The truck drivers offsider

    TruckDriversOffsider("891112", "Truck Driver's Offsider", "ANZSCO"),

            /// The waterside worker

    WatersideWorker("891113", "Waterside Worker", "ANZSCO"),

            /// The shelf filler

    ShelfFiller("891211", "Shelf Filler", "ANZSCO"),

            /// The miscellaneous labourersnfd

    MiscellaneousLabourersnfd("899000", "Miscellaneous Labourers nfd", "ANZSCO"),

            /// The caretaker

    Caretaker("899111", "Caretaker", "ANZSCO"),

            /// The deckand fishing handsnfd

    DeckandFishingHandsnfd("899200", "Deck and Fishing Hands nfd", "ANZSCO"),

            /// The deck hand

    DeckHand("899211", "Deck Hand", "ANZSCO"),

            /// The fishing hand

    FishingHand("899212", "Fishing Hand", "ANZSCO"),

            /// The handyperson

    Handyperson("899311", "Handyperson", "ANZSCO"),

            /// The motor vehicle partsand accessories fittersnfd

    MotorVehiclePartsandAccessoriesFittersnfd("899400", "Motor Vehicle Parts and Accessories Fitters nfd", "ANZSCO"),

            /// The motor vehicle partsand accessories fitter general

    MotorVehiclePartsandAccessoriesFitterGeneral("899411", "Motor Vehicle Parts and Accessories Fitter (General)", "ANZSCO"),

            /// The autoglazier

    Autoglazier("899412", "Autoglazier", "ANZSCO"),

            /// The exhaustand muffler repairer

    ExhaustandMufflerRepairer("899413", "Exhaust and Muffler Repairer", "ANZSCO"),

            /// The radiator repairer

    RadiatorRepairer("899414", "Radiator Repairer", "ANZSCO"),

            /// The tyre fitter

    TyreFitter("899415", "Tyre Fitter", "ANZSCO"),

            /// The printing assistantsand table workersnfd

    PrintingAssistantsandTableWorkersnfd("899500", "Printing Assistants and Table Workers nfd", "ANZSCO"),

            /// The printers assistant

    PrintersAssistant("899511", "Printer's Assistant", "ANZSCO"),

            /// The printing table worker

    PrintingTableWorker("899512", "Printing Table Worker", "ANZSCO"),

            /// The recyclingor rubbish collector

    RecyclingorRubbishCollector("899611", "Recycling or Rubbish Collector", "ANZSCO"),

            /// The vending machine attendant

    VendingMachineAttendant("899711", "Vending Machine Attendant", "ANZSCO"),

            /// The other miscellaneous labourersnfd

    OtherMiscellaneousLabourersnfd("899900", "Other Miscellaneous Labourers nfd", "ANZSCO"),

            /// The bicycle mechanic

    BicycleMechanic("899911", "Bicycle Mechanic", "ANZSCO"),

            /// The car park attendant

    CarParkAttendant("899912", "Car Park Attendant", "ANZSCO"),

            /// The crossing supervisor

    CrossingSupervisor("899913", "Crossing Supervisor", "ANZSCO"),

            /// The electricalor telecommunications trades assistant

    ElectricalorTelecommunicationsTradesAssistant("899914", "Electrical or Telecommunications Trades Assistant", "ANZSCO"),

            /// The leafletor newspaper deliverer

    LeafletorNewspaperDeliverer("899915", "Leaflet or Newspaper Deliverer", "ANZSCO"),

            /// The mechanics assistant

    MechanicsAssistant("899916", "Mechanic's Assistant", "ANZSCO"),

            /// The railways assistant

    RailwaysAssistant("899917", "Railways Assistant", "ANZSCO"),

            /// The sign erector

    SignErector("899918", "Sign Erector", "ANZSCO"),

            /// The ticket collectoror usher

    TicketCollectororUsher("899921", "Ticket Collector or Usher", "ANZSCO"),

            /// The trolley collector

    TrolleyCollector("899922", "Trolley Collector", "ANZSCO"),

            /// The road traffic controller

    RoadTrafficController("899923", "Road Traffic Controller", "ANZSCO"),

            /// The labourersnec

    Labourersnec("899999", "Labourers nec", "ANZSCO");

    
    private String name;
    private String code;
    private String codeSystem;

    Occupation(String code, String name, String codeSystem){
        this.code = code;
        this.name = name;
        this.codeSystem = codeSystem;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public String getCodeSystem() {
        return codeSystem;
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", Occupation.class.getSimpleName() + "[", "]")
                .add("name='" + name + "'")
                .add("code='" + code + "'")
                .add("codeSystem='" + codeSystem + "'")
                .toString();
    }
}
