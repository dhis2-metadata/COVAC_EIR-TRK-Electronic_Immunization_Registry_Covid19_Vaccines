# Covid-19 Electronic Immunization Registry - Tracker Installation Guide { #cvc-eir-trk-installation }

## Overview

This document includes an installation guide for the updated COVAC Electronic Immunization Registry tracker package and a supplementary aggregate module for daily reporting based on tracker data.

### DHIS2.35

=== "Complete package"

    ```json
    "package": {
        "DHIS2Build": "834b25f",
        "DHIS2Version": "2.35.8",
        "code": "CVC_EIR",
        "description": "",
        "lastUpdated": "20211111T154832",
        "locale": "en",
        "name": "CVC_EIR_TRK_1.2.0_DHIS2.35.8-en",
        "type": "TRK",
        "version": "1.2.0"
    }
    ```

=== "Aggregate package"

    ```json
    "package": {
        "DHIS2Build": "834b25f",
        "DHIS2Version": "2.35.8",
        "code": "CVC_EIR_AGG",
        "description": "",
        "lastUpdated": "20211111T154832",
        "locale": "en",
        "name": "CVC_EIR_AGG_1.2.0_DHIS2.35.8-en",
        "type": "AGG",
        "version": "1.2.0"
    }
    ```

=== "Aggregate Dashboard package"

    ```json
    "package": {
        "code": "COVAC_EIR_DSH",
        "DHIS2Build": "834b25f",
        "DHIS2Version": "2.35.8",
        "locale": "en",
        "name": "COVAC_EIR_DSH_V1.2.0_DHIS2.35.8-en",
        "type": "DASHBOARD",
        "version": "1.2.0"
    }
    ```

=== "Program indicators (tracker-to-aggregate)

    ```json
    "package": {
        "DHIS2Build": "834b25f",
        "DHIS2Version": "2.35.8",
        "code": "CVC_EIR",
        "description": "",
        "lastUpdated": "20211111T141045",
        "locale": "en",
        "name": "CVC_EIR_PI_1.2.0_DHIS2.35.8-en",
        "type": "ADD_ON",
        "version": "1.2.0"
    }
    ```

### DHIS2.36

=== "Complete package"

    ```json
    "package": {
        "DHIS2Build": "2adf10b",
        "DHIS2Version": "2.36.4",
        "code": "CVC_EIR",
        "description": "",
        "lastUpdated": "20211111T155558",
        "locale": "en",
        "name": "CVC_EIR_TRK_1.2.0_DHIS2.36.4-en",
        "type": "TRK",
        "version": "1.2.0"
    }
    ```

=== "Aggregate package"

    ```json
    "package": {
        "DHIS2Build": "2adf10b",
        "DHIS2Version": "2.36.4",
        "code": "CVC_EIR_AGG",
        "description": "",
        "lastUpdated": "20211111T154958",
        "locale": "en",
        "name": "CVC_EIR_AGG_1.2.0_DHIS2.36.4-en",
        "type": "AGG",
        "version": "1.2.0"
    }
    ```

=== "Aggregate Dashboard package"

    ```json
        "package": {
        "code": "COVAC_EIR_DSH",
        "DHIS2Build": "2adf10b",
        "DHIS2Version": "2.36.4",
        "locale": "en",
        "name": "COVAC_EIR_DSH_V1.2.0_DHIS2.36.4-en",
        "type": "DASHBOARD",
        "version": "1.2.0"
    }
    ```

=== "Program indicators (tracker-to-aggregate)

    ```json
    "package": {
        "DHIS2Version": "2.36.4",
        "code": "CVC_EIR",
        "description": "",
        "lastUpdated": "20211111T155558",
        "locale": "en",
        "name": "CVC_EIR_PI_1.2.0_DHIS2.36.4-en",
        "type": "ADD_ON",
        "version": "1.2.0"
    }
    ```

## Installation

Installation of the module consists of several steps:

1. Preparing the metadata file with DHIS2 metadata.
2. Importing the metadata file into DHIS2.
3. Configuring the imported metadata.
4. Adapting the program after import

It is recommended to first read through each section before starting the installation and configuration process in DHIS2. Identify applicable sections depending on the type of your import:

1. import into a blank instance
2. import into a DHIS2 instance with existing metadata.

The steps outlined in this document should be tested in a test/staging environment before either being repeated or transferred to a production instance of DHIS2.

## Requirements

In order to install the module, an administrator user account on DHIS2 is required.

Great care should be taken to ensure that the server itself and the DHIS2 application are well secured, access rights to collected data should be defined. Details on securing a DHIS2 system is outside the scope of this document, and we refer to the [DHIS2 documentation](https://docs.dhis2.org/).

## Metadata files

While not always necessary, it can often be advantageous to make certain modifications to the metadata file before importing it into DHIS2.

The Covid-19 Electronic Immunization Registry tracker package includes four metadata files. The contents and purposose of each individual file are described below:

| Package identifier                                            | Contents  | Purpose |
|---------------------------------------------------------------|-----------|---------|
| CVC_EIR-TRK-Electronic_Immunization_Registry_Covid19_Vaccines | Updated tracker package, <br> aggregate data set for automated tracker-to-aggregate-transfer, <br> dashboard based on aggregate indicator values | New implementation |
| CVC_EIR-AGG-Electronic_Immunization_Registry_Covid19_Vaccines | Aggregate data set for automated tracker-to-aggregate-transfer, <br> dashboard based on aggregate indicator values | Update to an existing tracker implementation, <br> Setup of tracker-to-aggregate transfer, <br> Use of Daily aggregate dashboard |
| CVC_EIR-DSH-Electronic_Immunization_Registry_Covid19_Vaccines | Aggregate dashboard with to-be-configured indicators | Specific use cases. Update to an existing tracker implementation, <br> Advanced configuration of aggregate indicators <br> Integration with existing metadata <br> Setup of tracker-to-aggregate transfer <br> Use of Daily aggregate dashboard |
| CVC_EIR-PI-Electronic_Immunization_Registry_Covid19_Vaccines  | 13 updated program indicators from the original package. <br> PIs are mapped to the aggregate data elements and Category option combinations in the daily aggregate data set | Update to an existing implementation |

> **Note**
>
> The package is not an out-of-the-box tool for tracker-to-aggregate data transfer.
> The structure of the metadata package and the suggested mapping of metadata allow the implementer to set up the transfer of data based on existing tools and guidance. More information is available in the [Tracker to aggregate data Transfer Document](https://github.com/dhis2/dhis2-docs-implementation/blob/master/content/maintenance_use/tracker-aggregate-integration.md).

## Mapping guide for data transfer

The 13 program indicators that can be used for tracker-to-aggregate data transfer are mapped to the corresponding data elements and category option combinations of the aggregate data set.

> **Example**
>
> Program indicator **Number of people receiving a first dose (Female 0-59)** `RJ6pdxga9Od`is mapped to the category option combination **Female, 0-59 years** `FsZSFGKirY0` of the data element **COVAC - People with 1st dose** `RjT7dmzunF4`

The mapping is based on codes of metadata objects.

The custom attribute **Data element for aggregate data export** `vudyDP7jUy5` contains the reference code of the aggregate data elements, eg. **CVC_EIR_AGG_PPL_1ST_DOSE**

The **Category option combination for agggregate export** field contains reference codes of the category option combinations, eg. **CVC_EIR_0059Y_F**

The suggested transfer of the tracker-to-aggregate values is based on the following GET and POST api requests:

1. Source request: `../api/analytics/dataValueSet.json?dimension=dx:` "{program indicator uid/s}" `&dimension=pe:` "{relative period/s}" `&dimension=ou:` {organisation unit level} `&outputIdScheme=ATTRIBUTE:` {"custom attribute:`vudyDP7jUy5`"}
2. Target request: `..api/dataValueSets?dataElementIdScheme=CODE&categoryOptionComboIdScheme=CODE&importStrategy=CREATE_AND_UPDATE&mergeMode=REPLACE&dryRun=false`

### Importing Program Indicators

The program indicators required for the aggregation of the data values are included in the program indicator group **COVAC - Tracker to aggregate** `NXBR4r6MwAO`

| Program Indicator                                                                                        | UID           | Code                            | DE for aggregate export          | CoC for aggregate export |
|----------------------------------------------------------------------------------------------------------|---------------|---------------------------------|----------------------------------|--------------------------|
| Number of people receiving a first dose (Female 0-59)                                                    | `RJ6pdxga9Od` | CVC_EIR_PPL_1ST_DOSE_0059Y_F    | CVC_EIR_AGG_PPL_1ST_DOSE         | 0059Y_F                  |
| Number of people receiving a first dose (Female 60+)                                                     | `x4L0LuEBHhW` | CVC_EIR_PPL_1ST_DOSE_60PLUSY_F  | CVC_EIR_AGG_PPL_1ST_DOSE         | 60PLUSY_F                |
| Number of people receiving a first dose (Male 0-59)                                                      | `hqm8znlAzkT` | CVC_EIR_PPL_1ST_DOSE_0059Y_M    | CVC_EIR_AGG_PPL_1ST_DOSE         | 0059Y_M                  |
| Number of people receiving a first dose (Male 60+)                                                       | `aIIHyDy8AMW` | CVC_EIR_PPL_1ST_DOSE_60PLUSY_M  | CVC_EIR_AGG_PPL_1ST_DOSE         | 60PLUSY_M                |
| Number of people receiving a second, third or booster dose (Female 0-59)                                 | `xY4T9hHXNji` | CVC_EIR_PPL_2ND_DOSE_0059Y_F    | CVC_EIR_AGG_PPL_2ND_DOSE         | 0059Y_F                  |
| Number of people receiving a second, third or booster dose (Female 60+)                                  | `h9G7i6mQKef` | CVC_EIR_PPL_2ND_DOSE_60PLUSY_F  | CVC_EIR_AGG_PPL_2ND_DOSE         | 60PLUSY_F                |
| Number of people receiving a second, third or booster dose (Male 0-59)                                   | `MGjwUUNsE60` | CVC_EIR_PPL_2ND_DOSE_0059Y_M    | CVC_EIR_AGG_PPL_2ND_DOSE         | 0059Y_M                  |
| Number of people receiving a second, third or booster dose (Male 60+)                                    | `qh0kIjHZbP8` | CVC_EIR_PPL_2ND_DOSE_60PLUSY_M  | CVC_EIR_AGG_PPL_2ND_DOSE         | 60PLUSY_M                |
| Number of people who received the last recommended dose for the respective vaccine product (Female 0-59) | `Zp39TSOR8eW` | CVC_EIR_PPL_LAST_DOSE_0059Y_F   | CVC_EIR_AGG_PPL_LAST_DOSE        | 0059Y_F                  |
| Number of people who received the last recommended dose for the respective vaccine product (Female 60+)  | `XFUvVgqPukT` | CVC_EIR_PPL_LAST_DOSE_60PLUSY_F | CVC_EIR_AGG_PPL_LAST_DOSE        | 60PLUSY_F                |
| Number of people who received the last recommended dose for the respective vaccine product (Male 0-59)   | `FZNIlzPRMmL` | CVC_EIR_PPL_LAST_DOSE_0059Y_M   | CVC_EIR_AGG_PPL_LAST_DOSE        | 0059Y_M                  |
| Number of people who received the last recommended dose for the respective vaccine product (Male 60+)    | `zovL7DKBRuK` | CVC_EIR_PPL_LAST_DOSE_60PLUSY_M | CVC_EIR_AGG_PPL_LAST_DOSE        | 60PLUSY_M                |
| Underlying conditions - People with                                                                      | `Zn0UuSRYyJw` | CVC_EIR_PPL_UNDER_CONDITIONS    | CVC_EIR_AGG_PPL_UNDER_CONDITIONS | DEFAULT                  |

These program indicators are part of the original package but need to be updated because of the added mapping.

> **Note**
>
> If the original program indicators in your system were modified as part of local adaptation process, be aware that all changes will be overwritten once you import the updated set of program indicators.
> If any of your modified program indicators have the same UID as the program indicators listed in the table above, make sure to duplicate the modified program indicators before import.

### Default data dimension

In early versions of DHIS2, the UIDs of the default data dimensions were auto-generated. Thus, while all DHIS2 instances have a default category option, data element category, category combination and category option combination, the UIDs of these defaults can be different. Later versions of DHIS2 have hardcoded UIDs for the default dimension, and these UIDs are used in the configuration packages.

To avoid conflicts when importing the metadata, it is advisable to search and replace the entire .json file for all occurrences of these default objects, replacing UIDs of the .json file with the UIDs from the instance in which the file will be imported. Table 1 shows the UIDs which should be replaced, as well as the API endpoints to identify the existing UIDs

|Object                       | UID           | API endpoint                                              |
|-----------------------------|---------------|-----------------------------------------------------------|
| Category                    | `GLevLNI9wkl` | `../api/categories.json?filter=name:eq:default`           |
| Category option             | `xYerKDKCefk` | `../api/categoryOptions.json?filter=name:eq:default`      |
| Category combination        | `bjDvmb4bfuf` | `../api/categoryCombos.json?filter=name:eq:default`       |
| Category option combination | `HllvX50cXC0` | `../api/categoryOptionCombos.json?filter=name:eq:default` |

Identify the UIDs of the default dimesions in your instance using the listed api requests and replace the UIDs in the json file with the UIDs from the instance.

> **NOTE**
>
> Note that this search and replace operation must be done with a plain text editor, not a word processor like Microsoft Word.

### Indicator types

Indicator type is another type of object that can create import conflict because certain names are used in different DHIS2 databases (.e.g "Percentage"). Since Indicator types are defined simply by their factor and whether or not they are simple numbers without a denominator, they are unambiguous and can be replaced through a search and replace of the UIDs. This avoids potential import conflicts, and avoids creating duplicate indicator types. Table 2 shows the UIDs which could be replaced, as well as the API endpoints to identify the existing UIDs

|Object                  | UID           | API endpoint                                                          |
|------------------------|---------------|-----------------------------------------------------------------------|
| Numerator only (number)| `CqNPn5KzksS` | `../api/indicatorTypes.json?filter=number:eq:true&filter=factor:eq:1` |

#### Tracked Entity Type

Like indicator types, you may have already existing tracked entity types in your DHIS2 database. The references to the tracked entity type should be changed to reflect what is in your system so you do not create duplicates. Table 3 shows the UIDs which could be replaced, as well as the API endpoints to identify the existing UIDs

|Object  | UID           | API endpoint                                           |
|------------------------|---------------|----------------------------------------|
| Person | `MCPQUTHX1Ze` | `../api/trackedEntityTypes.json?filter=name:eq:Person` |

#### Visualizations using Root Organisation Unit UID

Visualizations, event reports, report tables and maps that are assigned to a specific organisation unit level or organisation unit group, have a reference to the root (level 1) organisation unit. Such objects, if present in the metadata file, contain a placeholder `<OU_ROOT_UID>`. Use the search function in the .json file editor to possibly identify this placeholder and replace it with the UID of the level 1 organisation unit in the target instance.

### Option codes

According to the DHIS2 naming conventions, the metadata codes use capital letters, underscores and no spaces. Some exceptions that may occur are specified in the corresponding package documentation.
All codes included in the metadata objects in the current version of the package were adjusted to match the naming conventions. It may occur that the codes used in the earlier versions of the package used lower case characters. If data values in the existing implementations contain lower case codes, it is important to update those values directly in the database.

The table below contains all option sets where codes were changed to upper case in the metadata package. Before importing metadata into the instance, check whether the option sets in the existing system match those in the package .json and use the same upper case option codes.

| Option set name               | Option set UID |
|-------------------------------|---------------|
| COVAC - AEFI Pregnancy        | `ilxtWultuYP` |
| COVAC - Occupation            | `CNNH0YKxRh9` |
| COVAC - Trimester             | `kgDmgTYZICP` |
| COVAC Vaccine brand           | `UJTnyCB3cyk` |
| COVAC - Vaccine Manufacturers | `DtOGtoLbaB5` |
| COVAC - Vaccine Names         | `VQo3HkUlMHc` |
| Sex                           | `WDUwjiW2rGH` |
| Yes/No/Unknown                | `L6eMZDJkCwX` |

The table below contains metadata elements that use an affected option set:

| Metadata object          | Name                                   | UID            |
|--------------------------|----------------------------------------|---------------|
| Data element             | COVAC - Pregnancy                      | `BfNZcj99yz4` |
| Data element             | COVAC - Pregnancy gestation            | `CBAs12YL4g7` |
| Data element             | COVAC - Previously infected with COVID | `LOU9t0aR0z7` |
| Data element             | COVAC - Underlying condition           | `bCtWZGjSWM8` |
| Data element             | COVAC - Vaccine Brand                  | `rWYryQb3ohn` |
| Data element             | COVAC - Vaccine Manufacturer           | `rpkH9ZPGJcX` |
| Data element             | COVAC - Vaccine Name                   | `bbnyNYD1wgS` |
| Tracked Entity Attribute | COVID - Occupation                     | `LY2bDXpNvS7` |
| Tracked Entity Attribute | Sex                                    | `oindugucx72` |

> **Important**
>
> During the import, the existing option codes will be overwritten with the updated upper case codes.
> In order to update the data values for existing data in the database, it is necessary to update the values stored in the database using database commands.
> Make sure to map existing old option codes and new option codes before replacing the values. Use staging instance first, before making adjustments on the production server.

For data element values, use:

```SQL
UPDATE programstageinstance
SET eventdatavalues = jsonb_set(eventdatavalues, '{"<affected data element uid>","value"}', '"<new value>"')
WHERE eventdatavalues @> '{"<affected data element uid>":{"value": "<old value>"}}'::jsonb
AND programstageid=<database_programsatgeid>;
```

For tracked entity attribute values, use:

```SQL
UPDATE trackedentityattributevalue
SET value = <new value>
WHERE trackedentityattributeid=<affected trackedentityattribute database_id> AND value=<old value>;
```

> **Example**
>
> To replace the option code 'yes' with 'YES' for existing data values (data element COVAC - Previously infected with COVID `LOU9t0aR0z7`) in the programstage with the id=1510410385 (example id), the command will be configured as follows:
>
> ```SQL
> UPDATE programstageinstance
> SET eventdatavalues = jsonb_set(eventdatavalues, '{"LOU9t0aR0z7","value"}', '"YES"')
> WHERE eventdatavalues @> '{"LOU9t0aR0z7":{"value": "yes"}}'::jsonb
> AND programstageid=1510410385;
> ```

### Sort order for options

Check whether the sort order `sortOrder` of options in your system matches the sort order of options included in the metadata package. This only applies when the json file and the target instance contain options and option sets with the same UID.

After import, make sure that the sort order for options within an option set starts from 1.

## Importing metadata

Use [Import/Export](#import_export) DHIS2 app to import metadata packages. It is advisable to use the "dry run" feature to identify issues before attempting to do an actual import of the metadata. If "dry run" reports any issues or conflicts, see the [import conflicts](#handling-import-conflicts) section below. If the "dry run"/"validate" import works without error, attempt to import the metadata. If the import succeeds without any errors, you can proceed to [configuring](#configuration) the module. In some cases, import conflicts or issues are not shown during the "dry run", but appear when the actual import is attempted. In this case, the import summary will list any errors that need to be resolved.

### Handling import conflicts

> **NOTE**
>
> If you are importing the package into a new DHIS2 instance, you will not experience import conflicts, as there is no metadata in the target database. After import the metadata, proceed to the “[Configuration](#configuration)” section.

There are a number of different conflicts that may occur, though the most common is that there are metadata objects in the configuration package with a name, shortname and/or code that already exist in the target database. There are a couple of alternative solutions to these problems, with different advantages and disadvantages. Which one is more appropriate will depend, for example, on the type of object for which a conflict occurs.

#### Alternative 1

Rename the existing object in your DHIS2 database for which there is a conflict. The advantage of this approach is that there is no need to modify the .json file, as changes are instead done through the user interface of DHIS2. This is likely to be less error prone. It also means that the configuration package is left as is, which can be an advantage for example when updates to the package are released. The original package objects are also often referenced in training materials and documentation.

#### Alternative 2

Rename the object for which there is a conflict in the .json file. The advantage of this approach is that the existing DHIS2 metadata is left as-is. This can be a factor when there is training material or documentation such as SOPs of data dictionaries linked to the object in question, and it does not involve any risk of confusing users by modifying the metadata they are familiar with.

Note that for both alternative 1 and 2, the modification can be as simple as adding a small pre/post-fix to the name, to minimise the risk of confusion.

#### Alternative 3

A third and more complicated approach is to modify the .json file to re-use existing metadata. For example, in cases where an option set already exists for a certain concept (e.g. "sex"), that option set could be removed from the .json file and all references to its UID replaced with the corresponding option set already in the database. The big advantage of this (which is not limited to the cases where there is a direct import conflict) is to avoid creating duplicate metadata in the database. There are some key considerations to make when performing this type of modification:

* it requires expert knowledge of the detailed metadata structure of DHIS2
* the approach does not work for all types of objects. In particular, certain types of objects have dependencies which are complicated to solve in this way, for example related to disaggregations.
* future updates to the configuration package will be complicated.

## Configuration

Once all metadata has been successfully imported, there are a few steps that need to be taken before the module is functional.

### Sharing

First, you will have to use the *Sharing* functionality of DHIS2 to configure which users (user groups) should see the metadata and data associated with the programme as well as who can register/enter data into the program. By default, sharing has been configured for the following:

* Tracked entity type
* Program
* Program stages
* Dashboards

There are four user groups that come with the package. By default the following permissions are assigned to these user groups:

* COVAC - COVID-19 Immunization Metadata Admin
* COVAC - COVID-19 Immunization Data Entry
* COVAC - COVID-19 Immunization Data Analysis
* COVAC - Covid-19 Immunization Data Admin

|Object                   |User Group                                     |                                                   |                                                     |                                                     |
|-------------------------|-----------------------------------------------|---------------------------------------------------|-----------------------------------------------------|-----------------------------------------------------|
|                         | _COVAC - COVID-19 Immunization Data Analysis_ | _COVAC - COVID-19 Immunization Metadata Admin_    | _COVAC - COVID-19 Immunization Data Entry_          | _COVAC - COVID-19 Immunization Data Admin_          |
| _*Tracked entity type*_ | Metadata : can view <br> Data: can view       | Metadata : can edit and view <br> Data: can view  | Metadata : can view <br> Data: can capture and view | Metadata : can view <br> Data: can view             |
| _*Program*_             | Metadata : can view <br> Data: can view       | Metadata : can edit and view <br> Data: can view  | Metadata : can view <br> Data: can capture and view | Metadata : can view <br> Data: can view             |
| _*Program Stages*_      | Metadata : can view <br> Data: can view       | Metadata : can edit and view <br> Data: can view  | Metadata : can view <br> Data: can capture and view | Metadata : can view <br> Data: can view             |
| _*Dashboards*_          | Metadata : can view                           | Metadata : can edit and view                      | No Access                                           | Metadata : can view                                 |
| _*Data Sets*_           | Metadata : can view <br> Data: can view       | Metadata : can edit and view <br> Data: No access | No Access                                           | Metadata : can view <br> Data: can capture and view |

The users are assigned to the appropriate user group based on their role within the system. Sharing for other objects in the package may be adjusted depending on the set up. Refer to the [DHIS2 Documentation on sharing](#sharing) for more information.

### User Roles

Users will need user roles in order to engage with the various applications within DHIS2. The following minimum roles are recommended:

1. Tracker data analysis : Can see event analytics and access dashboards, event reports, event visualizer, data visualizer, pivot tables, reports and maps.
2. Tracker data capture : Can add data values, update tracked entities, search tracked entities across org units and access tracker capture

Refer to the [DHIS2 Documentation](https://docs.dhis2.org/) for more information on configuring user roles.

### Organisation Units

The program and the data setsmust be assigned to organisation units within existing hierarchy in order to be accessible via tracker capture/capture apps.

### Duplicated metadata

> **NOTE**
>
> This section only applies if you are importing into a DHIS2 database in which there is already meta-data present. If you are working with a new DHIS2 instance, please skip this section and go to [Adapting the tracker program](#adapting-the-tracker-program).”

Even when metadata has been successfully imported without any import conflicts, there can be duplicates in the metadata - data elements, tracked entity attributes or option sets that already exist. As was noted in the section above on resolving conflict, an important issue to keep in mind is that decisions on making changes to the metadata in DHIS2 also needs to take into account other documents and resources that are in different ways associated with both the existing metadata, and the metadata that has been imported through the configuration package. Resolving duplicates is thus not only a matter of "cleaning up the database", but also making sure that this is done without, for example, breaking potential integrating with other systems, the possibility to use training material, breaking SOPs etc. This will very much be context-dependent.

One important thing to keep in mind is that DHIS2 has tools that can hide some of the complexities of potential duplications in metadata. For example, where duplicate option sets exist, they can be hidden for groups of users through [sharing](#sharing).

## Adapting the tracker program

Once the programme has been imported, you might want to make certain modifications to the programme. Examples of local adaptations that *could* be made include:

* Adding additional variables to the form.
* Adapting data element/option names according to national conventions.
* Adding translations to variables and/or the data entry form.
* Modifying program indicators based on local case definitions

However, it is strongly recommended to take great caution if you decide to change or remove any of the included form/metadata. There is a danger that modifications could break functionality, for example program rules and program indicators.

## Removing metadata

In order to keep your instance clean and avoid errors, it is recommended that you remove the unnecessary metadata from your instance.

The original dashboard **COVAC - COVID-19 vaccine registry** `YYtAbckt77l` has been removed from the updated package and replaced by the new dashboard: **COVAC - Daily monitoring** `iBWlFCvvtkH`

In order to remove the old dashboard from your system, you need to:

1. Note the names/UIDs of all objects included on the dashboard.
2. Remove all dashboard items from the dashboard and save.
3. Delete the dashboard.
4. Delete all visualizations, maps, event reports and report tables included in the original dashboard.

> **NOTE**
>
> It is possible to delete the dashboard, its dashboard items and all relevant visualizations, maps and reports directly from the database using SQL commands.
