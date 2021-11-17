# Covid-19 Electronic Immunization Registry Tracker System Design { #cvc-eir-tracker-design }

## Introduction

The COVID-19 Immunization System Design document provides an overview of the conceptual design used to configure a DHIS2-tracker program serving as an electronic immunization registry for COVID-19 vaccines. This document is intended for use by DHIS2 implementers at country and regional level to be able to support implementation and localization of the package. Local work flows, national guidelines, and the respective vaccination product guidelines should be considered in the localization and adaptation of this configuration package.

This package was developed in response to an expressed need from countries and partners to monitor equity and uptake of COVID-19 vaccines across priority groups, track individuals through the completion of their vaccination schedule. 


The goal of this package is to improve timeliness, accuracy of data, expand coverage, efficiency and effectiveness  delivery of the COVID-19 vaccines. It is based on the [Guidance on developing a national deployment and vaccination plan for COVID-19 vaccines](https://www.who.int/publications/i/item/WHO-2019-nCoV-Vaccine_deployment-2020.1) as well as feedback from WHO and CDC officials and general vaccination standards and guidance adapted from the DHIS2 immunization registry package


Because national guidelines and policies will vary, this package should be adapted to national context.


## System Design Overview

### Use Case

The tracker data model in DHIS2 enables an individual to be registered and followed  across a series of health services over time. This model can be leveraged to track individuals’ completion of vaccination schedules according to national policy and product recommendations, as well as capture robust individual level data to support analysis of vaccine distribution, uptake, and completion according to demographics, underlying conditions, and other variables.

### Content

The package includes:

* Tracker programme which registers individual and each vaccination event
* A set of program indicators which covers the requirements from the WHO guidance on Vaccine deployment.
* A set of program indicatos which feeds into an aggregate data set for daily monitoring
* An aggregate dataset for daily monitoring
* A set of indicators based on the aggregate data set
* A daily monitoring dashboard based on the aggregate data set

### Intended Users

The programme is designed to support clinical/facility-level users, empowering staff with better decision-making tools and placing the client at the center of the information system, while also eliminating their reporting redundancies. However, depending on the infrastructure and resource availability in-country, data entry can be completed at the district level based on paper registers. 

* Clinical users: The Immunization eRegistry tracker program is optimized for data entry at Point of Care.
* Facility staff: Data can also be input into DHIS2 by data entry staff if point-of-care data entry is not feasible. Working lists are designed to support facility staff to monitor patients that need follow up or are overdue according to their vaccination schedule..
* Facility Managers, District Health Offices and National Program Staff: The data generated through the programme feeds into standardised dashboards which allow to follow vaccine uptake, dropouts, and age/gender/profession disaggregation

Illustrative workflow:

![workflow](resources/images/Covac_workflow.png)

Workflows will vary from country to country. The program design should be reviewed and localized by context. For example, the workflow in the figure above assumes that individuals will be registered in DHIS2 when they present themselves at a vaccination site to receive their first dose. An alternative that can be considered is to pre-register eligible individuals into the system as Tracker Entity Instances (e.g. from an existing health worker registry).

## Tracker Program Configuration

|Structure|Description|
|---|---|
|Enrollment|If a person is not already registered in the instance, they are registered and enrolled into the immunization registry as a TEI (TEI Type Person) and their data is captured in the Enrollment as attributes, which match the existing COVID-19 packages for DHIS2. TEI Attributes: National ID, Unique ID, Given name, Sex, Date of Birth is Estimated, Date of Birth (age), Mobile phone number, Address (current), Area, Occupation|
|Program Stage 1: Vaccination|This is a repeatable stage. Data is entered for this stage each time a person receives a vaccination.Event date = Date when dose was given \ Due date= Allows for scheduling of next dose|
|Section 1.1 Underlying conditions|Information on health states and/or pre-existing underlying conditions that have been determined to expose to a significantly higher risk of severe infection or death. The package contains same preexisting conditions used in the rest of the COVID packages.|
|Section 1.2 Pre-immunization questions|For the first dose, this section asks if the client has had COVID-19 within the last 90 days. After the second dose, it also asks if there is a|
|Section 1.3: Vaccination|Registers details about the vaccine type provided as well as batch number, expiration date, and provides a suggested date for next vaccination.|

### Data elements in the vaccination stage

|Data element (Form name)|Linked to Indicators|Linked to Certificates|Linked to program rules|
|--- |--- |--- |--- |
|Dose given on (Vaccination date) Not a data element|Yes|Yes|Yes|
|Is the patient pregnant or lactating?|No|No|Yes|
|Pregnancy gestation (weeks)|No|No|Yes|
|Any underlying conditions?|No|No|Yes|
|Cardiovascular disease, including hypertension|No|No|Yes|
|Chronic Lung Disease|No|No|Yes|
|Diabetes|No|No|Yes|
|Immunodeficiency|No|No|Yes|
|Malignancy|No|No|Yes|
|Chronic neurological or neuromuscular disease|No|No|Yes|
|Renal Disease|No|No|Yes|
|Others (Please specify)|No|No|Yes|
|Has the patient been infected with COVID-19 within the last 90 days?|No|No|Yes|
|Has the patient had a severe allergic reaction (anaphylaxis) or an immediate allergic reaction—even if it was not severe—after getting the first dose of the vaccine|No|No|Yes|
|Vaccine given|Yes|Yes|Yes|
|Vaccine name|Yes|Yes|Yes|
|Please explain why this client has been administered doses of different products|No|No|Yes|
|Vaccine batch/lot number|No|Yes|No|
|Vaccine expiry date|No|No|No|
|Dose number|Yes|Yes|Yes|
|Total doses required for this vaccine product|No|Yes|Yes|
|Is this the last dose?|Yes|No|Yes|
|COVAC Suggested date for next dose|No|No|Yes|
|"Has the client had any adverse reaction following the immunization?|No|No|Yes|

### Vaccine products in the program

The specific COVID-19 products available in the country and vaccine schedules will vary by country. This package includes vaccine products following the documentation available from WHO, which will continue to evolve as [vaccines enter the market.](https://extranet.who.int/pqweb/sites/default/files/documents/Status_COVID_VAX_16Feb2021.pdf)

In order to better demonstrate functionality, these placeholders have been configured based on five existing vaccine products, but it is important to verify and configure the programme based on the national adoption guidelines for the product. 

|Vaccine NAME|Option Code|Vaccine Manufacturer|Option Code|Age Recommendation|Dose Interval|Number of doses|
|--- |--- |--- |--- |--- |--- |--- |
|AZD1222/AstraZeneca|astrazeneca|AstraZeneca|astrazeneca|18|10 days (8-12)|2|
|AZD1222/AstraZeneca|astrazeneca|SKBio Astra Zeneca|skbioastrazeneca|18|10 (8-12)|2|
|BNT162b2 / COMIRNATY Tozinameran (INN) / BioNTech/Pfizer|biontechpfizer|BioNtech/Pfizer|biontechpfizer|16|21|2|
|mRNA-1273 / Moderna|moderna|Moderna|moderna|18|28|2|
|Sputnik V / Gamaleya|gamaleya|Gamaleya|gamaleya|18|21|2|
|SARS-CoV-2 Vaccine (VeroCell), Inactivated / Sinopharm|sinopharm|Sinopharm|sinopharm|18|21 days (21-28) |2|


### How to adapt the placeholders to the available vaccine products?

#### Names in the form

For the name in the form to reflect the products used in country, you would first need to modify the option sets “COVAC Vaccine manufacturers” and “COVAC Vaccine name” and change the options to names to what is appropriate for the country.

![Option set](resources/images/Covac_optionset_1.png)

![Option set](resources/images/Covac_optionset_2.png)

#### Auto Assigning Manufacturers and Brands to Names

Manufacturers and brands are auto-assigned when a vaccine product is selected through program rules based on the vaccine chosen, unless the vaccine has more than one manufacturer available, in which case, a program rule will hide the options which are not relevant and the clerk will need to choose the right manufacturer name, as is the case of AstraZeneca.

##### Auto assign rule

For example, the program rule “Assign Brand and manufacturers to BioNtech/Pfizer" assigns the manufacturer BioNtech/Pfizer when “Comirnaty, Tozinameran” is selected.

It uses the expression:
`d2:hasValue( 'Vaccine_type' )  == true && #{Vaccine_type} == 'BIONTECHPFIZER'`

And the action for this program rule is to assign value to the Data Element “Vaccine Manufacturer” as ‘BIONTTECHPFIZER’ which is the option code for “BioNTech/Pfizer” as well as "BioTech/Pfizer" for the brand.

##### Hide options rule

Currently, the only rule like this is:
“Assign Brand/Hide options to AstraZeneca”, as this product has two different manufacturers (AstraZeneca and SK Bio Astra Zeneca).  
This means that instead of assigning a manufacturer, the PR will hide the irrelevant manufacturers and allow the clerk to select one of the two currently available manufacturers.

#### Age alert

Depending on the vaccine there can be lower age limits. , If a vaccinator administers a dose to someone outside of that recommended age range, then a warning is issued. To modify this, please amend the program rules:

“If Age is under 18, then warn that Astra Zeneca is recommended for ages 18 and up”

“If Age is under 16, then warn that BiontechPfizer is recommended for ages 16 and up”
“If Age is under 18, then warn that Moderna is recommended for ages 18 and up”
“If Age is under 18, then warn that Gamaleya is recommended for ages 18 and up”
“If Age is under 18, then warn that Sinopharm is recommended for ages 18 and up”

The rules all use a similar expression:

`(#{Age_Calculated}   < 18 ) && (#{Vaccine_type} =='ASTRAZENECA')`

Where you would need to modify the number, 18 in this case,  to match the necessary age.

The action for these program rules is to show a warning:
“This vaccine product is recommended for people 18 and older.”  

You should also modify this warning to match the most appropriate National Guidelines..

#### Assign a date for next dose

There is currently no way for a tracker to assign a date for the next event based on a data element, so what we have done is configured tracker to automatically autoschedule the next vaccination date 10 days from the first dose, assuming that the most used product would be Astra-zeneca. This must be modified to match the interval used in the country by changing the setting for the vaccination program stage in the maintenance app.  

![Program setting](resources/images/Covac_date_setting.png)

In addition, there is also a data element that auto-assigns using program rules a recommended date depending on the vaccine product. In order to modify this, the program rule needs to be edited:

 “Assign a suggested date for next dose AstraZeneca” (there is one rule for each product)
“.../dhis-web-maintenance/#/edit/programSection/programRule/ZT3tLrXXadf”

The program rule has two actions

Action one: Show warning next to data element “suggested date for next dose” with the text “Next dose should be given at 10 days”  

Modify this text to match the needs.

Action two: Assign value to the data element “suggested date for next dose” with the expression d2:addDays( V{event_date}, 10 )  

Modify the number 10 with the number of days that needs to be assigned to the available vaccine.

#### Last dose

There is currently yes/no data element called “Last dose” this element is used to help indicators know when a product has completed its immunization schedule. Currently, all products have two doses, and therefore, we have set it up so that once a person is given a second dose, the DE “Last dose” is automatically checked as “Yes”. We have also hidden this DE for the first dose.
 
To modify this warning, edit the program rule:
 “If this is the second dose, mark it as "last dose" for all vaccine products”

dhis-web-maintenance/#/edit/programSection/programRule/PJjKiFrvfuN

The expression:
`d2:hasValue( 'Dose_number' ) == true && #{Dose_number} == 'DOSE2'`

indicates that if a clerk selects that the doses number given is the second dose, then it triggers an “assign value” action which adds the value “true” to the data element “Last dose” and to the Program rule variable "Last_dose"

To modify this, edit the expression to filter out the vaccine products not in use/with a different schedule.

#### Total number of doses

The data element “Total doses required for this vaccine product” is an autofilled data element which displays the amount of doses required for this vaccine product’s vaccination schedule. Currently, all vaccines have two doses in their schedule. However, there is an individual rule for each vaccine in case this changes in the future:

To modify, edit the corresponding rule: Assign dose number to NAMEOFPRODUCT

And the expression:
`d2:hasValue( 'Vaccine_type' )  == true && #{Vaccine_type} == 'astrazeneca'`

If the program matches the filter, then the action will assign value to the “Total doses” data element. Currently, all rules assign the value “2” and hides the option for a third dose.

#### Access Level

The program has been set up as a “protected” program, meaning that users are able to search in other org units beyond the ones they have rights to, but if they want to access records in a different facility, they must use the “breaking the glass” function and not down why they are accessing records in a different organisation unit.  


Note that the [breaking the glass feature is not supported in Android](https://docs.dhis2.org/2.35/en/dhis2_android_capture_app/programs.html#breaking-the-glass) and android users are unable to search other organisation units when the program is set as protected. 

#### Enrollment Details

The enrollment date equals the ‘Registration date’. It is intended that the user enters the enrollment date as the person is being enrolled into the Immunization Registry program. In the majority of cases, the enrollment date will coincide with the date for the first vaccination unless clients are enrolled in advance in the vaccination registry.

As the program uses the Date of Birth to calculate program indicators, it is configured as mandatory. If a person does not know their date of birth, the checkbox “Date of birth is estimated” can be used and their approximate age or an approximate DoB should be entered.

While the information on enrollment is meant to be completed when a case is first enrolled, attribute values can be updated at any point during an active enrollment if new information becomes available (eg contact information).

#### Identifiers

The program is configured with two types of unique identifiers. Additional identifiers can be added to the program based on country context.

**Unique Identifier**: An automatically generated ID which is unique to the entire system (e.g. the instance of DHIS2 being used). This TEI attribute is configured to generate the attribute value based on a pattern. In the previous version of the package the unique identifier generated a number which was a prefix and a random rumber, "EPI_" + RANDOM(########)". The latest version has replaced this attribute for one with a sequential pattern which helps with performance for large implementations "EPI_" + RANDOM(########)".

**National ID**: This ID is currently manually entered and should be adapted to local validation needs.

![Enrollment Stage](resources/images/Covac_enrollment.png)

### Program Stage 1: Vaccination (repeatable)

Section 1.1 Underlying conditions.

![Underlying conditions](resources/images/Covac_underlying.png)

The underlying conditions listed here are based on the guidelines for the COVID case surveillance and contact tracing packages, and they also include health states such as pregnancy and lactation. The pregnancy and lactation options  only appear for females. Once one of the underlying conditions (except for pregnancy) are selected, they will remain selected in the following stage (as this is a repeatable stage) and they will be listed in the indicator box. 

#### Section 1.2 Pre Immunization Questions

The Pre-Immunization Questions are intended to be completed during each ‘event’, which represents an immunization service.  Based on the answers selected, program rules are triggered to give decision support

Currently, the two questions are:

“Has the patient been infected with COVID-19 within the last 90 days”

If the answer to this is yes, a warning appears: The vaccine is recommended for people who have been free from COVID-19 infection for at least 90 days”“

And

“Has the patient had a severe allergic reaction (anaphylaxis) or an immediate allergic reaction—even if it was not severe—after getting the first dose of the vaccine”, Which only is visible to patients when they are receiving their second (or potentially, third or booster) doses. If yes is selected, it triggers the warning “Please  follow the national guidelines for AEFI investigations"

![Pre-immunization questions](resources/images/Covac_preimmunization.png)

#### Section 1.3 Vaccination information

This section captures the immunization services delivered. It records:

Vaccine given  (using the option set “Vaccine name”)

Vaccine manufacturers (using the option set “Vaccine manufacturers”, autofilled)

Vaccine Brand (Using the option set "Vaccine brand"

The batch number for this dose

The date of expiration of the dose

The dose number (1st, 2nd, or booster)

The number of total doses required for this vaccine product (autofilled)

A data element to confirm if this is the last dose in the treatment (autofilled)

An automatically calculated data element giving a suggestion for the next dose (autofilled)

A data element asking if the client has had an adverse reaction following the immunization (Used when monitoring a patient immediately after being vaccinated)

A data element to complete the health worker identification

![Vaccination section](resources/images/Covac_vaccination.png)

If a patient is administered a different vaccine type compared to the one recorded in the first inoculation, a warning is shown: “The vaccine type you have selected is not the same as the previous vaccine type this person received. Last does they were administered was 'NAME OF PREVIOUSLY GIVEN VACCINE'” This also triggers an additional Data Element “Please explain why this client has been administered doses of different products”

Once a client has received the first dose, the option for the first dose is hidden from the data element. For products with only two doses in the schedule, the third is hidden. Countries can configure this depending on the vaccine products they will be adopting.

#### Scheduling events

The stage is configured to ‘Ask the user to create a new event when a stage is completed’, which triggers a pop-up for scheduling the follow-up appointment. ‘Standard interval days’ are currently set to 10 so that the next appointment (event) date is scheduled 10 days from the current event date by default, but can be modified depending on the product used.

### User Groups

The programme is packaged together with four user groups:

* *COVAC - Covid Immunization Metadata Admin:* Has the rights to edit the metadata of the package but not to enter data into the package
* *COVAC - Covid Immunization Data Entry:* Has the rights to enter data into tracker
* *COVAC - Covid Immunization Data Analysis:* Has access to the dashboards, but cannot enter data.
* *COVAC - Covid-19 Immunization data Admin:* This is an Admin group which is shared between tracker and aggregate. Members of this group can view data in both tracker and aggregate modules and capture data in the aggregate module only. This user group is set up for the users that would run the tracker to aggregate scripts as well as access the dataset through the data entry app.

These should be adapted to national needs.

## Certificate Printing

DHIS2 does not support printing a vaccination certificate or generating an electronic certificate as a core functionality, but several countries have succesfully adapted the platform in order to provide digital and printed certificates. 

### SMS Notifications

DHIS2 has an SMS notifications module, but in order to use the notifications, and SMS gateway needs to be configured. See documentation on sms gateways [here](https://docs.dhis2.org/en/develop/using-the-api/dhis-core-version-master/sms.html)

The programme includes a default reminder 7 days before the scheduled due date for a vaccination event:

“Dear NAME OF CLIENT, you have an appointment to receive your COVID-19 vaccine on the DUE DATE at NAME OF FACILITY  

And a message 3 days after the scheduled due date:

“Dear A{TfdH5KvFmMy}, your appointment for a COVID-19 vaccine dose was on the V{due_date}, if you did not receive your vaccine, please contact V{org_unit_name} as soon as possible. If you have received your vaccine, please ignore this message”

**NOTE:** Due to current limitations of the SMS module, the message scheduled three days after the due date will be sent regardless of whether the event took place or not. Until this issue is fixed, a workaround is to configure a cronjob script which checks for overdue events and schedules a message.

### Working Lists

Three custom working lists have been configured in the program. These lists are meant to facilitate the management of the work day of the health care workers at point of care with lists of clients depending on their vaccination schedule, and to highlight overdue appointments.  

The lists are customised based on the “due date” function. The Due date is the date that is assigned for the next event and is done as soon as the first event is completed. Currently, the system automatically selects an appointment 10 days after the first vaccination, and the clerk or clinician should modify this date if necessary. It is therefore important that the scheduling is done correctly in order to use the working lists.

All active registered clients:
Clients who are registered in the COVID vaccine programme, and clients whose enrollment wasn’t completed. It is assumed that clients who have received all doses of their vaccines will have completed their enrollment in the vaccination program. The incomplete enrollment will therefore be indicative of all the clients who have not received a second dose (or the last dose for vaccines with different schedules)-independently on whether they are on schedule or overdue

Clients with scheduled appointments:
Those who have a vaccination programme stage scheduled into the future or current day

Clients overdue a vaccination dose:
Those who have a scheduled appointment in the past, and are therefore overdue to get a vaccine dose.

Completed clients:
Those whose enrollment has been completed

## Analytics

To optimize performance for anticipated large-scale deployments and the use of high-volume campaign-style vaccine administration strategies, this package is designed to serve analytics objects and dashboards through the aggregate data model. 

In addition to ensuring maximum performance for analytics users accessing the dashboards in near real-time while high-volume data entry through Tracker is likely ongoing, aggregating tracker data and serving the dashboards through the aggregate domain has the added benefit of making data dimensions available for analytics users (e.g. based on Categories for disaggregation). 

In order to serve COVID-19 analytics from the COVID-19 EIR tracker program source data, the package includes the following components:
An aggregate data set with data elements and category combos (to serve as a target for pushing tracker data to aggregate model)
A dashboard based on aggregate domain indicators (replaces the tracker-based (program indicator-based) dashboard in previous versions)
A group of program indicators with attributes mapped to the target aggregate DEs/COCs 

### Dashboard

This package contains a simplified COVAC Daily Monitoring Dashboard (iBWlFCvvtkH) to facilitate daily/near real-time analysis during campaign-style vaccine delivery activities. This dashboard is designed to be as light as possible, serving a core set of metrics optimized for daily monitoring of vaccine delivery operations. The dashboard indicators were selected as a subset of the monitoring guidance included in the WHO Guidance on developing a national deployment and vaccination plan for COVID-19 vaccines. [WHO Guidance on developing a national deployment and vaccination plan for COVID-19 vaccines](https://www.who.int/publications/i/item/WHO-2019-nCoV-Vaccine_deployment-2020.1).
The  “COVAC Daily Monitoring Dashboard” ((iBWlFCvvtkH)  is configured entirely based on indicators belonging to the indicator group COVAC - Daily (doQTIS8KJQH). This will enable countries to map dashboard indicators to their own set of underlying data elements, if the target aggregate data set and data elements are customized for local implementation. 

For a complete monitoring dashboard covering additional aspects of the WHO NDVP Monitoring Guidance (such as vaccine coverage and uptake by target groups, indicators on adverse events, supply & cold chain), refer to the [COVAC Core Dashboard/Aggregate metadata package](https://docs.dhis2.org/en/topics/metadata/covid-19-vaccine-delivery/covac-aggregate/version-110/design.html). 

If your instance already has a dashboard from previous version of this package, it is recommended that it is deleted, or that access to it is limited to a few users. For instructions on how to delete dashboards see the [installation guide](https://docs.dhis2.org/en/topics/metadata/covid-19-vaccine-delivery/covac-immunization-registry-tracker/installation.html)

### Aggregate Data Set 

An aggregate dataset ‘COVAC - EIR tracker data (aggregated)’ has been configured with daily frequency as a target for pushing tracker program indicator-based calculated data values to the aggregate domain. The dataset contains the following Data Elements:

1. People with 1st dose
2. People with 2nd, 3rd or booster doses
3. People with last recommended dose
4. People with underlying conditions

![Aggregate data entry](resources/images/covac_agg_data_entry.png)

Where possible, Category Combinations, Categories (and their associated CategoryOptionCombos and Category Options) were re-used from the existing [COVAC Core Dashboard/Aggregate metadata package](https://docs.dhis2.org/en/topics/metadata/covid-19-vaccine-delivery/covac-aggregate/version-110/design.html) to facilitate analysis across data elements from these two packages.

These data elements and COCs are expected to be populated from tracker program indicators, as described below. 

### Program Indicators

A group of Program Indicators, COVAC-Tracker to aggregate (NXBR4r6MwAO) has been configured and mapped (via attributes) to facilitate pushing data values to the associated target aggregate domain Data Elements and COCs as described above. An example of this mapping is as follows:

| Program indicator (Name) | Program indicator UID | Pushed to Aggregate DE (Name) | Aggregate DE UID | Mapped to Indicator (Name) | Indicator UID |
|---|---|---|---|---|---|
| Number of people receiving a first dose (Female 0-59) | RJ6pdxga9Od | COVAC- People with 1st dose | RjT7dmzunF4 | COVAC - People with 1st dose | GeAtojrj7Yy |
| Number of people receiving a first dose (Female 60+) | x4L0LuEBHhW | COVAC- People with 1st dose | RjT7dmzunF5 | COVAC - People with 1st dose | GeAtojrj7Yy |
| Number of people receiving a first dose (Male 0-59) | hqm8znlAzkT | COVAC- People with 1st dose | RjT7dmzunF6 | COVAC - People with 1st dose | GeAtojrj7Yy |
| Number of people receiving a first dose (Male 60+) | aIIHyDy8AMW | COVAC- People with 1st dose | RjT7dmzunF7 | COVAC - People with 1st dose | GeAtojrj7Yy |
| Number of people receiving a second, third or booster dose (Female 0-59) | xY4T9hHXNji | COVAC - People with 2nd, 3rd or booster doses | zmKNuqgsq8N | COVAC - People with 2nd, 3rd, or booster doses | ddZjJCwXf6k |
| Number of people receiving a second, third or booster dose (Female 60+) | h9G7i6mQKef | COVAC - People with 2nd, 3rd or booster doses | zmKNuqgsq8N | COVAC - People with 2nd, 3rd, or booster doses | ddZjJCwXf6k |
| Number of people receiving a second, third or booster dose (Male 0-59) | MGjwUUNsE60 | COVAC - People with 2nd, 3rd or booster doses | zmKNuqgsq8N | COVAC - People with 2nd, 3rd, or booster doses | ddZjJCwXf6k |
| Number of people receiving a second, third or booster dose (Male 60+) | qh0kIjHZbP8 | COVAC - People with 2nd, 3rd or booster doses | zmKNuqgsq8N | COVAC - People with 2nd, 3rd, or booster doses | ddZjJCwXf6k |
| Number of people who received the last recommended dose for the respective vaccine product (Female 0-59) | Zp39TSOR8eW | COVAC - People with last recommended dose | CB46jykiEye | COVAC - People with last recommended dose | OAZXVEjEEoD |
| Number of people who received the last recommended dose for the respective vaccine product (Female 60+) | XFUvVgqPukT | COVAC - People with last recommended dose | CB46jykiEye | COVAC - People with last recommended dose | OAZXVEjEEoD |
| Number of people who received the last recommended dose for the respective vaccine product (Male 0-59) | FZNIlzPRMmL | COVAC - People with last recommended dose | CB46jykiEye | COVAC - People with last recommended dose | OAZXVEjEEoD |
| Number of people who received the last recommended dose for the respective vaccine product (Male 60+) | zovL7DKBRuK | COVAC - People with last recommended dose | CB46jykiEye | COVAC - People with last recommended dose | OAZXVEjEEoD |
| People with underlying conditions | Zn0UuSRYyJw | COVAC - People with underlying conditions | OUI05zSKrqk | COVAC - People with underlying conditions | KIgI3EPjs2T |


Additional program indicators have been configured to enable ad hoc analysis of the tracker data itself (e.g. coverage rates calculated based on tracker data, etc). However, these program indicators are not used in the COVAC - Daily Monitoring dashboard. 

## Transferring aggregated tracker domain data to aggregate domain data values

In addition to the metadata provided above, implementations will require a mechanism to push the program indicator values from the tracker domain to the target aggregate data set. More information about this can be found in this chapter of the DHIS2 Implementation Guide: [Integrating Tracker and Aggregate Data](https://docs.dhis2.org/en/implement/maintenance-and-use/tracker-and-aggregate-data-integration.html#how-to-saving-aggregated-tracker-data-as-aggregate-data-values) 

## Considerations for when implementing with Android devices

### Access level ‘protected’

The ‘breaking the glass’ feature is not yet supported in DHIS2 Android Capture App as of v. 2.3. If the program is configured as ‘Protected’, the default behavior for Android will be the same as if the program is configured as ‘closed.’ This means that an Android user will not be able to read or edit enrollments of a TEI outside of their org unit. TEIs registered in a Search OU will be returned by the TE Type search but if the program is closed or protected the user will not be allowed to see or create a new enrollment. If Android users must be able to access TEI outside of their data capture org unit, the program should be configured with access level ‘Open.’ Follow the status of this issue on [Jira](https://jira.dhis2.org/browse/ANDROAPP-657)

### Dose due date

The description of the due date is not correctly displayed on android and instead of saying “Dose due date” it says “Due date” [Link to jira](https://jira.dhis2.org/browse/ANDROAPP-3620)

### Reserve IDs

The unique identifier for this package is autogenerated and uses the pattern "CURRENT_DATE(yyyy-MM-dd)-"-"-SEQUENTIAL(#####)". With android devices, the values for these system generated UIDs are reserved in advance for each device, to ensure that the values are unique for the whole instance. This means that the value of the date and of the sequencial number will not necessarilly correspond with what today's date and the chronological order of when a patient receives the vaccine. More information about this can be found [here](https://docs.dhis2.org/en/implement/implementing-with-android/dhis2-configuration-for-android.html#configuration_reserved_id)
