<img src="https://www.nyp.edu.sg/content/dam/nypcorp/sg/en/common/logo-nyp.svg" alt="nyplogo" width="400"/>

# ITI113 Machine Learning & Operations Project


## Unit Learning Outcomes

- Integrate machine learning knowledge to solve a real-world business problem
- Demonstrate ability to build, deploy and operationalise a practical ML solution
- Build trustworthy machine learning systems with reference to AI governance and responsible AI principles.


## Project Team

You are expected to form a project team of up to 3 members. 

- Each member should own one focus area of either:
  - Model Development 
  - Model Deployment & Operations

- Each member should focus on one area and be able to complete the associated tasks independently. Marks will be deducted for individuals who rely
heavily on others to complete their tasks.
- Each team can have a mix of members on both model development and model deployment & operations, or with the entire team focusing on model development only
- The role of the project mentor is to provide guidance on your project proposal and to make sure you are on the right track in your project.

Please fill up the [online form](https://docs.google.com/forms/d/e/1FAIpQLSdlSpoKG7daouFBJyTZFH90-IgLuqVni4VcPMddrnkDZb0PQw/viewform?usp=sharing&ouid=104511639249216066150) of your project team members.

## Overview of Focus Areas 

| Stage  | Model Development | Model Deployment & Operations  |
|:----------|:----------|:----------|
| Proposal    |The team will identify a business problem of your choice (or from the suggested list of projects) and formulate it as a machine learning problem. Perform AI risk assessment. Identify potential datasets to use for model development | same as Model Development |
| Progress Check | Finalized training datasets, completed EDA and evaluation result of baseline model | Completed data pipeline and experimentation tracking setup and test environment setup | 
| Final Report | Fine-tuned models with error analysis and interpretation of results | Model deployed on MLOps platform, completed checklist for AI governance, demo app deployed |  
| Final Presentation | Highlight key individual contributions and demonstrate generated artifacts with of methodologies, results, and related development work | same as Model Development |


## Deliverables and Assessment Components

This project consists of the following assessment components:

| Assessment components | Group | Individual | Total |
| --------------------- | ----- | ---------- | ----- |
| Project Proposal      | 15%   |            | 15%   |
| Progress Check        | 10%   | 20%        | 25%   |
| Final Report          | 10%   | 20%        | 30%   |
| Final Presentation    | 10%   | 20%        | 25%   |

**Assessment Schedule:**

- Project Proposal - submitted by 26 Jul 23:59
- Progress Check - 14 Aug 
- Final Report - submitted by 28 Aug 23:59
- Final Presentation - 27 Aug (in-class assessment)

***refer to POLITEMALL for most updated schedule***


## Project Proposal

- In the project proposal, your team will pick a business problem of your choice (or from the suggested list of projects) and formulate it as a machine learning problem.
- You are to perform risk assessment of the AI system you are developing. 
- Once you have identified the problem, it can be useful to research on some prior work or research on the related topics. 
- Another important aspect of your project is to identify one or several datasets suitable for your chosen problem. You can either use existing dataset or collect the data yourself. (bear in mind the timeframe given that data collection effort may be significant that will impact your project completion schedule)

### Format

Project proposal should include the following information:

- Formulation[[1\]](#_ftn1): Is the problem suited for a ML solution? What is the alternative? Any heuristic you can use?  What are the appropriate success metrics? How do you frame it as machine learning problem? What are the suitable metrics to use for your model? 
- Dataset: What kind of data you need and how do you plan to collect them? If it is some existing dataset (e.g., from Kaggle), include reference link to the dataset and provide some discussion how the data was collected by the author/contributor of the dataset. 
- Discussion of data governance. 
- Methods: What kind of ML approach (e.g., supervised/unsupervised or others) are you planning to use? 
- Deployment: How do you intend to use the model? Provide an overview of how the model is used in the overall solution. You can illustrate this with a system architecture diagram. 
- AI risk assessment 
- Team members and their focus areas 


#### Grading Rubrics for Project Proposal

|                    | Below Expectation                                                                                                                                                                                                                                                                                                    | Approaching Expectation                                                                                                                                                                                                                | Meeting Expectation                                                                                                                                                                                                                                                                                                                                                                             |
| -- | -- | -- | -- |
|| 0 - <7.5 marks | 7.5 - <12 marks | 12 - 15 marks  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
| *Project Proposal* | <ul><li>No or minimal formulation of the problem. </li><li>No reference to dataset is provided or dataset given is not relevant to the problem. </li><li>No ML approach is provided or incorrect approach proposed for the problem</li><li>No deployment scenario provided or lack of details on deployment </li><li>Little or no risk and impact assessment done</li></ul> | <ul><li>Correct problem formulation is provided.</li><li>Dataset provided is somewhat relevant to the problem.</li><li>Appropriate ML approach is proposed</li><li>Some discussion on how the model is to be deployed. </li><li>Some assessment of the risk and impact</ul><br/> | <ul><li>Correct  problem formulation with consideration for alternative formulation such as heuristics.</li><li>Dataset provided is relevant with discussion on how the dataset is collected.</li><li>    Correct ML approach proposed with some discussion on other ML approaches. </li><li>Clear and detailed discussion on how the model is deployed in the overall solution.</li><li>Very clear assessment of the impact and risk of the AI system</ul><br/> |

## Progress Check 

### Model Development 

You should have evaluated the suitablity of the data and finalized on the dataset. You are expected to perform extensive Exploratory Data Analysis to gain understanding of the data, and performed data cleaning, transformaion and feature engineering. You will work closely with MLOps team to help setup common data pipeline to be used in development and production. 
A baseline model should have been developed and early experimental results documented, and error analysis performed. You shoud log all the experiments using the experiment tracking facility setup by MLOps team. 

### ML Operations & Deployment 

You should have setup the MLOps platform that allows the modelling team to perform their model development and to track their experiments. You should work closely with the model development team to understand their data requirement and setup the data pipeline to ingest, clean, and transform the data suitable for model training and prediction. You should also have partially setup the MLOps platform such as model registry, and CI/CD platform. You should also work with model development to complete the relevant AI governance checklist at this stage of development. 

### Grading Rubrics 

#### Model Development (Individual - 20%)

|   | Below Expectation | Approaching Expectation | Meeting Expectation |
|:----------|:----------|:----------|:----------|
| | (0 - <7.5) | (7.5 - <12) | (12 - 15)|
| Data Understanding & Preprocessing  (15%) | <ul><li>Minimal or no exploratory data analysis</li><li>Minimal or no data preparation done</li></ul> | <ul><li>Some exploratory data analysis done with some discussion</li><li>some data preprocessing done</li></ul> | <ul><li>Signifcant amount of exploratory data analysis with insighful discussion</li><li>Significant amount of data preparation</li></ul> |
| | (0 - < 2.5) | (2.5 - < 4) | (4 - 5)
| Modelling    | <ul><li>Inappropriate choice of algorithms for the chosen problem</li><li>Minimal or no model experimentation is done | <ul><li>appropriate choice of algorithm for the chosen problem</li><li>Some model experimentation is done with reasonable result</li></ul>  | <ul><li>appropriate choice of algorithm with clear justification and consideration of ai governance aspects</li><li>Some early model experimentation results with clear interpretation and good performance exceeding baseline</li></ul> |


#### Model Operations & Deployment (Individual - 20%)

|   | Below Expectation | Approaching Expectation | Meeting Expectation |
|:----------|:----------|:----------|:----------|
| | (0 - <7.5) | (7.5 - <12) | (12 - 15)
| MLOps Pipeline | <ul><li>No data pipeline is defined or or data pipeline has errors</li><li>No experimentation logging setup</li><li>Minimal features or no features setup for MLOps platform</li></ul> | <ul><li>Appropriate data pipeline is setup and works partially</li><li>Experiment logging available</li><li>Model registry is available for model versioning| <ul><li>Complete and working data pipeline</li><li>Extensive logging facility available with dashboard / visualization</li><li>Model registry and CI/CD pipeline is setup</li></ul> |
| | (0 - < 2.5) | (2.5 - < 4) | (4 - 5)
| AI governance checklist   | <ul><li>No checklist or minimal checklist completed</li><li>Explanation given in checklist is irrelevant or contains errors</li></ul> | <ul><li>Some checklist items completed</li><li>Explanation given in checklist is mostly relevant and correct</li></ul>  | <ul><li>Most checklist items relevant for the given project cycle is completed</li><li>Explanation given in the checklist is relevant and correct.</li></ul> |

#### Group (10%)

| | Below Expectation | Approaching Expectation | Meeting Expectation |
|:----------|:----------|:----------|:----------|
| | (0 - <4) | (5 - <8) | (8 - 10) | 
| Team work | Little or no coordination between members in model development process or no coordination between model and mlops members | Some coordination between members in the model development process, or coordination between development operation team in defining the data pipeline, model experimentation tracking and CI/CD pipeline | Very close coordination within the model devvelopment team, or between the model development and operation team in defining the data pipeline, model experimentation tracking and CI/CD pipeline | 


## Final Report

Each team should submit one combined Final report. The report should include the following sections: 

- ML Formulation
  - Here you can briefly describe the ML framing of the problem. Clearly state what the input and output is, and the kind of ML model used (e.g., regression, classifier, etc.).  

- Data Preparation & Feature Engineering
  - Here you should describe the feature set used for your modeling. Describe the insights you gained from the dataset and how you engineer the feature set for modelling. Describe any potential bias and how you mitigate the bias. 

- Modelling and Experiments
  - Here you can describe the different models (and corresponding feature set) you have experimented with. This should not be a listing of experimental results. The report should focus on what is your hypothesis, what model you are using to test the hypothesis, error analysis, observations, and performance tuning. 
  - As a team, each member may conduct different experimentations using different algorithms. Each member can describe their experimentations in different subsection and clearly stated the name of the member contributing to the section.

- ML Operations & Deployment
  - Describe the ML pipeline that has been setup, including the data pipeline, model registry, CI/CD and data and model drift monitoring, and any additional features available
  - describe the demo application, including application architecture, technology stack you used, and other relevant details.

- Test Report 
  - provide test results of relevant tests for your use case, such as fairness, explanability and robusness test (e.g. those generated by AI Verify toolkit)

- AI governance checklist 
  - completed checklist (e.g. report from AI verify toolkit or the ISAGO checklist)

- Project artifacts 
  - link to the git repository for your code (the jupyter notebook) and link to your demo app. 

### Grading Rubrics

#### Model Development (Individual - 20%)

|   | Below Expectation | Approaching Expectation | Meeting Expectation |
|:----------|:----------|:----------|:----------|
| | (0 - <4) | (5 - <8) | (8 - 10)|
| Data (10%) | <ul><li>No or minimal data analysis provided</li></ul> | <ul><li>Good data analysis provided with some insights</li></ul> | <ul><li>Excellent data analysis with very insighful discussion</li><li>Analysis of potential data bias and mitigation techniques</li></ul> |
| | (0 - <4) | (5 - <8) | (8 - 10)
| Modelling (10%) | <ul><li>Little or no explanation of choice of algorithms</li><li>Minimal or no discussion of experimental results | <ul><li>Good explanation of algorithms used</li><li>Good discussion of experimental results</li></ul>  | <ul><li>Excellent discussion of algorithmic choice and the resultant trade-off</li><li>Excellent discussion of the experimental results and the performance tuning done</li></ul> |


#### Model Operations & Deployment (Individual - 20%)

|   | Below Expectation | Approaching Expectation | Meeting Expectation |
|:----------|:----------|:----------|:----------|
| | (0 - <2.5) | (2.5 - <4) | (4 - 5)
| MLOps Pipeline (5%) | <ul><li>No or minimal description of the ML pipeline setup </li></ul> | <ul><li>Clear description of the ML pipeline setup, which supports model development and deployment| <ul><li>Very clear description of the ML pipeline setup to support model development and deployment</li>|
| Demo Application (5%)  | <ul><li>minimal or no description of the application works</li></ul> | <ul><li>Clear description of the application, with explanation of the interfacing with the models</li></ul>  | <ul><li>Very clear description of the application and the features provided, the application architecture including the integration with the models, and description of how it enable continuous training </li></ul> |
| AI governance checklist  (5%) | <ul><li>No checklist or minimal checklist completed</li><li>Explanation given in checklist is irrelevant or contains errors</li></ul> | <ul><li>Some checklist items completed</li><li>Explanation given in checklist is mostly relevant and correct</li></ul>  | <ul><li>Completed checklist for all required items</li><li>Explanation given in the checklist is relevant and correct.</li></ul> |
| Test Result (5%) | No test result given or incomplete test result | Complete and relevant test result given | Complete and relevant test result given and good explanation of the test result | 

#### Group 

| | Below Expectation | Approaching Expectation | Meeting Expectation |
|:----------|:----------|:----------|:----------|
| | (0 - <2.5) | (2.5 - <4) | (4 - 5) | 
| Problem formulation (5%) | Unclear ML formulation | Clear ML formulation, and includes heuristics | Very clear ML formulation, with heuristics, and discussion of metrics used to measure success | 
| Team work (5%)| Inconsistent report formatting | somewhat consistent report formatting | very consistent report formatting with clear indication of contribution of each members |  


## Final Presentation

During final presentation, you will be jointly assessed by more than one supervisor to ensure fairness in assessment. Among other things, you are required to show and explain the work you have done. You will be assessed based on your demonstrated understanding of the methodologies used and discussion of the experimental results.



### Grading Rubrics

| | Below Expectation | Approaching Expectation | Meeting Expectation |
|:----------|:----------|:----------|:----------|
| | 0 - <2.5  | 2.5 - <4 | 4 - 5|
| Presentation (Group) (5%) | <ul><li>No coordination among members</li><li>Incoherent presentation flow</li></ul><br/>| <ul><li>Some coordination among members</li><li>Presentation flow is evident</li></ul><br/> | <ul><li>Good coordination among members</li><li>Presentation flow is clear and very clear task division.</li></ul><br/>
| | 0 - <10 | 10 - <16 | 16 - 20 | 
| Presentation (Individual) (20 %) | <ul><li>Unable to present the content or incoherent presentation</li><li>Unable to answer most of the questions</li></ul> | <ul><li>Somewhat clear and coherent presentation</li><li>Able to answer some questions with some hesitation</li></ul> | <ul><li> Clear and coherent presentation with demo of application / deployment</li><li>Able to answer all or most of the questions confidently</li></ul> |

## Project mentors

The project teams will be jointly supervised by a group of project mentors. The project mentors and the contact info are listed below.

| Name                              | Contact |
|:----------|:----------|
| Mr. Mar Kheng Kok (Module Leader) | refer to POLITEMALL |
| Mr. Lee Ching Yuh (Project Mentor) | refer to POLITEMALL |
| Dr. Brandon Ooi(Project Mentor)  | refer to POLITEMALL |
| Dr. Zhao Zhiqiang (Project Mentor) | refer to POLITEMALL |
| Mr. Solomon Soh (Project Mentor) | refer to POLITEMALL | 

## Project Schedule


| Week | Monday | Wed | Thur|
|:----------|:----------|:----------|:----------|
| 13 | | |**17-Jul-25**<br/> Project Initiation / Consultation (F2F) <br/> (MKK/BRO) |                                                               
| 14 | | |**24-Jul-25**<br/> Project Consultation (F2F) - <br/> (MKK/ZZQ) |                                                               
| 15 | | |**31-Jul-25**<br/> Project Dev / Consultation (Zoom) <br/> (MKK/BRO) |                                                               
| 16 | | |**7-Aug-25**<br/> Project Dev / Consultation (Zoom, by appointment only) <br/> (MKK) |                                                               
| 17 | | |**14-Aug-25**<br/> Progress Check (F2F) - <br/> (MKK/LCY/BRO/ZZQ) | 
| 18 | **18-Aug-25**<br/> Project Dev / Consultation (Zoom, by appointment only) <br/> (MKK) | **20-Aug-25**<br/> Project Dev / Consultation (Zoom, by appointment only) <br/> (MKK)| **21-Aug-25**<br/> Project Dev / Consultation (Zoom, by appointment only) <br/> (MKK) |
| 19   | **25-Aug-25**<br/> Project Dev / Consultation (Zoom, by appointment only) <br/> (MKK) | **27-Aug-25**<br/> **Project Presentation** (F2F) <br/> (MKK/LCY/BRO/ZZQ) | **28-Aug-25** <br/> *Final Repot Submission* |


**Legends**

- ALL - All tutors
- MKK - Mr. Mar Kheng Kok
- LCY - Mr. Lee Ching Yuh
- ZZQ - Dr. Zhao Zhiqiang
- BRO - Dr. Brandon Ooi
- SOL - Mr. Solomon Soh

[[1\]](#_ftnref1) Refer to the Lesson 3 lecture notes on ML framing 
