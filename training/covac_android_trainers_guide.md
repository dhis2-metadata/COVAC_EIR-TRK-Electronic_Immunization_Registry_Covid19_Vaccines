# COVAC - Android Trainer's Guide

**DHIS2 Android App**

**DHIS2 Immunization Toolkit**

**COVID-19 Vaccination Registry**

## Preparation Notes

In order to modify this guide, you will have to review the local SOPs that are in place and modify any workflow or features discussed in the order the user will interact with them

1. If it is the procedure to enter this data from a paper form, it will be useful to have a copy of the form they would normally use as reference filled in. This can just be a form that you have filled in yourself, or can be a copy of a form from the actual implementation that you have received from the Ministry of Health.
2. If they are entering data in real-time, then having forms is not necessarily required but you should prepare the details of an example case that you can follow in your examples.
3. For the exercises and activities during the demo, ensure there are copies of forms or case-studies that the participants can use to register their own cases.
4. Your training DB should have some existing cases filled in to help support demonstrating search and filter functionality
5. If demonstrating the filter functionality, you will need to have data entered that meets the criteria of each of the filters you are demonstrating
6. To demonstrate the upcoming and overdue filter functionalities, you will need to schedule cases for either their first or second dose (but not fill in data for their dose). This should be a mix of individuals scheduled in both previous and upcoming days from the day of the training itself so you can demonstrate both filter types.

Step by Step Guide

Log in to the DHIS2 system from the Android app using the username and password

1. Review the org unit and program selection and select a health facility to work in
2. Briefly describe the first page list if this appears, but note that we will get back to this later on

## Accessing the Program

1. When you first log in to DHIS2 you will be taken to a home screen that lists all your data sets and/or programs
2. You can access the program you are working with by selecting it from this home screen

## Registering a New Person

1. After selecting the program you will be taken to the main search/registration screen within the android app
2. To register someone on android, you need to perform a search first. This is in order to reduce duplicates. Enter an individual’s details and perform a search
3. If the search does not return any results, register a new person.
4. Select the organisation unit and date of enrollment for the person to proceed to the registration page
   * Describe the enrollment date which is called ‘Date of registration’ _[note to trainer: replace with the name from your config]_
5. Review the enrollment details that you have configured. Describe the attributes that you are using and why they are there. Note that these attributes allow you to track this person as they go through the program, including finding them later on which will also be demonstrated. Attributes included in the standard COVID-19 Vaccine package are described within the system design document. Attributes in which data was entered for during the search will be carried over during registration.
   * Describe the generation process of Local ID and System Generated Unique ID. The Local ID is locally assigned while the Unique System Identifier is system generated. Please refer to the system design document for more details.[note to trainer :  if you modify the way these ID’s work, please replace the description here]
6. Enter data for the attributes. If using a paper form, use it as reference to describe how each detail from the form gets filled in to DHIS2. After you have entered and explained the details for the enrollment, select Save

STOP

## Exercise 1 - Access the Program and Register a New Person

## Tracker Dashboard

1. After you save the details, you will be confronted with the tracker dashboard. There are many different elements to review within the tracker dashboard; however you can skip them initially and come back to them after you have entered some data
2. Focus on the actual program stage element within the person’s dashboard. This allows you to add new events and enter data for the person.
   * Quickly recap the stages that are within the program (namely ‘Vaccination’) referring back to any background presentation(s) or demos you have already done.
   * Explain that the same information is collected during their 1st and 2nd dose. We will come back to the 2nd dose shortly. 

## Data Entry

## Vaccination - 1^st^ Dose

1. The Vaccination stage is automatically generated. Depending on your configuration, the event for the 1st dose may or may not also be generated. If it is not automatically generated you will need to create the event. [Note to trainer : follow the local procedure based on the configuration within the implementation you are supporting]
2. After you have generated the event or selected a scheduled/automatically created event within the vaccination stage, you can review the details of the 1st dose.
3. There are a number of program rules that are used to hide/show fields in the data entry page. Describe these rules to the participant. Please refer to the metadata review file for the logic within the data entry form.
4. After you have explained the location of hidden fields and the triggers for them, reset the form by deleting these values (or delete the event and create a new one). You should now see the form for the Vaccination stage in its original layout.
5. Take your example case that you have prepared and enter the details into the first stage.
6. If you are satisfied with the details you have entered, you can complete the event.
7. Upon completing the event, you will be asked to schedule the 2nd dose. Schedule this based on the “suggested date of next dose” for your vaccine product.
8. Once this is scheduled, you should have two events within the Vaccination stage. Once should be completed and one should be scheduled; you can describe how this is displayed to the participants.

STOP

## Exercise 2 – Fill in 1^st^ Dose Details and Schedule the 2^nd^ Dose

## Synchronizing Data

1. It would now be a good time to discuss the synchronization strategy for your implementation. For example, what is the default rate at which data is synchronized (1 hour, 24 hours).
2. Show them how to manually synchronize the data to the server from the android home page. This will upload all of the data they have entered for that program to the server
3. You can show them the TEIs that you/they created on android through the web interface to verify that the data has been synchronized correctly.
4. After syncing your data, there will be no sync icon on the android device because all data has been synced. As you start entering new data that is not yet synced, this icon will re-appear.

## Searching

1. Log in and select your program from the android home page
2. Find the previous case that you had just entered (and scheduled your 2nd dose for) with your user

STOP

## Exercise 3 – Sync Data and Review the Search Functionality to Find a Case

## Vaccination – 2^nd^ Dose

1. Select the scheduled 2nd dose from within the Vaccination stage
2. Select the date of the vaccination and proceed to enter any details on the 2nd dose based on the paper form or case study you are using as reference
   * Note any additional program rules that trigger other elements within the 2nd dose (ie. Based on your config you may see message to complete the program, or new data elements related to the 1st dose, etc.)
3. Finish and complete the entry

STOP

## Exercise 4 – Fill in 2^nd^ Dose Details

## Completing the Program Enrollment

1. In this program, when you have completed the event, this means you have also completed data entry for that stage (as none of the stages in this program are repeatable). This process should now have occurred for each of the 2 stages in this program as you have instructed the participant’s to select the “complete” button during the demo and their exercises at the end of each stage.
2. When all the events within the program have been marked as completed, this should also mean data entry for this enrollment is complete. At this point, explain what completing an enrollment means (they have received all required doses of the vaccine)
3. Complete the enrollment of your case and review the stages to see the effect this has  (you can no longer edit any data within the events; you can no longer incomplete any of the events)
4. Go back to your initial search page, and update it using the filter for completed enrollments. The case you have been working on should now be at the top of the list.

STOP

## Exercise 5 - Complete the Enrollment

## Review the Tracker Dashboard

1. Staying on the dashboard of the case you have now filled in all the data for, now would be a good time to review some of the other elements  available on the person’s dashboard.

## Exercise 6 - Perform All Concepts Discussed

Register a new case, enter data into each stage, use the search/filters to find a case, update a case, complete enrollments

## Using Filters

The search/registration section of the android capture app allows you to select filters that allow you to create lists for the “upcoming events” in order to retrieve lists of people are scheduled to received their 2nd dose as well as the “overdue events” to retrieve a list of people who were scheduled but did not receive their 2nd dose. There are also a number of other useful filters that can be used from within this portion of the app.

## Upcoming Doses

> **Note**
>
> Note to trainer: You must have scheduled doses already available in your system to perform this demo. This will involve having people registered in the Covid-19 vaccination program in which the second dose is scheduled in a future date from when you perform this demo/exercise.

To create a filter to retrieve those individuals scheduled for their second dose:

1. Select the filter button from within the search/registration screen of the android app
2. Select “Schedule” under the “event status” filter group
3. Select applicable dates under the “event date” filter group
4. To filter within a specific organisation unit, select an organisation unit as an additional filter
5. The list will be retrieved and available for viewing immediately

STOP

## Exercise 7 – Run a Report to Identify the Date People are Scheduled For Their 2^nd^ Dose

## Overdue Doses

> **Note**
>
> Note to trainer: You must have missed doses already available in your system to perform this demo/exercise. This will involve having people registered in the Covid-19 vaccination program in which the second dose is scheduled on a date that has ALREADY PASSED from when you perform this demo/exercise.

To run a report to retrieve those individuals who have missed their second dose:

1. Select the filter button from within the search/registration screen of the android app
2. Select “Overdue” under the “Event status” filter group
3. Select “Active” dates under the “Enrollment status” filter group
4. To filter within a specific organisation unit, select an organisation unit as an additional filter
5. The list will be retrieved and available for viewing immediately

STOP

## Exercise 8 – Run a Report to Identify People That Have Missed Their 2^nd^ Dose
