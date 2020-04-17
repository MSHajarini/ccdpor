extensions [ csv ]


breed [ industry company ]
breed [ poras pora ]
breed [ governments government ]
breed [ infrastructures infrastructure ]


globals [
  ;Variables read from CO2 Price.csv
  co2-data                         ;List containing the year and the CO2 price together
  co2-price-list                   ;List of CO2 prices per year [EUR/t CO2]

  ;Variables read from Costs.csv
  capture-capex                    ;CAPEX for the capture technology [EUR/t CO2]
  capture-opex                     ;OPEX for the capture technology [MWh/t CO2]
  connection-to-hub                ;Cost of connection to the hub (= joining the infrastructure) paid to the PORA [EUR/company]
  pipe-opex                        ;OPEX for the extensible and fixed pipelines paid by the industry to the PORA [EUR/t CO2]
  pipe-capex-fixed-percentage      ;Percentage of CAPEX of fixed pipe to the extensible pipeline paid by the PORA
  electricity-price                ;Price of electricity [EUR/MWh]
  gov-budget                       ;Total budget allocated to subsidies [EUR/year]

  ;Variables read from Industry.csv
  number-of-companies              ;Number of companies in the industry
  min-oil-demand                   ;Minimum oil demand of companies [t/year]
  max-oil-demand                   ;Maximum oil demand of companies [t/year]
  emission-factor                  ;Amount of CO2 emitted by burning 1 unit oil [t CO2/t oil]

  ;Variables read from Oil Price.csv
  oil-data                         ;List containing the year and the oil price together
  oil-price-list                   ;List of oil prices per year [EUR/t oil]

  ;Variables read from Storage Locations.csv
  storage-locations-data           ;List containing the storage location, onshore-km, offshore-km, pipe-capacity, capex-onshore, and capex-offshore together
  location-list                    ;List of storage locations
  onshore-km-list                  ;List of onshore length [km]
  offshore-km-list                 ;List of offshore length [km]
  pipe-capacity-list               ;List of pipe capacity [Mt CO2/year] converted to [t CO2/year] in the model
  capex-onshore-list               ;List of capex of onshore [M EUR/km] converted to [EUR/km] in the model
  capex-offshore-list              ;List of opex of offshore [M EUR/km] converted to [EUR/km] in the model

  ;Fixed variables
  electricity-price-decrease       ;5% decrease in electricity price each year
  capture-capex-change             ;10% decrease in capture capex price each year
  capture-capacity-change          ;10% increase in capture capacity price each year

  ;Variables for each tick
  year                             ;Year (tick)
  co2-price                        ;Price of the CO2 emission this year [EUR/t CO2]
  co2-storage-price                ;Price of the CO2 storage for industry this year [EUR/t CO2]
  oil-price                        ;Price of the oil consumption this year [EUR/t oil]
  capture-capacity                 ;Maximum amount of CO2 that can be stored in the capture technology this year [t CO2]
  number-of-companies-not-joined   ;Number of companies that have not joined the infrastructure yet
  number-of-companies-joined       ;Number of companies that have joined the infrastructure last year
  number-of-companies-joining      ;Number of companies that are joining the infrastructure this year
  capex-pipe-fixed                 ;Total CAPEX required to build fixed pipeline this year
  capex-pipe-extensible            ;Total CAPEX required to build extensible pipeline this year
  announced-pipe-capacity          ;Amount of CO2 that can be stored in the pipeline whose information is released this year [t CO2]
  capacity-required                ;Amount of CO2 that the companies in total wishes to store this year [t CO2]
  capacity-available               ;Amount of CO2 that can is available to release to the companies who wants to join the infrastructure this year [t CO2]
  infra-turn-for-release           ;Turn of the storage location which will be released this year
  demand-for-storage?              ;Logical which turns TRUE if there is any company willing to join the infrastructure but was not able to join the extensible ones and FALSE otherwise
  total-construction-budget        ;Total budget that PORA has for the construction of new pipelines --> This is set equal to the pora-budget, a global to be accessed by other agents [EUR/year]
  extensible-capacity-to-sell-now  ;Total extensible capacity that PORA is selling to an interested company, which is the min of the company's demand and the remaining extensible capacity
  allocated-capacity               ;Amount of CO2 that is allocated in the new infrastructure for companies that joined the infrastructure [t CO2]

  ;Agent sets
  this-infrastructure              ;The agent set which contains the current infrastructure that is released
  this-industry                    ;The agent set which contains the current section of industry (companies) that are interested in capturing CO2
  hub                              ;The agent set containing one infrastructure which is located at the origin and corresponds to the hub to which companies connect for capturing CO2

  ;Variables calculated
  pora-subsidy                     ;Subsidy that PORA receives from the government which is calculated from the subsidy-share [EUR/year]
  industry-subsidy                 ;Subsidy that the industry will receive from the government calculated from the subsidy-share [EUR/year]

  ;Variables for UI
  scale                            ;The size of each patch [km]
  scale-list                       ;The scale list to make sure that the pipelines are within the boundaries of the view

  ;KPIs
  yearly-co2-emitted               ;Total amount of CO2 emitted to the air each year [t CO2/year]
  yearly-co2-stored                ;Total amount of CO2 stored each year [t CO2/year]
  cumulative-co2-emitted           ;Cumulative amount of CO2 emitted to the air for 32 years [t CO2]
  cumulative-co2-stored            ;Cumulative amount of CO2 stored for 32 years [t CO2]
  total-industry-cost-to-capture   ;Total costs incurred by industry to capture CO2 for 32 years [EUR]
  total-gov-subsidy-to-pora        ;Total subsidy that government paid to pora for 32 years [EUR]
  total-gov-subsidy-to-industry    ;Total subsidy that government paid to industry for 32 years [EUR]
  first-year-joining               ;First year that a company joined the infrastructure
  last-year-joining                ;Last year that all companies have joined
  duration-of-plan                 ;Number of years that have passed before all companies have joined the CCS infrastructure
]


governments-own [
  location-data                    ;List of storage locations
  onshore-km-data                  ;List of onshore length
  offshore-km-data                 ;List of offshore length
  pipe-capacity-data               ;List of pipeline capacity
  capex-onshore-data               ;List of CAPEX of onshore
  capex-offshore-data              ;List of OPEX of offshore
  co2-price-data                   ;List of CO2 price
]


poras-own [
  pora-budget                      ;Budget of PORA consisting of pora-subsidy and income-from-storage [EUR/year]
  income-from-storage              ;Income of PORA received from the industry for total pipeline OPEX [EUR/year]
  expected-income-fixed            ;Total expected income of PORA from the industry for the fixed pipeline OPEX [EUR/year]
  expected-income-extensible       ;Total expected income of PORA from industry for the extensible pipeline OPEX [EUR/year]
  build-infra?                     ;Logical which turns TRUE if PORA decides to build an infrastructure, FALSE otherwise
  build-extensible?                ;Logical which turns TRUE if PORA decides to build an extensible pipeline, FALSE otherwise
  pora-payback-period              ;15 years of payback period of PORA to recover the CAPEX [year]
  pora-expected-roi-fixed          ;Expected return on investment of PORA for fixed pipeline [EUR/year]
  pora-expected-roi-extensible     ;Expected return on investment of PORA for extensible pipeline [EUR/year]
  fixed-profit?                    ;Logical which turns TRUE if a fixed pipeline is profitable, FALSE otherwise
  extensible-profit?               ;Logical which turns TRUE if an extensible pipeline is profitable, FALSE otherwise
]


industry-own [
  company-subsidy                  ;Income from the government subsidies [EUR/year]
  join-infra?                      ;Logical which turns TRUE if a company decides to join the infrastructure, FALSE otherwise
  expected-co2-cost                ;Expected amount of money that a company will spend on the amount of CO2 they emitted [EUR/year]
  expected-opex                    ;Expected amount of money that a company will spend on the amount of CO2 they stored [EUR/year]
  company-payback-period           ;Payback period for a company which is a random uniform number between 1 to 20 [year]
  company-expected-roi             ;Expected ROI of a company [EUR/year]
  co2-produced                     ;Amount of CO2 produced by a company per year [t CO2/year]
  co2-released                     ;Amount of CO2 released by a company per year [t CO2/year]
  co2-captured                     ;Amount of CO2 captured by a company  per year [t CO2/year]
  remaining-co2-demand             ;Amount of CO2 that a company wanted to store but could not because of the capture technology capacity limitations [t CO2/year]
  oil-demand                       ;Amount of oil consumed by a company company which is a random uniform number between min and max oil demand [t oil/year]
  company-capture-capex            ;Capture CAPEX for the company, each year [EUR/year]
  min-roi                          ;Min ROI required to join the infrastructure [EUR/year]
  co2-demand                       ;Temporary variable to help with decision making [t CO2/year]
  join-year                        ;Year that a company joins the infrastructure
  demand-not-satisfied?            ;Logical which turns TRUE if the company has signed a contract but its demand is not satisfied yet, FALSE otherwise
]


links-own [
  start-year                       ;Start year of the contract
  co2-announced                    ;Amount of CO2 that a company wants to store and announces to PORA [t CO2/year]
]


infrastructures-own [
  pipe-length-onshore              ;Onshore length of the pipeline [km]
  pipe-length-offshore             ;Offshore length of the pipeline [km]
  capex-onshore                    ;Onshore CAPEX of the pipeline [EUR]
  capex-offshore                   ;Offshore CAPEX of the pipeline [EUR]
  total-capex                      ;Total CAPEX of an infrastructure [EUR]
  pipe-capacity                    ;Total capacity of an infrastructure [t CO2]

  ;Variables which are updated upon decision of pora at each tick

  pipe-under-construction?         ;Logical which turns TRUE if a pipeline is under construction, FALSE otherwise
  pipe-full?                       ;Logical which turns TRUE if a pipeline has reached its capacity, FALSE otherwise
  onshore?                         ;Logical which turns TRUE if the construction is going on onshore, FALSE if the construction is going on offshore
  pipe-extensible?                 ;Logical which turns TRUE for extensible pipeline, FALSE if fixed
  used-pipe-capacity               ;Amount of CO2 that is stored in the pipeline [t CO2/year]
  remaining-pipe-capacity          ;Remanining pipe capacity [t CO2/year]
  construction-x                   ;x-coordinate of the current storage location of the pipeline that is being built. The pipeline is constructed from the storage location towards the hub
  construction-y                   ;y-coordinate of the current storage location of the pipeline that is being built. The pipeline is constructed from the storage location towards the hub
  length-progress                  ;Total length of the pipeline that PORA can build in a year [km]
  construction-budget              ;Total share of budget that is allocated to all pipelines for construction at each tick
  commission-year                  ;Year that the pipeline construction is started
  announced-year                   ;Year that the government announces a storage location
]


;;;;;;;;;;;;;;;;;;;;;;;;
;;; SETUP PROCEDURES ;;;
;;;;;;;;;;;;;;;;;;;;;;;;


to setup
  clear-all
  ;Close any files open from last run
  file-close-all
  ;Setup the lists
  setup-lists
  ;Read data from the csv files
  read-co2-price
  read-costs
  read-industry
  read-oil-price
  read-storage-locations
  ;Setup turtles and variables
  setup-globals
  setup-governments
  setup-industry
  setup-poras
  setup-infrastructures
  ;Set the label colors to white
  ask turtles [
    set label-color white
  ]
  ;UI procedures
  show-pora-and-gov
  show-infra-names
  show-industry-name
  reset-ticks
end


to setup-globals
  set year 0
  set co2-price item 0 co2-price-list
  set oil-price item 0 oil-price-list
  set capture-capacity 5000000
  set capture-capex-change 0.9
  set capture-capacity-change 1.1
  set electricity-price-decrease 0.05
  set pora-subsidy 0
  set industry-subsidy 0
  set infra-turn-for-release 0
  set demand-for-storage? FALSE
  set scale-list [30 30 20 10 6 6 6 4.8 1 0.8 0.5 4 ]           ;This number is calculated by dividing the max of patch coordinate (50) by the max length of infrastructures (for Southern North sea, 372 km)
  set scale item 0 scale-list
  set yearly-co2-stored 0
  set number-of-companies-not-joined number-of-companies
  set number-of-companies-joined number-of-companies - number-of-companies-not-joined
  set number-of-companies-joining 0
  set capacity-required 0
  set total-construction-budget 0
  set co2-storage-price electricity-price * capture-opex + pipe-opex
  set cumulative-co2-emitted 0
  set cumulative-co2-stored 0
  set total-industry-cost-to-capture 0
  set total-gov-subsidy-to-pora 0
  set total-gov-subsidy-to-industry 0
  set first-year-joining -1
  set last-year-joining -1
  set duration-of-plan -1
end


to setup-governments
  create-governments 1
  ask governments [
    set shape "house ranch"
    set color white
    set size 20
    set label-color white
    setxy -140 170
    set location-data location-list
    set onshore-km-data onshore-km-list
    set offshore-km-data offshore-km-list
    set pipe-capacity-data pipe-capacity-list
    set capex-onshore-data capex-onshore-list
    set capex-offshore-data capex-offshore-list
    set co2-price-data co2-price-list
    hide-turtle
  ]
end


to setup-industry
  create-industry number-of-companies
  ask industry [
    set shape "factory"
    set color orange
    set size 15
    set label-color orange
    setxy random-pxcor random-pycor
    layout-circle sort industry 70
    set oil-demand random (max-oil-demand * max-oil-demand-factor - min-oil-demand) + min-oil-demand
    set join-infra? False
    set company-payback-period random (20 - 1) + 1
    set join-year -1
    set min-roi random-float 0.5 ;set number to min ROI --> random number
    set co2-produced emission-factor * oil-demand
    set yearly-co2-emitted sum [ co2-produced ] of industry
  ]
end


to setup-poras
  create-poras 1
  ask poras [
    set shape "orbit 6"
    set color blue
    set size 15
    set label-color blue
    setxy -140 140
    set pora-payback-period 15
    set build-infra? False
    set build-extensible? False
    set income-from-storage 0
    hide-turtle
  ]
end


to setup-infrastructures
  create-infrastructures 13
  ask infrastructures [
    set shape "circle"
    set size 6
    set commission-year -1
    set announced-year -1
    set pipe-extensible? false
    set pipe-under-construction? false
    set pipe-full? False
    hide-turtle
  ]
  ask infrastructure 27 [
    setxy 0 0
    set shape "x"
    set color white
    show-turtle
  ]
  set hub infrastructure 27
end


to setup-lists
  set co2-price-list []
  set oil-price-list []
  set location-list []
  set onshore-km-list []
  set offshore-km-list []
  set pipe-capacity-list []
  set capex-onshore-list []
  set capex-offshore-list []
end


;;;;;;;;;;;;;;;;;;;;;;;;
;;;; GO PROCEDURES ;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;


to go
  ;Main procedures
  distribute-subsidy
  join-infra
  ;If there is enough demand for new storage units, the government announces a new storage location, PORA makes the decision to build and contracts signed
  ;If there is not enough demand for new storage units, nothing happens in this tick
  ifelse demand-for-storage?
  [ if not any? infrastructures with [ commission-year = -1 and announced-year >= 0] [ ask governments [ announce-new-location ]]
    build-infrastructure
    update-environment ]
  [ update-environment]
  ;Update tick
  tick
  set year ticks
  ;Stop after 32 years have passed
  if ticks > 31 [
    user-message "32 years passed, end of simulation!"
    stop
  ]
end


to distribute-subsidy
  ;Count the number of companies that have joined and the ones that havent joined the infrastructure yet
  ifelse number-of-companies-not-joined > 0
  ;If there is at least one company has not joined the infrastructure, let the subsidy divided between PORA and the companies
  [
    set pora-subsidy gov-budget * subsidy-share-pora / 100
    set industry-subsidy gov-budget * (100 - subsidy-share-pora) / 100   ;
    ask industry [
      set company-subsidy industry-subsidy / number-of-companies-not-joined
    ]
  ]
  [
    set pora-subsidy gov-budget
    ask industry [
      set company-subsidy 0
    ]
  ]
end


to join-infra
  ask industry [
    ;0. update the capture technology price
    ifelse join-infra? = FALSE
    [
      ;1. Calculate the amount of CO2 produced each year
      set co2-produced emission-factor * oil-demand
      ;2. Decide how much CO2 can be stored based on the capacity of capture technology
      set co2-demand min list co2-produced capture-capacity
      ;3. Calculate the amount of money that need to be paid for CO2 within the payback period
      set expected-co2-cost co2-demand * co2-price * company-payback-period
      ;4. Calculate the OPEX for CCS; electricity price to capture the CO2 and CO2 storage price
      set expected-opex co2-demand * ((capture-opex  * electricity-price) + pipe-opex) * company-payback-period
      ;5. Calculate the CAPEX of CCS based on the active scenario assuming the company is willing to capture all of its CO2 emission
      set company-capture-capex ((capture-capex * co2-demand) + connection-to-hub - company-subsidy)
      ;Make sure company-capture-capex > 0, so it won't ruin the calculation of company-expected-roi,
      ;if company-capture-capex  happen to be 0, set it to a small number other than 0
      ifelse company-capture-capex > 0
      [set company-capture-capex company-capture-capex]
      [set company-capture-capex 0.0000000000000000001]
      ;6. Calculate the expected ROI for the company
      set company-expected-roi (expected-co2-cost - expected-opex - company-capture-capex) / company-capture-capex
      ;7. Decide to join the infrastructure
      ;If a company decides to join, and there is an ununtilized extensible pipe enough to carry CO2 from this company, they will be linked
      ifelse company-expected-roi > min-roi
      [
        set join-infra? True
        set demand-not-satisfied? True
        set capacity-required capacity-required + co2-demand
        set remaining-co2-demand co2-demand

        if any? infrastructures with [ pipe-extensible? ] [
          create-link-to hub [tie]
          ask poras [
            set income-from-storage income-from-storage + connection-to-hub
          ]
          set join-year year
          set total-gov-subsidy-to-industry total-gov-subsidy-to-industry + company-subsidy
          ;If the current demand can be allocated fully in the current extensible infrastructure
          allocate-extensible-capacity
        ]
      ]
      [
        set join-infra? False
        set demand-not-satisfied? False
      ]
    ]
    [
      if demand-not-satisfied? [
        allocate-extensible-capacity
        show-infrastructure
      ]
    ]
  ]

  ;Set the agentset containing the companies that are willing to join the new infrastructure but have not signed a contract yet
  set this-industry industry with [ not out-link-neighbor? hub and demand-not-satisfied?]
  set demand-for-storage? any? industry with [ demand-not-satisfied? ]
end


to allocate-extensible-capacity
  ifelse any? infrastructures with [ remaining-pipe-capacity > [ remaining-co2-demand ] of myself ] [
    ask infrastructures with [ pipe-extensible? and not pipe-full? ] [
      set used-pipe-capacity used-pipe-capacity + [ remaining-co2-demand ] of myself
      set remaining-pipe-capacity remaining-pipe-capacity - [ remaining-co2-demand ] of myself
      set yearly-co2-stored yearly-co2-stored + [ remaining-co2-demand ] of myself
      set yearly-co2-emitted yearly-co2-emitted - [ remaining-co2-demand ] of myself
      set pipe-full? False
      set capacity-required max list 0 (capacity-required - [ remaining-co2-demand ] of myself )
    ]
    ask poras [
      set income-from-storage income-from-storage + [ remaining-co2-demand ] of myself * pipe-opex
    ]
    set co2-captured co2-demand
    set co2-released co2-produced - co2-captured
    set remaining-co2-demand 0
    set demand-not-satisfied? False
  ]
  [
    ask infrastructures with [ pipe-extensible? and not pipe-full? ] [
      set yearly-co2-stored yearly-co2-stored + remaining-pipe-capacity
      set yearly-co2-emitted yearly-co2-emitted - remaining-pipe-capacity
      set capacity-required capacity-required - remaining-pipe-capacity
      set extensible-capacity-to-sell-now remaining-pipe-capacity
      set pipe-full? True
      set used-pipe-capacity pipe-capacity
      set remaining-pipe-capacity 0
    ]
    ask poras [
      set income-from-storage income-from-storage + extensible-capacity-to-sell-now * pipe-opex
    ]
    set co2-captured remaining-co2-demand
    set co2-released co2-produced - co2-captured
    set remaining-co2-demand remaining-co2-demand - extensible-capacity-to-sell-now
    set demand-not-satisfied? True
  ]
  ask my-links [
    set start-year year
    set co2-announced [ co2-captured ] of myself
  ]
end


to announce-new-location
  ;Set the agent set containing the infrastructure released in this year
  set this-infrastructure infrastructure (infra-turn-for-release + 28)
  ask this-infrastructure [
    ;Set the variables for the new infrastructure
    set pipe-full? False
    set pipe-capacity item infra-turn-for-release [ pipe-capacity-data ] of myself * 1000000          ;Conversion to [t CO2]
    set pipe-length-onshore item infra-turn-for-release [ onshore-km-data ] of myself
    set pipe-length-offshore item infra-turn-for-release [ offshore-km-data ] of myself
    set capex-onshore item infra-turn-for-release [ capex-onshore-data ] of myself * 1000000          ;Conversion to [EUR]
    set capex-offshore item infra-turn-for-release [ capex-offshore-data ] of myself * 1000000        ;Conversion to [EUR]
    set total-capex capex-offshore * pipe-length-offshore + capex-onshore * pipe-length-onshore
    set used-pipe-capacity 0
    set remaining-pipe-capacity pipe-capacity
    set announced-year year

    ;Set the global variables that help pora make new decision
    set capex-pipe-extensible pipe-length-onshore * capex-onshore + pipe-length-offshore * capex-offshore
    set capex-pipe-fixed pipe-capex-fixed-percentage * ( pipe-length-onshore * capex-onshore + pipe-length-offshore * capex-offshore )
    set announced-pipe-capacity pipe-capacity

    ;Set the scale for visualization
    set scale item infra-turn-for-release scale-list
    set infra-turn-for-release min list 11 (infra-turn-for-release + 1)
  ]
end


to build-infrastructure

  ask poras [
    ;Total capacity available is equal to the min of demand from industry and the total capacity that pora has, from the new infrastructure and old extensible ones
    set capacity-available min list capacity-required announced-pipe-capacity

    ;Find ROI of fixed pipeline
    set expected-income-fixed capacity-available * pipe-opex * pora-payback-period + count this-industry * connection-to-hub    ;Conversion to [EUR]
    set pora-expected-roi-fixed expected-income-fixed + pora-subsidy - capex-pipe-fixed
    ifelse pora-expected-roi-fixed > 0
      [set fixed-profit? TRUE]
    [set fixed-profit? FALSE]

    ;Find ROI of extensible pipeline
    set expected-income-extensible expected-extensible-utilization / 100 * announced-pipe-capacity * pipe-opex * pora-payback-period + count this-industry * connection-to-hub
    set pora-expected-roi-extensible expected-income-extensible + pora-subsidy - capex-pipe-extensible
    ifelse pora-expected-roi-extensible > 0
      [set extensible-profit? TRUE]
    [set extensible-profit? FALSE]

    ;PORA makes a decision to build a pipeline
    ifelse fixed-profit? or extensible-profit? and ( [ commission-year ] of this-infrastructure = -1 )
      [set build-infra? TRUE]
    [set build-infra? FALSE]

    ;PORA makes a decision to build an extensible pipeline

    if fixed-profit? and not extensible-profit?
      [set build-extensible? FALSE]
    if not fixed-profit? and extensible-profit?
      [set build-extensible? TRUE]

    if fixed-profit? and extensible-profit?
      [ifelse expected-income-fixed < expected-income-extensible
        [set build-extensible? TRUE]
        [set build-extensible? FALSE]
    ]

    ifelse build-infra? [
      sign-contract
      set pora-budget pora-subsidy + income-from-storage + pora-budget
      set total-gov-subsidy-to-pora total-gov-subsidy-to-pora + pora-subsidy
      set total-construction-budget pora-budget
      show-infrastructure
    ][
      ifelse any? infrastructures with [ pipe-under-construction? ][
        set pora-budget pora-budget + income-from-storage
        set total-construction-budget pora-budget
        show-infrastructure
      ][
        set total-construction-budget 0
      ]
    ]
  ]
end


to sign-contract
  ifelse capacity-required > capacity-available [
    allocate-new-capacity
  ]
  [
    ;Create links - called by PORA
    ask this-industry [
      set join-year year
      create-link-to hub [tie]
      set total-gov-subsidy-to-industry total-gov-subsidy-to-industry + company-subsidy
      ask my-links [
        set start-year year
        set co2-announced [remaining-co2-demand] of myself
      ]
      set co2-captured co2-demand
      set co2-released co2-produced - co2-demand
      set yearly-co2-emitted yearly-co2-emitted - co2-captured
      set yearly-co2-stored yearly-co2-stored + co2-captured
      set demand-not-satisfied? False
      set remaining-co2-demand 0
    ]

    ;changes the variables of infrastructure
    ask this-infrastructure [
      set pipe-under-construction? True
      set commission-year year
      set onshore? True
      ifelse any? poras with [ build-extensible? ]
      [ set pipe-extensible? True ]
      [ set pipe-extensible? False ]
      set used-pipe-capacity min list pipe-capacity ( used-pipe-capacity + capacity-required )
      set remaining-pipe-capacity max list 0 ( remaining-pipe-capacity - capacity-required )


      ifelse remaining-pipe-capacity <= 0
      [ set pipe-full? True ]
      [ set pipe-full? False ]
    ]
     set income-from-storage income-from-storage + capacity-required * pipe-opex
    set capacity-required 0

  ]
end


to allocate-new-capacity
  ask this-industry [
    set allocated-capacity min list ( capacity-available / count this-industry ) co2-demand

    set join-year year
    create-link-to hub [tie]
    set total-gov-subsidy-to-industry total-gov-subsidy-to-industry + company-subsidy
    ask my-links [
      set start-year year
      set co2-announced [remaining-co2-demand] of myself
    ]
    set co2-captured allocated-capacity
    set co2-released co2-produced - allocated-capacity
    set yearly-co2-emitted yearly-co2-emitted - co2-captured
    set yearly-co2-stored yearly-co2-stored + co2-captured
    set remaining-co2-demand remaining-co2-demand - allocated-capacity
    if remaining-co2-demand > 0 [ set demand-not-satisfied? True ]
  ]
  ask this-infrastructure [

    set pipe-under-construction? True
    set commission-year year
    set onshore? True
    ifelse any? poras with [ build-extensible? ]
    [ set pipe-extensible? True ]
    [ set pipe-extensible? False ]
    set used-pipe-capacity min list pipe-capacity ( used-pipe-capacity + capacity-available )
    set remaining-pipe-capacity max list 0 ( remaining-pipe-capacity - capacity-available )


    ifelse remaining-pipe-capacity <= 0
    [ set pipe-full? True ]
    [ set pipe-full? False ]
  ]
  set capacity-required capacity-required - capacity-available
  set income-from-storage income-from-storage + capacity-available * pipe-opex
end


to show-infrastructure
  ;Procedure for visualization of extensible pipe
  if [ commission-year ] of this-infrastructure = year [
  ask this-infrastructure [
    setxy 0 0
    set pen-size 2

    ifelse pipe-extensible? [
      set color yellow
      set construction-x ( - pipe-length-onshore * scale )
      set construction-y ( - pipe-length-offshore * scale )

    ] [
      set color green
      set construction-x pipe-length-onshore * scale
      set construction-y pipe-length-offshore * scale
      set total-capex total-capex * pipe-capex-fixed-percentage
    ]
    show-turtle
  ]
  ]
  ask infrastructures with [ commission-year >= 0 and pipe-under-construction? ][
    ;If the pipe is under construction
    set construction-budget total-construction-budget * ( total-capex / sum [total-capex] of infrastructures with [ commission-year >= 0 and pipe-under-construction? ])
    ifelse onshore? [
      set length-progress construction-budget / capex-onshore * scale
    ]
    [
      set length-progress construction-budget / capex-offshore * scale
    ]
    pen-down

    ifelse onshore? and not pipe-extensible? [
      ifelse floor ( xcor + length-progress ) > floor construction-x [
        setxy floor construction-x ycor
        set onshore? False

      ][
        setxy ( xcor + length-progress ) ycor
      ]
    ][
      ifelse onshore? and pipe-extensible? [
        ifelse floor abs ( xcor - length-progress ) > floor abs construction-x [
          setxy floor construction-x ycor
          set onshore? False
        ]
        [
          setxy ( xcor - length-progress ) ycor
        ]
      ][
        ifelse not onshore? and not pipe-extensible?
        [
          ifelse floor  ( ycor + length-progress ) > floor construction-y [
            setxy floor xcor construction-y

            ;set pipe-under-construction? False

          ][
            setxy xcor ( ycor + length-progress )
          ]
        ][
          ifelse not onshore? and pipe-extensible? [
            ifelse floor abs ( ycor - length-progress ) > floor abs construction-y [
              setxy floor xcor construction-y

              ;set pipe-under-construction? False

            ][
              setxy xcor ( ycor - length-progress )
            ]
          ][]
        ]

      ]

    ]
    if xcor = construction-x and ycor = construction-y [
      set pipe-under-construction? False
      pen-up
    ]

  ]
end


to update-environment
  ask governments [ set co2-price item ticks co2-price-data ]
  set number-of-companies-joined count industry with [join-infra? and out-link-neighbor? hub]
  set number-of-companies-not-joined count industry with [ not join-infra? and not out-link-neighbor? hub]

  ;Update the inputs
  set oil-price item ticks oil-price-list
  set electricity-price electricity-price * (1 - electricity-price-decrease )
  set capture-capacity capture-capacity * capture-capacity-change
  set capture-capex capture-capex-change * capture-capex
  ask poras [ set pora-budget pora-budget - total-construction-budget ]

  ;Update KPI
  set co2-storage-price capture-opex * electricity-price + pipe-opex
  set number-of-companies-joining count industry with [ join-year >= 0 ] - number-of-companies-joined ;find who want to join this year infrastructure
  set total-industry-cost-to-capture total-industry-cost-to-capture + [ income-from-storage ] of pora 26
  set cumulative-co2-stored cumulative-co2-stored + yearly-co2-stored
  set cumulative-co2-emitted cumulative-co2-emitted + yearly-co2-emitted

  if any? industry with [ join-year != -1 ]
  [ set first-year-joining min [ join-year ] of industry with [join-year >= 0]
    set last-year-joining max [ join-year ] of industry
    set duration-of-plan last-year-joining - first-year-joining
  ]
end


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;  UI SETTING PROCEDURES  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


to show-pora-and-gov
  if show-pora-turtle? [ ask poras [
    show-turtle
    set label "PORA"
  ]]
  if show-government-turtle? [ ask governments [
   set label "Government"
    show-turtle
  ]]
end


to show-infra-names
  ask infrastructures [
  ifelse show-infrastructure-label?
  [
      ifelse who != 27 [ set label item ( who - 28 ) location-list ] [set label "hub"]]
    [ set label "" ] ]
end


to show-industry-name
  ifelse show-industry-label?
  [ ask industry [ set label who ] ]
  [ ask industry [ set label "" ] ]
end

;;;;;;;;;;;;;;;;;;;;;;;;
;;;  READ PROCEDURES ;;;
;;;;;;;;;;;;;;;;;;;;;;;;


to read-co2-price
  file-close-all ;Close all open files

  if not file-exists? "CO2 Price.csv" [
    user-message "No file 'CO2 Price.csv' exists!"
    stop
  ]

  file-open "CO2 Price.csv" ;Open the file with the CO2 price data

  ;We'll read all the data in a single loop
  while [ not file-at-end? ] [
    ;Here the CSV extension grabs a single line and puts the read data in a list
    set co2-data csv:from-row file-read-line
    set co2-price-list lput item 1 co2-data co2-price-list

    ;Now we can use that list to create a turtle with the saved properties

  ]
  set co2-price-list remove-item 0 co2-price-list
  set co2-price-list remove-item 0 co2-price-list
  file-close ;Close the file
end


to read-costs
  file-close-all
  if not file-exists? "Costs.csv" [
    user-message "No file 'Costs.csv' exists!"
    stop
  ]

  file-open "Costs.csv"

  if file-at-end? [
    stop
  ]
  print file-read-line
  set capture-capex item 1 csv:from-row file-read-line                         ;unit: M EUR/Mt CO2/yr --> equal to EUR/tCo2
  set capture-opex item 1 csv:from-row file-read-line                             ;unit: MWh/t CO2
  set connection-to-hub (item 1 csv:from-row file-read-line) * 1000000         ;unit: MEUR --> changed to EUR
  set pipe-opex ( item 1 csv:from-row file-read-line ) * pipe-opex-factor                            ;unit: MEUR/Mt CO2  --> equal to EUR/t CO2
  set pipe-capex-fixed-percentage ( item 1 csv:from-row file-read-line ) / 100  ;unit: %
  set electricity-price ( item 1 csv:from-row file-read-line ) / initial-electricity-price-decrease-factor                     ;unit: EUR/MWh
  set gov-budget (item 1 csv:from-row file-read-line) * 1000000 * gov-budget-factor                ;unit: MEUR/year
  file-close ;Close the file
end


to read-industry
  file-close-all
  if not file-exists? "Industry.csv" [
    user-message "No file 'Industry.csv' exists!"
    stop
  ]

  file-open "Industry.csv"

  if file-at-end? [
    stop
  ]
  print file-read-line
  set number-of-companies item 1 csv:from-row file-read-line
  set min-oil-demand (item 1 csv:from-row file-read-line) * 1000000              ;unit: Mt/yr --> changed to t/year
  set max-oil-demand (item 1 csv:from-row file-read-line) * 1000000              ;unit: Mt/yr --> changed to t/year
  set emission-factor item 1 csv:from-row file-read-line                         ;unit: Mt CO2/Mt oil --> equal to t CO2/t oil
  file-close ;Close the file
end


to read-oil-price
  file-close-all ;Close all open files

  if not file-exists? "Oil Price.csv" [
    user-message "No file 'Oil Price.csv' exists!"
    stop
  ]

  file-open "Oil Price.csv" ;Open the file with the CO2 price data

  ;We'll read all the data in a single loop
  while [ not file-at-end? ] [
    ;Here the CSV extension grabs a single line and puts the read data in a list
    set oil-data csv:from-row file-read-line
    set oil-price-list lput item 1 oil-data oil-price-list

    ;Now we can use that list to create a turtle with the saved properties

  ]
  set oil-price-list remove-item 0 oil-price-list
  set oil-price-list remove-item 0 oil-price-list
  file-close ;Close the file
end


to read-storage-locations
  file-close-all ;Close all open files

  if not file-exists? "Storage Locations.csv" [
    user-message "No file 'Storage Locations.csv' exists!"
    stop
  ]

  file-open "Storage Locations.csv" ;Open the file with the storage locations data

  ;We'll read all the data in a single loop
  while [ not file-at-end? ] [
    ;Here the CSV extension grabs a single line and puts the read data in a list

    set storage-locations-data csv:from-row file-read-line

    set location-list lput item 0 storage-locations-data location-list

    set onshore-km-list lput item 1 storage-locations-data onshore-km-list
    set offshore-km-list lput item 2 storage-locations-data offshore-km-list
    set pipe-capacity-list lput item 3 storage-locations-data pipe-capacity-list
    set capex-onshore-list lput item 4 storage-locations-data capex-onshore-list
    set capex-offshore-list lput item 5 storage-locations-data capex-offshore-list
    ;Now we can use that list to create a turtle with the saved properties
  ]
  set location-list remove-item 0 location-list
  set onshore-km-list remove-item 0 onshore-km-list
  set offshore-km-list remove-item 0 offshore-km-list
  set pipe-capacity-list remove-item 0 pipe-capacity-list
  set capex-onshore-list remove-item 0 capex-onshore-list
  set capex-offshore-list remove-item 0 capex-offshore-list
  file-close ;Close the file
end
@#$#@#$#@
GRAPHICS-WINDOW
254
10
732
489
-1
-1
1.1721
1
12
1
1
1
0
1
1
1
-200
200
-200
200
1
1
1
ticks
30.0

BUTTON
8
29
71
62
NIL
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
6
387
179
420
subsidy-share-pora
subsidy-share-pora
0
100
75.0
1
1
%
HORIZONTAL

BUTTON
76
29
140
62
go once
go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
6
439
241
472
expected-extensible-utilization
expected-extensible-utilization
0
100
98.0
1
1
%
HORIZONTAL

TEXTBOX
11
10
161
28
Commands
11
130.0
1

TEXTBOX
8
332
194
360
Government Parameters Setting
11
0.0
1

PLOT
742
10
1033
160
Prices
Year
Price (EUR/ton)
0.0
32.0
0.0
1.0
true
true
"" ""
PENS
"CO2 storage price" 1.0 0 -955883 true "" "plot co2-storage-price"
"CO2 emission price" 1.0 0 -7500403 true "" "plot co2-price"

PLOT
743
164
943
303
Joined Company
Year
Number
0.0
10.0
0.0
10.0
true
false
"set-plot-y-range 0 26\nset-plot-x-range 0 32" ""
PENS
"default" 1.0 0 -16777216 true "" "plot number-of-companies-joined"

MONITOR
946
165
1002
210
 Joined
number-of-companies-joined
17
1
11

PLOT
742
306
1116
453
Yearly CO2 Emission and Storage
Year
M ton CO2
0.0
32.0
0.0
10.0
true
true
"" ""
PENS
"Yearly Amount of CO2 Stored" 1.0 0 -7500403 true "" "plot yearly-co2-stored / 1000000"
"Yearly Amoun of CO2 Emitted" 1.0 0 -2674135 true "" "plot yearly-co2-emitted / 1000000"

BUTTON
144
29
207
62
NIL
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
7
256
235
289
initial-electricity-price-decrease-factor
initial-electricity-price-decrease-factor
1
1000
100.0
1
1
NIL
HORIZONTAL

SLIDER
6
350
204
383
gov-budget-factor
gov-budget-factor
0
50
20.0
0.5
1
NIL
HORIZONTAL

TEXTBOX
9
423
159
441
Pora Parameters Setting\n
11
0.0
1

TEXTBOX
7
237
211
259
Environment Parameters Setting
11
0.0
1

SLIDER
6
294
178
327
pipe-opex-factor
pipe-opex-factor
0
50
20.0
0.2
1
NIL
HORIZONTAL

TEXTBOX
7
478
157
496
Industry Parameters Setting
11
0.0
1

SLIDER
5
494
180
527
max-oil-demand-factor
max-oil-demand-factor
0.2
2
0.2
0.1
1
NIL
HORIZONTAL

MONITOR
946
257
1000
302
Year
year + 2018
17
1
11

PLOT
1120
305
1307
453
Number of pipeline under construction
Year
Number of pipelines under construction
0.0
32.0
0.0
2.0
true
false
"" ""
PENS
"Pipeline under construction" 1.0 0 -16777216 true "" "plot count infrastructures with [ pipe-under-construction? ]"

SWITCH
6
161
153
194
show-industry-label?
show-industry-label?
0
1
-1000

SWITCH
6
201
183
234
show-infrastructure-label?
show-infrastructure-label?
0
1
-1000

SWITCH
7
124
180
157
show-government-turtle?
show-government-turtle?
0
1
-1000

SWITCH
8
85
145
118
show-pora-turtle?
show-pora-turtle?
0
1
-1000

TEXTBOX
8
66
158
84
World Setting
11
0.0
1

PLOT
1041
10
1379
158
Total government payment as subsidy
Year
Subsidy (M EUR)
0.0
32.0
0.0
10.0
true
true
"" ""
PENS
"PORA subsidy amount" 1.0 0 -16777216 true "" "plot total-gov-subsidy-to-pora / 1000000"
"Industry subsidy amount" 1.0 0 -13345367 true "" "plot total-gov-subsidy-to-industry / 1000000"

MONITOR
946
211
1037
256
First year joining
first-year-joining
17
1
11

MONITOR
1005
164
1097
209
Duration of plan
duration-of-plan
17
1
11

PLOT
742
456
1184
612
Cumulative CO2 Emission and Storage
Year 
M ton CO2
0.0
32.0
0.0
10.0
true
true
"" ""
PENS
"Cumulative amoung of CO2 stored" 1.0 0 -7500403 true "" "plot cumulative-co2-stored / 1000000"
"Cumulative amoung of CO2 emitted" 1.0 0 -2674135 true "" "plot cumulative-co2-emitted / 1000000"

MONITOR
995
506
1117
551
Cumulative Storage
cumulative-co2-stored / 1000000
17
1
11

MONITOR
995
553
1120
598
Cumulative Emission
cumulative-co2-emitted / 1000000
17
1
11

MONITOR
1242
58
1349
103
PORA total subsidy
total-gov-subsidy-to-pora
17
1
11

MONITOR
1243
106
1377
151
Industry total subsidy
total-gov-subsidy-to-industry
17
1
11

MONITOR
956
356
1081
401
Yearly storage
yearly-co2-stored / 1000000
17
1
11

MONITOR
958
404
1096
449
Yearly emission
yearly-co2-emitted
17
1
11

PLOT
1189
455
1390
611
Industry cost to capture
Year
M EUR
0.0
32.0
0.0
10.0
true
false
"" ""
PENS
"default" 1.0 0 -16777216 true "" "plot total-industry-cost-to-capture / 1000000"

MONITOR
1315
408
1448
453
Industry cost to capture 
total-industry-cost-to-capture / 1000000
17
1
11

MONITOR
1314
306
1434
351
Extensible Pipelines
count infrastructures with [ commission-year > 0 and pipe-extensible? ]
17
1
11

MONITOR
1315
357
1436
402
Fixed Pipelines
count infrastructures with [ commission-year > 0 and not pipe-extensible? ]
17
1
11

MONITOR
1040
210
1134
255
Last year joining
last-year-joining
17
1
11

@#$#@#$#@
## INFORMATION

Model Name: Carbon Capture and Storage in Port of Rotterdam
Date or revision: 31 January 2018
Model version: 11.0
NetLogo Version: 6.0.4 

## WHAT IS IT?

In this model, relationship between 25 companies in the Port of Rotterdam, the authorities, and government are modelled.

The aim of this model is to provide insights into the problem owner and stakeholders with the appropriate model which is created under reasonable assumptions. This model is not made to be sufficient to create a specific policy for the CCS infrastructure implementation, but this model is intended to create a general idea of the relationship likelihood that the system might create in their implementation process as mentioned in the model question.

“How the government subsidies for the pipeline development, electricty price, CO2 produced by the company volume, and pipeline OPEX influence to decrease CO2 emissions of Port of Rotterdam area?”

The model is prepared to operate only for 32 years, any operaton after 32 years will not be meanigfull.

## HOW IT WORKS

The model narrative described in the previous step is implemented in a modelling environment. The modelling environment that is used for this project is NetLogo which provides easy implementation of the model with a simple programming language.
While developing the model, revision controls are used to document the changes done in each version of the model. In the case of a problem with a substantially changed new version, the previous version is used as a backup and bugging tool.

Since three people are involved in the coding, the names of the turtles, variables, and procedures are standardized and abbreviations are avoided. The detailed comment blocks are added to for ease of understanding and debugging. Bug tracking is proved to be tricky in NetLogo but it is done by adding monitors and outputs for the variables to check the consistency. 

## HOW TO USE IT

To operate the model, 

1. Adjust the parameters (see below), or use the default setting

2. Adjust the world setting (see below), or use the previous setting

3. Operate the “setup” button

4. Operate the “go” button to run the model for a year, and operate “go” forever button 

5. to run the model for 32 years.

6. After 32 years, don’t press the “go” or “go” forever button since it will be meaningless (the model is only prepared to be operated for 32 years)

7. Observe all the output variables on the monitor. 

Parameter: 

1. Initial electricity price decrease factor: the division factor of the electricity 

2. initial price. Linearly represent the inverse of the total government budget. 

3. Pipe OPEX factor: the multiplication factor for the OPEX of the pipeline. Linearly represent total the OPEX of the pipeline.

4. Government budget factor: the multiplication factor of the government budget. Linearly represent the total government budget.

5. Subsidy share for PORA: the PORA subsidy share from the budget

6. Minimum fixed utilization: the minimum utilization to decide if fixed infrastructure should be built

7. Expected extensible utilization: the expectation of usage on the extensible pipeline infrastructure

8. Maximum oil demand factor: the multiplication factor of the maximum oil demand. Linearly represent total oil demand of the industry therefore linearly represent the produced CO2 of the industry as well.

World Setting:

1. Show industry label

2. Show infrastructure label

3. Show government turtle

4. Show PORA turtle


## THINGS TO NOTICE

The monitor will show several performance indicators such as the present year, prices, the company that is joined in the CCS infrastructure, and the emission data. The status of the joining company that decided to link to the hub and the construction process of the pipeline be monitored in this screen.

Notice how the KPI:
1. Yearly and cumulative CO2 Emission and Stored
2. CO2 Storage Price
2. Subsidy number for both PORA and industry
3. Number of joined company and infrastructure
4. Pipeline construction progress

changes when the parameters are changed.

## THINGS TO TRY

Move the slider of the parameters around to see the diffrerent effect on the performance indicator. 

## EXTENDING THE MODEL

The model can be extended with several suggestions:

1. A dynamic number of industry might be interesting to be added. This model only serve 25 companies.

2. Instead of fixed random number fo the whole payback period, a function to model the oil consumption of the industry might be interesting. In real life, the carbon price might influence their decision to either reduce their oil consumption or to change their equipment which has not been addressed in this model. The competition will likely influence the industry behaviour.

3. Tthe prices are made without connecting it with another model to represent the market. The carbon price has not been taken into account the dynamic market model of CO2 trade which is extremely volatile. This volatility might have caused risk aversion that hinders investment of the CCS facility. But this issue has not been addressed in the model. 

4. The industry forecast variables are usually more dynamic than this model has made. For example, the industry has not considered the possibility of forecasting the electricity price, carbon price, technology changes. In real life, the industry will have their own analyst that will include the forecast of these dynamic variables in the future. The difference ability

5. This model has not taken into account the time limit of the contract penalty. After the contract has been made, in the real situation, usually the PORA and industry will need to specify the time limit of their infrastructures construction. As a project, time delay might cause a penalty which has not been considered in the mode. The social risk of unbuilt contracted pipeline has not been taken into account into the calculation. This variable might influence the both Industry and PORA decision to sign the contract.

6. This model has not taken into account the relationship and competition quality within the industry. In the real world, one successful or failed project of CCS facility might influence the other industry decision. The satisfaction level of the joined industry might be important to be added as one of the deciding factors. 

## CREDITS AND REFERENCES

Elif Gül Demir - 4821068
Kiana Afzali - 4902130
Mustika Siti Hajarini - 4825608

SEN1211 Agent-based Modelling
Faculty of Technology, Policy, and Management - TU Delft
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

factory
false
0
Rectangle -7500403 true true 76 194 285 270
Rectangle -7500403 true true 36 95 59 231
Rectangle -16777216 true false 90 210 270 240
Line -7500403 true 90 195 90 255
Line -7500403 true 120 195 120 255
Line -7500403 true 150 195 150 240
Line -7500403 true 180 195 180 255
Line -7500403 true 210 210 210 240
Line -7500403 true 240 210 240 240
Line -7500403 true 90 225 270 225
Circle -1 true false 37 73 32
Circle -1 true false 55 38 54
Circle -1 true false 96 21 42
Circle -1 true false 105 40 32
Circle -1 true false 129 19 42
Rectangle -7500403 true true 14 228 78 270

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

house ranch
false
0
Rectangle -7500403 true true 270 120 285 255
Rectangle -7500403 true true 15 180 270 255
Polygon -7500403 true true 0 180 300 180 240 135 60 135 0 180
Rectangle -16777216 true false 120 195 180 255
Line -7500403 true 150 195 150 255
Rectangle -16777216 true false 45 195 105 240
Rectangle -16777216 true false 195 195 255 240
Line -7500403 true 75 195 75 240
Line -7500403 true 225 195 225 240
Line -16777216 false 270 180 270 255
Line -16777216 false 0 180 300 180

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

orbit 6
true
0
Circle -7500403 true true 116 11 67
Circle -7500403 true true 26 176 67
Circle -7500403 true true 206 176 67
Circle -7500403 false true 45 45 210
Circle -7500403 true true 26 58 67
Circle -7500403 true true 206 58 67
Circle -7500403 true true 116 221 67

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.0.4
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
<experiments>
  <experiment name="experiment" repetitions="50" runMetricsEveryStep="true">
    <setup>setup</setup>
    <go>go</go>
    <timeLimit steps="32"/>
    <metric>cumulative-co2-stored</metric>
    <metric>cumulative-co2-emitted</metric>
    <metric>yearly-co2-stored</metric>
    <metric>yearly-co2-emitted</metric>
    <metric>first-year-joining</metric>
    <metric>duration-of-plan</metric>
    <metric>total-gov-subsidy-to-industry</metric>
    <metric>total-gov-subsidy-to-pora</metric>
    <metric>total-industry-cost-to-capture</metric>
    <metric>number-of-companies-joined</metric>
    <metric>count infrastructures with [ pipe-extensible? and commission-year &gt;= 0 ]</metric>
    <metric>count infrastructures with [ not pipe-extensible? and commission-year &gt;= 0 ]</metric>
    <enumeratedValueSet variable="min-fixed-utilization">
      <value value="90"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="show-government-turtle?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="pipe-opex-factor">
      <value value="1"/>
      <value value="5"/>
      <value value="10"/>
      <value value="15"/>
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="initial-electricity-price-decrease-factor">
      <value value="1"/>
      <value value="50"/>
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="show-infrastructure-label?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="gov-budget-factor">
      <value value="0.5"/>
      <value value="1"/>
      <value value="2"/>
      <value value="5"/>
      <value value="20"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="show-pora-turtle?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="show-industry-label?">
      <value value="false"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="subsidy-share-pora">
      <value value="0"/>
      <value value="25"/>
      <value value="50"/>
      <value value="75"/>
      <value value="100"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="max-oil-demand-factor">
      <value value="0.2"/>
    </enumeratedValueSet>
    <enumeratedValueSet variable="expected-extensible-utilization">
      <value value="98"/>
    </enumeratedValueSet>
  </experiment>
</experiments>
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
