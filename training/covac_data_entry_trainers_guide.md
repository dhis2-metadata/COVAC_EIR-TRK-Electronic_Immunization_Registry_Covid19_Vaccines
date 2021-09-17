# COVAC - Data Entry Trainer's Guide { #covac-data-entry-trainers-guide }

**DHIS2 Immunization Toolkit**

**COVID-19 Vaccination Registry**

## Preparation Notes

In order to modify this guide, you will have to review the local SOPs that are in place and modify any workflow or features discussed in the order the user will interact with them

1. If it is the procedure to enter this data from a paper form, it will be useful to have a copy of the form they would normally use as reference filled in. This can just be a form that you have filled in yourself, or can be a copy of a form from the actual implementation that you have received from the Ministry of Health.

2. If they are entering data in real-time, then having forms is not necessarily required but you should prepare the details of an example case that you can follow in your examples.

3. For the exercises and activities during the demo, ensure there are copies of forms or case-studies that the participants can use to register their own cases.

4. Your training DB should have some existing cases filled in to help support demonstrating search, filter and dashboard functionality

5. If demonstrating the working lists functionality, you will need to have data entered that meets the criteria of each of the filters you are demonstrating

6. To demonstrate the upcoming and overdue events report functionalities, you will need to schedule cases for their second dose (but not fill in data for their second dose). This should be a mix of individuals scheduled in both previous and upcoming days from the day of the training itself so you can demonstrate both reports.

## Step by Step Guide

1. Log in to the DHIS2 system using the Username and password

2. Navigate to tracker capture

3. Review the org unit and program selection and select a health
    facility to work in

4. Briefly describe the first page list if this appears, but note that
    we will get back to this later on

### Registration (New Case)

1. Anytime we have a new person that is receiving their vaccination, we will need to register them in DHIS2. Select Register to register a new person receiving their vaccine

2. Review the enrollment page that you have configured. Describe the attributes that you are using and why they are there. Note that these attributes allow you to track this person as they go through the program, including finding them later on which will also be demonstrated. Attributes included in the standard COVID-19 Vaccine package are described within the system design document.

    a.  Describe the enrollment date which is called 'Registration date'

    b.  Describe the generation process of Local ID and System Generated Unique ID. The Local ID is locally assigned while the Unique System Identifier is system generated. Please refer to the system design document for more details.

3. Enter data for the attributes. If using a paper form, use it as reference to describe how each detail from the form gets filled in to DHIS2. After you have entered and explained the details for the enrollment, select **Save and continue**.

STOP

### Exercise 1 - Register a new case

### Tracker Dashboard

1. After you save the details, you will be confronted with the _*tracker dashboard*_. This is often overwhelming but ensure a default layout is available so everyone is seeing the same thing.
2. The suggestion is to skip over all the other widgets initially and focus on the *data entry widget*. You can come back to the other widgets after some data has been entered.
   1. Quickly recap the stages that are within the program (namely 'Vaccination') referring back to any background presentation(s)
        or demos you have already done.
   2. Explain that the same information is collected during their
        1^st^ and 2^nd^ dose. We will come back to the 2^nd^ dose
        shortly.

## Data Entry

### Vaccination - 1^st^ dose

1. The Vaccination stage is automatically generated. You will have to fill in a date in which the dose is given on manually in order to see the rest of the form.
2. There are a number of program rules that are used to hide/show fields in the data entry page. Describe these rules to the participant. Please refer to the metadata review file for the logic within the data entry form.
3. After you have explained the location of hidden fields and the triggers for them, reset the form by deleting these values (or delete the event and create a new one). You should now see the form for the Vaccination stage in its original layout.
4. Take your example case that you have prepared and enter the details into the first stage
5. If you are satisfied with the details you have entered, you can **complete** the event.
6. There will be buttons to **delete** the event or print the form as well. There are multiple delete buttons for the event, enrollment and entity. Users may only have authority to perform certain delete actions. Only review the delete functions that are relevant to the group you are working with.
7. Upon completing the event, you will be asked to schedule the 2^nd^ dose. Schedule this based on the "suggested date of next dose" for your vaccine product

STOP

### Exercise 2 - Fill in 1^st^ dose details and schedule the 2^nd^ dose

### Searching

1. Log in as the data entry user. Navigate back to tracker capture, and select the facility in which the case you want to update resides in
2. There are several filters that are available when looking at the initial line list page within tracker capture. This include pre-defined lists that have been brought in as part of the vaccination package. These filters are all useful and you can describe them now.
3. After explaining these conceptually, note that we will eventually go through and complete cases at the end of this demo. Show them how the filters work to reduce the line list in their facility, and also open up an active vs. completed case to show them how data entry and the tracker dashboard will look different between the two.
4. There is also a search feature that will allow us to find our cases. Select Search and enter details of an existing case. This will bring the case up and you can select them to be taken to the tracker dashboard. This is useful if you need to find a specific case for any purpose.
5. Before proceeding, find the **previous case** that you had just entered with your facility user

STOP

### Exercise 3 - Review the search and filter functionality to find a case

### Vaccination - 2^nd^ dose

1. The Vaccination stage is automatically generated. You will have to fill in a date in which the dose is given on manually in order to see the rest of the form. The date in which you enter can be different then the due date. Explain why this is to the participants.
2. There are a number of program rules that are used to hide/show fields in the data entry page. Describe these rules to the participant. Please refer to the metadata review file for the logic within the data entry form.
3. After you have explained the location of hidden fields and the triggers for them, reset the form by deleting these values (or delete the event and create a new one). You should now see the form for the Vaccination stage in its original layout.
4. Take your example case that you have prepared and enter the details into the second stage
5. If you are satisfied with the details you have entered, you can **complete** the event.
6. There will be buttons to **delete** the event or print the form as well. There are multiple delete buttons for the event, enrollment and entity. Users may only have authority to perform certain delete actions. Only review the delete functions that are relevant to the group you are working with.
7. Upon completing the event, you will be asked to schedule the another dose. Cancel this scheduling, as they will receive no further doses.

STOP

#### Exercise 4 - Fill in 2^nd^ dose details

### Review the tracker dashboard

1. Staying on the dashboard of the case you have now filled in all the data for, now would be a good time to review some of the other widgets available on the tracker dashboard. Useful widgets would be the enrollment widget, the top bar widget and the profile widget in particular.
2. You can also show users how to modify and save the default layout of the tracker dashboard to fit their individual needs if supported in their implementation (note: the user will need access to do this and there may be a default layout that is saved by an admin that will override their changes)

### Completing the program enrollment

1. In this program, when you have completed the event, this means you have also completed data entry for that stage (as none of the stages in this program are repeatable). This process should now have occurred for each of the 2 stages in this program as you have instructed the participant's to select the "complete" button during the demo and their exercises at the end of each stage.

2. When all the events within the program have been marked as completed, this should also mean data entry for this enrollment is complete. At this point, explain what completing an enrollment means (they have received all required doses of the vaccine)

3. Complete the enrollment of your case and review the stages to see the effect this has (you can no longer edit any data within the events; you can no longer incomplete any of the events)

4. Go back to your working list, and update it using the filter for completed enrollments. The case you have been working on should now be at the top of the list.

STOP

### Exercise 5 - Complete the enrollment

### Exercise 6 - Perform all concepts discussed

Register a new case, enter data into each stage, use the search/filters to find a case, update a case, complete enrollments

## Reports

The reports section of the tracker capture app is particularly useful in this scenario as there will often be a significant gap between the 1^st^ and 2^nd^ dose of the covid vaccination. It is particularly useful to demonstrate for the "upcoming events" report in order to retrieve lists of people are scheduled to received their 2^nd^ dose as well as the "overdue events" report to retrieve a list of people who were scheduled but did not receive their 2^nd^ dose. It is also possible to retrieve these lists using the front page list filters available with the package; however these reports include the date they are/were scheduled to come which is not available when using the front page list filters.

### Upcoming Doses

**Note to trainer: You must have scheduled doses already available in your system to perform this demo. This will involve having people registered in the Covid-19 vaccination program in which the second dose is scheduled in a future date from when you perform this demo/exercise.**

To run a report to retrieve those individuals scheduled for their second dose:

1. Select "reports" from the left side menu within tracker capture
2. Select the "upcoming events" report. This report will allow you to make a list of those who are scheduled to receive their 2^nd^ dose of their COVID-19 vaccination.
3. Fill in the parameters for the report:
   1. **Organisation Unit** : This is the parent org unit that is included in the report
   2. **Program** : Select the covid vaccination program
      3. **Organisation unit scope** -- there are 3 options
      4. Selected : create a report including people registered within the org unit you have selected
      5. Immediate children : create a report including people registered within the org unit you have selected and the organisation unit level directly below it
      6. All children : create a report including people registered within the org unit you have selected and all of the organisation unit levels below it
   3. **Filter** : allows you to filter out those people that you have marked for follow-up
   4. **Date** : allows you to specify which date you want include in the report. Note that this is essentially the date of their second dose, so if you select "events due today" this will give you a list of people that are scheduled for their second dose today. This can be useful to retrieve a daily list of records that are due for their second dose within the vaccination site(s) you have selected

4. Select "go" to run the report

As you can retrieve a list of individuals scheduled for their second dose, it may be useful to include items such as mobile phone number and email in this list if you want to manually remind these individuals of their upcoming scheduled visit. You can decide what attributes are displayed on the front page list or reports such as these within the program configuration under the attributes section. The option "display in list" decided which attributes are shown on these lists.

STOP

### Exercise 7 - Run a report to identify the date people are scheduled for their second dose

### Overdue Doses

**Note to trainer: You must have missed doses already available in your system to perform this demo/exercise. This will involve having people registered in the Covid-19 vaccination program in which the second dose is scheduled on a date that has ALREADY PASSED from when you perform this demo/exercise.**

To run a report to retrieve those individuals who have missed their
second dose:

1. Select "reports" from the left side menu within tracker capture
2. Select the "overdue events" report. This report will allow you tomake a list of those who have missed their scheduled 2^nd^ dose of their COVID-19 vaccination.
3. Fill in the parameters for the report:
    1. **Organisation Unit** : This is the parent org unit that is included in the report
    2. **Program** : Select the covid vaccination program
    3. **Organisation unit scope** -- there are 3 options
        1. Selected : create a report including people registered within the org unit you have selected
        2. Immediate children : create a report including people registered within the org unit you have selected and the organisation unit level directly below it
        3. All children : create a report including people registered within the org unit you have selected and all of the organisation unit levels below it
    4. **Filter** : allows you to filter out those people that you have marked for follow-up
4. The report will run as you select these parameters automatically, showing you the due date in which they were scheduled to receive their 2^nd^ vaccination dose.

STOP

### Exercise 8 - Run a report to identify people that have missed their second dose
