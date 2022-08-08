# neighborhood-care
An iOS App developing with swift language to record issues found in any neighborhoods

### Developed by:
- **Name**: Juliano Costa Silva
- **Course**: Mobile Development
- **Subject**: Native Development for iOS
- **Class**: 185835
- **Task**: Task 3 (2686061)


Now that we've learned the basics of developing iOS apps, let's put this knowledge into practice by creating an app that will help us take care of our neighborhood!

The proposal is that you create an application where the user can register any problem that he sees in his neighborhood or in his city. Found a faulty traffic light? A broken road sign? Hole in the street or on the sidewalk? Damaged Recycle Bin? Open the app and register this problem (with photo, location and other information) so that you can later contact the responsible body.

## The application should work as follows:

1) The application will have 3 screens: **Listing, Viewing and Editing/Adding**;

2) The initial screen will be the Listing screen, a TableViewController where all the problems registered by the user will be listed. The name and date of the registered problem should appear in this list;

3) Navigation between screens will be done via NavigationController;

4) From the initial screen, the user will be able to add a new register (by clicking on any present button) or select one of the listed items;

5) He can also delete an item using the Swipe gesture;

6) When selecting a record, it will be taken to the **Show** screen, where all its data will be presented, which are:
    * Name
    * Location (address)
    * Photograph
    * Description

    Below is an example:

    - **Name**: sidewalk hole
    - **Address**: Av. Lins de Vasconcelos 3100, Aclimação, São Paulo – SP
    - **Description**: This hole of approximately 80 cm in diameter, found on the right sidewalk (center direction) in front of Lins' Pet Shop, is hindering the circulation of pedestrians who often end up having to invade the road at the risk of being run over.

7) From this screen, he can go back to the **List** screen or go to the **Edit/Add** screen;

8) The Edit/Add screen will be used both for edit an existing register (changing its data) and for add a new one. If it is accessed from the add button on the **Listing** screen, it will enter "Adding" mode. If accessed from the **Show** screen, it will enter "Edit" mode;

9) Data must be stored using **Core Data**;

10) All application user interface (UI) definition will be up to the student.
