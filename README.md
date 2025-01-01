# Hospital Database Management System

## Description
A comprehensive database management system designed for hospital operations, enabling efficient management of patients, staff, medical records, appointments, and equipment. This project simulates a real-world hospital environment, focusing on relational database design, Python integration, and user-friendly interfaces for healthcare professionals.

## Features
- **Patient Management**: 
  - Add, update, and delete patient records.
  - View medical histories and manage patient statuses.
- **Appointment Scheduling**: 
  - Schedule, view, and manage appointments.
  - Generate detailed reports by department and appointment times.
- **Medical Records**: 
  - Record and update diagnoses, treatments, and prescriptions for each patient.
- **Staff Management**: 
  - Maintain records of doctors, nurses, and their department affiliations.
- **Equipment Tracking**: 
  - Manage hospital equipment details, including condition, location, and usage.
- **Reporting and Visualizations**:
  - Calculate the average age of patients.
  - Generate graphs showing appointment times and frequency by hour.
  - Count appointments by department.
  - Provide prescription summaries for individual patients.

## Technical Specifications
- **Database**: MySQL
- **Programming Language**: Python
  - **Libraries**:
    - `mysql.connector`, `pymysql`: For database connectivity.
    - `pandas`: For data manipulation and visualization.
    - `matplotlib`: For creating graphical reports.
- **Environment**: Jupyter Notebook (via Anaconda)

## Lessons Learned
- Emphasized the importance of logical thinking and understanding real-world workflows before implementation.
- Gained experience in time management and iterative database design improvement.
- Developed insights into structuring complex data relationships for scalable healthcare systems.

## Future Work
- Enhance usability with an intuitive interface tailored for hospital staff.
- Implement inter-hospital data sharing while ensuring compliance with patient privacy regulations.
- Optimize database queries for faster performance and scalability.


# Demo:

### Can insert, read, update, delete, or view insights
<img width="795" alt="image" src="https://github.com/user-attachments/assets/3afbf2f0-6155-4d6c-91e8-9ff7fdef4a12" />

## Let's say we want to "insert" data:
<img width="791" alt="image" src="https://github.com/user-attachments/assets/73f861f5-556b-4987-9c7b-4b0d1c08b659" />

### We want to enter the data in a specific row. Let's say we are entering "Patient" data:
<img width="976" alt="image" src="https://github.com/user-attachments/assets/c4eef264-d776-446a-9497-5702ce791982" />
Provides a view of the existing table


### Asks for information pertaining the the patient, can give a response up to the doctor first and last name:
<img width="1008" alt="image" src="https://github.com/user-attachments/assets/9221abd5-3e6f-4010-abef-a946a2122ff7" />

### If successfully added, will update the table. If not, will produce an error and allow the user to enter in information again.
Example of a successful add.


<img width="1009" alt="image" src="https://github.com/user-attachments/assets/29d8431d-5644-4654-9ed9-960ea30b1a51" />

Example of an unsuccessful add.
<img width="1022" alt="image" src="https://github.com/user-attachments/assets/0b05e034-3dd6-4621-aa1b-a45cc27aa65f" />


## Can also simply read a table:
<img width="1015" alt="image" src="https://github.com/user-attachments/assets/3e9eda74-c03b-45ec-93c7-3603f26c73f9" />
Here we are reading the "Doctor" table


## Updating a table of existing data:
### I want to now update the information for Jack Black, his name is actually Josh, not Jack. His number is also 321-321-321 instead of 123-123-123, but all the other information is the same:
<img width="1019" alt="image" src="https://github.com/user-attachments/assets/eccca9f2-d8ed-47c3-9e3d-d797a3f6a40f" />

### Now I can enter in new information for each column:
<img width="1014" alt="image" src="https://github.com/user-attachments/assets/87f726ee-533b-479c-8b78-037222ae64ca" />

As you can see, the table now updates itself. 


## Deleting a row:
### Now I want to delete "Josh Black" from the system. 
<img width="1031" alt="image" src="https://github.com/user-attachments/assets/2cbde185-703e-4515-bb6e-1a8ee9f663da" />

### Let's delete from the Patient table. We enter in first name, last name, and birthdate:
<img width="1050" alt="image" src="https://github.com/user-attachments/assets/8bbcbaac-0d07-4b35-b1a7-67f615cf45cb" />

Now, the entire row of the patient is deleted from the database. 

# There are a couple other cool things this database can do, but this is the gist of it! 

---
