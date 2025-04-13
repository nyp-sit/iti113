<img src="https://www.nyp.edu.sg/content/dam/nypcorp/sg/en/common/logo-nyp.svg" alt="nyplogo" width="300"/>

# ITI113 Machine Learning Project

## Work Integration Unit
 
In this work integration unit, learners will apply their machine learning knowledge to solve a real-world business problem, demonstrating the ability to identify, translate, and deploy a practical ML solution. Additionally, learners will learn to ensure ML solution is trustworthy by applying AI governance and responsible AI principles, considering ethical and social implications.

## Learning Unit Outcomes

1. Integrate machine learning knowledge to solve a real-world business problem
2. Demonstrate ability to build, deploy and operationalise a practical ML solution
3. Build trustworthy machine learning systems with reference to AI governance and responsible AI principles.


## Project Team

You are expected to form a project team of up to 3 members.

Each member should own one focus area (e.g. exploratory data analysis and data preparation, ML model experimentation, building data and machine learning pipeline, deployment etc) and be able to complete the associated tasks independently. Marks will be deducted for individuals who rely heavily on others to complete their tasks.

The role of project mentor is to provide guidance on your project proposal, and to make sure you are on the right track in your milestones and final presentation and report.


Please fill up the [online form](https://forms.gle/ups1e22T4Y8dqNRt8) of your project team members.

## Deliverables and Assessment Components

This project consists of the following components:

| Assessment components | Group | Individual | Total |
| --------------------- | ----- | ---------- | ----- |
| Project Proposal      | 20%   |            | 20%   |
| Milestone Report      | 10%   | 15%        | 25%   |
| Final Presentation    | 5%    | 20%        | 25%   |
| Final Report          | 10%   | 20%        | 30%   |

**Submission deadlines:**

- Project Proposal - 27 Jul 23:59
- Milestones Report - 17 Aug 23:59
- Final Report - 27 Aug 23:59
- Final Presentation - 27 Aug (detailed schedule will be released nearer to presentation day)

## Project Proposal

In the project proposal, your team will pick a problem from the given **[list of suggested projects](./project-list.md)**, or a problem of your choice, formulating it as a machine learning problem to work on early and receive feedback from project mentors. 

Once you have identified the problem, it can be useful to research on some prior work or research on the related topics. Another important aspect of your project is to identify one or several datasets suitable for your chosen problem. If that data needs considerable pre-processing  to suit your task, or that you intend to collect the needed data yourself, bear in mind that data collection is only one part of the entire project scope, but can often take up sizeable amount of time. You are still expected to have solid methodology and discussion of results, so pace your project accordingly.

Your project proposal should include the following information:

- Formulation[[1\]](#_ftn1): Is the problem suited for a ML solution? What is the alternative? Any heuristic you can use?  What are the appropriate success metrics? How do you frame it as machine learning problem? What are the suitable metrics to use for your model? 
- Dataset: What kind of data you need and how do you plan to collect them? If it is some existing dataset (e.g., from Kaggle), include reference link to the dataset and provide some discussion how the data was collected by the author/contributor of the dataset. How relevant is this dataset to your chosen problem?
- Methods: What kind of ML approach (e.g., supervised/unsupervised or others) are you planning to use?  For PDC1, restrict yourself to Classical ML algorithms only.
- Deployment: How do you intend to use the model? Provide an overview of how the model is used in the overall solution. You can illustrate this with a system architecture diagram. 

#### Grading Rubrics for Project Proposal

|                    | Below Expectation                                                                                                                                                                                                                                                                                                           | Approaching Expectation                                                                                                                                                                                                                | Meeting Expectation                                                                                                                                                                                                                                                                                                                                                                             |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|                    | 0 - 6 marks                                                                                                                                                                                                                                                                                                                 | 7 - 12 marks                                                                                                                                                                                                                           | 13 - 15 marks                                                                                                                                                                                                                                                                                                                                                                                   |
| *Project Proposal* | <ul><li>No or minimal formulation of the problem. </li><li>No reference to dataset is provided or dataset given is not relevant to the problem. </li><li>No ML approach is provided or incorrect approach proposed for the problem</li><li>No deployment scenario provided or lack of details on deployment </li></ul><br/> | <ul><li>Correct problem formulation is provided.</li><li>Dataset provided is somewhat relevant to the problem.</li><li>Appropriate ML approach is proposed</li><li>Some discussion on how the model is to be deployed. </li></ul><br/> | <ul><li>Correct  problem formulation with consideration for alternative formulation such as heuristics.</li><li>Dataset provided is relevant with discussion on how the dataset is collected.</li><li>    Correct ML approach proposed with some discussion on other ML approaches. </li><li>Clear and detailed discussion on how the model is deployed in the overall solution.</li></ul><br/> |

## Milestone Report

### Dataset

The Milestone report (one report per team) should describe what you've accomplished so far, and very briefly say what else you plan to do. It should be written as an **“early draft"** of your final report so that you can re-use most of the milestone content in your final report. The milestone report will serve as checkpoint for us to know if you are on the right track and making good progress.

Your milestone report (and final report) should focus on the problem to be solved, exploratoray data analysis, data preparation and feature engineering that can be used for modelling later on.

Please include a section that describes what each team member worked on and contributed to the project OR clearly indicate the name of the member for his/her section in the report. This is to make sure team members are carrying a fair share of the work for projects. If you have any concerns working with one of your project team members, please fill out the optional [teammate evaluation form](https://forms.gle/9YwGsANhiAfvMxWR6) (only seen by the teaching staff) or contact the lecturer directly. Please do not wait until last minute to raise your concerns.

### Experimental Log

You need to maintain an experimental log that captures ALL the experiments you have run (e.g., the different experimental parameters you have tried, the results). This log will be helpful for you to understand what works and what does not. It also helps us to verify that you have performed the said experiments.  You can track the experiments manually using spreadsheet or consider using the experiment tracking tool such as [MLflow](https://mlflow.org/).

### Grading Rubrics

|                  | **Below Expectation**                                                                                                                                                                                                                                                                                                 | **Approaching Expectation**                                                                                                                                                                                                                                                                                                       | **Exceed Expectation**                                                                                                                                                                                                                                                                                                                                                                                                               |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
|                  | 0 - 11 marks                                                                                                                                                                                                                                                                                                          | 12 - 20 marks                                                                                                                                                                                                                                                                                                                     | 21 - 25 marks                                                                                                                                                                                                                                                                                                                                                                                                                        |
| Milestone Report | <ul><li>No description or unclear description of dataset used</li><li>No or minimal data exploration done</li><li>No or minimal data preparation</li><li>Report content lacks clarity and organization</ul><br/> | <ul><li>Clear description of the dataset used</li><li>Some data exploration and visulaization is performed </li><li>Some basic data preparation is done</li><li>Some attempts at feature engineering<li>Content is somewhat organized</li></ul><br/> | <ul><li>Clear description of dataset with some insights provided</li><li>Significant effort in doing data collection</li><li>Significant amount of data exploration done with very insightful discussion</li><li>Significant amount of data preparation done with very insightful discussion</li><li>Significant amount of feature engineering done</li><li>Report content is well-organized and written with good clarity</ul><br/> |

## Final Report

Final project report (one report per team) should not be more than 15 pages, excluding references. It should include the following sections: 

- ML Formulation
  
  - Here you can briefly describe the ML framing of the problem. Clearly state what the input and output is, and the kind of ML model used (e.g., regression, classifier, etc.).  

- Data Preparation & Feature Engineering
  
  - Here you should describe the final prepared data and final feature set used for your modeling. You can refer to your Milestone report to extract relevant information and put in here. If each member has different feature sets suited to his/her choice of modelling technique, use separate subsection for each of the feature sets used

- Modelling and Experiments
  
  - Here you can describe the different models (and corresponding feature set) you have experimented with. This should not be a listing of experiments (and its associated results) you have tried. The listing should be in the experimental logs (see the section on [Experimental Log](#experimental-log). The report should focus on what is your hypothesis, what model you are using to test the hypothesis, error analysis, observations, and performance tuning. 
  - As a team, each member may conduct different experimentations using different algorithms. Each member can describe their experimentations in different subsection and clearly stated the name of the member contributing to the section.

- Deployment / Application
  
  - If you have deployed your model either as part of an application, or a standalone web service, or a demo app (e.g. gradio or streamlit) describe the deployment/application here. Include the application architecture, technology stack you used, and other relevant details.

### Code

Please include a zip file or preferably a link to a Github repository with the code for your final project. You do not have to include the data or additional libraries (so if you submit a zip file, it should not exceed 5MB). The zip file conrains Each team only submits one zip file. Each member may have your own notebook files, please zip them up as a single zip file instead of submitting individually. 

### Grading Rubrics

|                           | **Below Expectation**                                                                                                                                                                                                                                                                                                                                                                                                                          | Approaching Expectation                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Meeting Expectation                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|                           | 0 - 14 marks                                                                                                                                                                                                                                                                                                                                                                                                                                   | 15 - 23 marks                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | 24 - 30 marks                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| Final Report (with codes) | <ul><li>Incorrect or missing ML  formulation</li><li>Minimal discussion of final prepared data and features</li></ul><ul><li>Minimal or no experimentation with different models </li><li>Minimal or no discussion of experimental results</li><li>No experimental log attached</li><li>No deployment</li><li>Writing is incoherent and disorganized</li><li>Codes are missing or incomplete, contains errors, and disorganized</li></ul><br/> | <ul><li>Some writeup on ML formulation</li><li>Some discussion for final prepared data set and features </li><li>Some experimentations of different models are shown</li><li>Some discussion of experimental results with some error analysis and some model tuning</li><li>Codes are somewhat organized</li><li>Some experimental log attached</li><li>Some attempt to deploy the model as a demo</li><li>Writing is  mostly coherent and organized</li><li>Codes are organized, complete and can run successfully without error</li></ul><br/> | <ul><li>Very clear ML formulation </li><li>Very clear discussion of final prepared data and features </li><li>Significant amount of experimentation is demonstrated</li><li>Discussion of experimental results demonstrated good insight and deep understanding of ML concepts</li><li>Significant amount of error analysis is performed and used to improve model performance</li><li>Complete experimental log attached</li><li>Complete application that use the model</li><li>Writing is coherent and organized</li><li>Codes are complete and well-refactored and run without errors</li></ul><br/> |

## Final Presentation

During final presentation, you will be jointly assessed by more than one supervisor to ensure fairness in assessment. Among other things, you are required to show and explain the work you have done. You will be assessed based on your demonstrated understanding of the methodologies used and discussion of the experimental results.

### Grading Rubrics

|                                        | **Below Expectation**                                                                                                          | **Approaching Expectation**                                                                                                            | **Meeting Expectation**                                                                                                                                                |
| -------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|                                        | 0 - 4 marks                                                                                                                    | 5 - 7 marks                                                                                                                            | 8 - 10 marks                                                                                                                                                           |
| *Presentation (Group) (10 marks)*      | <ul><li>No coordination among members</li><li>Incoherent presentation flow</li></ul><br/>                                      | <ul><li>Some coordination among members</li><li>Presentation flow is evident</li></ul><br/>                                            | <ul><li>Good coordination among members</li><li>Presentation flow is clear and very clear task division.</li></ul><br/>                                                |
|                                        | 0 - 9 marks                                                                                                                    | 10 - 16 marks                                                                                                                          | 17 - 20 marks                                                                                                                                                          |
| *Presentation (Individual) (20 marks)* | <ul><li>Unable to present the content or incoherent presentation</li><li>Unable to answer most of the questions</li></ul><br/> | <ul><li>Somewhat clear and coherent presentation</li><li>Able to answer some questions with some hesitation</li></ul><br/>(< 12 marks) | <ul><li> Clear and coherent presentation with demo of application / deployment</li><li>Able to answer all or most of the questions confidently</li><br/>( <= 20 marks) |

## Project mentors

The project teams will be jointly supervised by a group of project mentors. The project mentors and the contact info are listed below.

| Name                              | Email | Phone |
| --------------------------------- | ----- | ----- |
| Mr. Mar Kheng Kok (Module Leader) |       |       |
| Mr. Lee Ching Yuh (Project Mentor)  |       |       |
| Dr. Zhao Zhiqiang (Project Mentor)  |       |       |
| Dr. Brandon Ooi (Project Mentor)  |       |       |

## Project Schedule

| Week | Monday                                                        | Wed                                                                                     | Thur                                                          |
| ---- | ------------------------------------------------------------- | --------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| 13   |                                                               | |**17-Jul-25**<br/> Project Initiation /Discussion (F2F) <br/> (MKK)                       |                                                               
| 14   |                                                               | |**24-Jul-25**<br/> Project Discussion (F2F) - <br/> (MKK) |                                                               
| 15   |                                                               | |**31-Jul-25**<br/> Project Dev / Consultation (Zoom) <br/> (MKK)                           |                                                               
| 16   |                                                               | |**7-Aug-25**<br/> Project Dev / Consultation (Zoom) <br/> (BRO)                            |                                                               
| 17   |                                                               | |**14-Aug-25**<br/> Project Dev/ Consultation (Zoom) - <br/> (BRO) | 
| 18   | **20-Aug-25**<br/> Project Dev / Consultation (Zoom) <br/> (MKK) | **18-Aug-25**<br/> Project Dev / Consultation (Zoom) <br/> (LCY)                           | **21-Aug-25**<br/> Project Dev / Consultation (Zoom only) <br/> (MKK) |
| 19   | **25-Aug-25**<br/> Project Dev / Consultation (Zoom) <br/> (LCY) | **27-Aug-25**<br/> **Project Presentation** (Zoom) <br/> (MKK, BRO, LCY)                          |                                                               |

**Legends* (Zoom)*

- ALL - All tutors
- MKK - Mr. Mar Kheng Kok
- VER - Dr. Veronica Lim
- KLR - Mr. Kee LiRen
- WCH - Mr. Wee Chee Hong
- LCY - Mr. Lee Ching Yuh
- ZZQ - Dr. Zhao Zhiqiang
- BRO - Dr. Brandon Ooi
- JUL - Mr. Julian Addison 
- SOH - Mr. Solomon Soh

[[1\]](#_ftnref1) Refer to the lecture notes on ML framing 
