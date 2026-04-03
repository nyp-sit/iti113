<img src="https://www.nyp.edu.sg/content/dam/nypcorp/sg/en/common/logo-nyp.svg" alt="nyplogo" width="400"/>

# ITI113 Machine Learning & Operations Project


## Unit Learning Outcomes

- Integrate machine learning knowledge to solve a real-world business problem
- Demonstrate ability to build, deploy and operationalise a practical ML solution
- Build trustworthy machine learning systems with reference to AI governance and responsible AI principles.


## Project Team

You are expected to form a project team of up to 3 members. 

- Each member should take ownership and lead his/her primary or focus area(s) (refer to later sections on descriptions of focus areas)
- Each member should be able to deliver his/her focus area(s) while providing support in other areas, and the team should complete all the associated tasks.
- Each team is expected work professionally and amicably. Marks will be deducted for individuals who rely heavily on others to complete their tasks, and/or for teams that do not work well together.
- The role of the project mentor is to provide guidance on your project proposal and to make sure you are on the right track in your project (not expected to settle disputes or disagreements in teams)

Please fill up the [online form](https://docs.google.com/forms/d/e/1FAIpQLSeD-6n_YYT-DeoNPcEv0u6HoiTz-bfNkQJJaIFh70sArY3prQ/viewform?usp=preview) of your project team members.

## Overview of Focus Areas 

| Assessment Stage | A (Data & EDA) | B (Model Dev) | C (MLOps) | D (Analysis & Comm) | AI Governance | Expected Outputs |
|-----------------|---------------|--------------|-----------|---------------------|---------------|------------------|
| **Proposal** | Problem framing, dataset identification | Define ML approach (baseline idea) | High-level pipeline design | Problem justification & business context | Initial AI risk assessment | Problem statement, dataset plan, risks identified |
| **Progress Check** | Completed EDA, cleaned dataset | Baseline model + initial evaluation | Data pipeline + experiment tracking setup | Initial results interpretation | Identify potential bias / data issues | EDA notebook, baseline results, pipeline setup |
| **Final Report** | Final dataset & feature engineering | Fine-tuned models + comparison (if applicable) | Deployment (endpoint/app), pipeline completed | Error analysis, insights, interpretation | Full governance checklist (fairness, explainability, monitoring) | Final report, deployed system, governance documentation |
| **Final Presentation** | Summary of dataset & approach | Key model results | System demo (deployment) | Clear communication of insights | Governance considerations explained | Demo + presentation of end-to-end system |

## Proposed Tasks / Workload Allocation for Team Members

| Team Size | Student Role | Primary Responsibility | A (Data & EDA) | B (Model Dev) | C (MLOps) | D (Analysis & Comm) | AI Governance |
|----------|-------------|------------------------|----------------|---------------|-----------|---------------------|---------------|
| **1 Student** | Full Stack ML | A + B + C + D | ✅ Full | ✅ Full | ✅ Full | ✅ Full | ✅ Full |
| **2 Students** | Student 1 | Model Development (B) | ✅ Main | ✅ Main | ◑ Support | ◑ Partial | ◑ Model-level (bias, explainability) |
|  | Student 2 | MLOps & Deployment (C) | ◑ Support | ◑ Support | ✅ Main | ◑ Partial | ✅ System-level (monitoring, logging, control) |
| **3 Students** | Student 1 | Model Development (Model A) | ✅ Main | ✅ Main | ◑ Support | ◑ Partial | ◑ Model-level (fairness, bias checks) |
|  | Student 2 | Model Development (Model B) | ✅ Main | ✅ Main | ◑ Support | ◑ Partial | ◑ Model-level (comparison, explainability) |
|  | Student 3 | MLOps & Deployment (C) | ◑ Support | ◑ Support | ✅ Main | ◑ Partial | ✅ System-level (governance, monitoring, compliance) |

Performance Expectation:
- Each team must demonstrate progress across all components (A–D and AI Governance) at every assessment stage.  
- Larger teams are expected to show greater depth (e.g., multi-model comparison, pipeline automation, monitoring).  
- The expected problem complexity, model performance, and level of detailed analysis and insights should increase proportionally with team size.
- AI Governance must be addressed progressively from risk identification (Proposal) to full implementation (Final Report).

## Deliverables and Assessment Components

This project consists of the following assessment components:

| Assessment Component | Recommended Focus + Governance) | Overall (%) | Individual (%) | Total (%) |
|---------------------|--------------------------|-----------|----------------|-----------|
| **Project Proposal** | A (Problem & Data), D (Justification), Governance (Risk) | 20% | – | 20% |
| **Progress Check** | A (EDA), B (Baseline Model), C (Pipeline Setup), Governance (Bias Awareness) | 5% | 20% | 25% |
| **Final Report** | B (Tuned Models), C (Deployment), D (Analysis), Governance (Full Checklist) | 10% | 20% | 30% |
| **Final Presentation** | D (Communication), B (Results), C (System Demo), Governance (Explanation) | 5% | 20% | 25% |


**Assessment Schedule:**

- Project Proposal + Checklist - submitted by Sun 26 Jul 2026 23:59
- Project Milestone Progress Check - Submitted by Sun 16 Aug 2026 23:59  
- Final Report - submitted by Thu 27 Aug 2026 23:59
- Final Presentation - Wed 26 Aug 2026 (Online assessment)

***refer to POLITEMALL for most updated schedule***


## Project Proposal (20%)

- In the project proposal, your team will pick a business problem of your choice (or from the suggested list of projects) and formulate it as a machine learning problem.
- You are to perform risk assessment of the AI system you are developing. 
- Once you have identified the problem, it can be useful to research on some prior work or research on the related topics. 
- Another important aspect of your project is to identify one or several datasets suitable for your chosen problem. You can either use existing dataset (recommended) or collect the data yourself. (bear in mind the timeframe given that data collection effort may be significant that will impact your project completion schedule)

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

|  | Not Competent | Developing | Functional | Competent | Proficient |
|--|--|--|--|--|--|
|  | 0 – <10 marks | 10 – <12 marks | 12 – <14 marks | 14 – <16 marks | 16 – 20 marks |
| **Project Proposal** | * No or minimal formulation of the problem.<br>* No reference to dataset is provided or dataset given is not relevant to the problem.<br>* No ML approach is provided or incorrect approach proposed for the problem.<br>* No deployment scenario provided or lack of details on deployment.<br>* Little or no risk and impact assessment done. | * Basic problem formulation but lacks clarity.<br>* Dataset loosely relevant with minimal explanation.<br>* Basic ML approach suggested with weak justification.<br>* Limited discussion on deployment.<br>* Superficial risk and impact assessment. | * Correct problem formulation is provided.<br>* Dataset provided is somewhat relevant to the problem.<br>* Appropriate ML approach is proposed.<br>* Some discussion on how the model is to be deployed.<br>* Some assessment of the risk and impact. | * Well-defined problem formulation with consideration for alternative approaches (e.g. heuristics).<br>* Dataset provided is relevant with discussion on how the dataset is collected.<br>* Correct ML approach proposed with some discussion on other ML approaches.<br>* Clear and structured discussion on how the model is deployed in the overall solution.<br>* Clear assessment of the impact, risks, and limitations of the AI system. | * Strong and well-justified problem formulation with critical evaluation of alternatives.<br>* High-quality dataset with detailed discussion on collection, limitations, and suitability.<br>* Well-justified ML approach with comparison of multiple approaches.<br>* Detailed and realistic deployment architecture integrated into the solution.<br>* Comprehensive AI governance: clear discussion of risks, bias, ethical considerations, and mitigation strategies. |


## Progress Check (25%)

### Model Development 

You should have evaluated the suitablity of the data and finalized on the dataset. You are expected to perform extensive Exploratory Data Analysis to gain understanding of the data, and performed data cleaning, transformaion and feature engineering. You will work closely with MLOps team to help setup common data pipeline to be used in development and production. 
A baseline model should have been developed and early experimental results documented, and error analysis performed. You shoud log all the experiments using the experiment tracking facility setup by MLOps team. 

### ML Operations & Deployment 

You should have setup the MLOps platform that allows the modelling team to perform their model development and to track their experiments. You should work closely with the model development team to understand their data requirement and setup the data pipeline to ingest, clean, and transform the data suitable for model training and prediction. You should also have partially setup the MLOps platform such as model registry, and CI/CD platform. You should also work with model development to complete the relevant AI governance checklist at this stage of development. 

### Grading Rubrics 

#### Model Development Focus (Individual - 20%)

| Criteria | Not Competent | Developing | Functional | Competent | Proficient |
|--|--|--|--|--|--|
|  | 0 – <7.5 marks | 7.5 – <9 marks | 9 – <10.5 marks | 10.5 – <12 marks | 12 – 15 marks |
| **Data Understanding & Preprocessing (15%)** | * Minimal or no exploratory data analysis.<br>* Minimal or no data preparation. | * Limited EDA with superficial observations.<br>* Basic preprocessing with gaps or errors. | * Adequate EDA with some insights.<br>* Reasonable preprocessing completed. | * Good EDA with clear insights and patterns identified.<br>* Well-executed preprocessing and feature preparation. | * Extensive and insightful EDA uncovering non-obvious patterns.<br>* Advanced preprocessing and feature engineering with strong justification. |
|  | 0 – <2.5 marks | 2.5 – <3 marks | 3 – <3.5 marks | 3.5 – <4 marks | 4 – 5 marks |
|  **Modelling (5%)**  | * Inappropriate or no model used.<br>* No meaningful experimentation. | * Basic model selected with weak justification.<br>* Limited experimentation with poor results. | * Appropriate model selected.<br>* Some experimentation with reasonable results. | * Appropriate model with clear justification and consideration of AI governance.<br>* Good performance exceeding baseline with clear interpretation. | * Strong model selection with comparison or tuning.<br>* High performance with deep interpretation, limitations discussed, and governance considerations clearly integrated. |


#### Model Operations & Deployment Focus (Individual - 20%)

| Criteria | Not Competent | Developing | Functional | Competent | Proficient |
|--|--|--|--|--|--|
|  | 0 – <7.5 marks | 7.5 – <9 marks | 9 – <10.5 marks | 10.5 – <12 marks | 12 – 15 marks |
| **MLOps Pipeline (15%)** | * No data pipeline is defined or data pipeline has errors.<br>* No experiment logging setup.<br>* Minimal or no features setup for MLOps platform. | * Basic pipeline defined but incomplete or partially working.<br>* Limited experiment logging with minimal functionality.<br>* Basic MLOps features setup but lacks integration. | * Appropriate data pipeline is setup and works partially.<br>* Experiment logging available.<br>* Model registry available for versioning. | * Complete and working data pipeline.<br>* Extensive logging facility available with dashboard / visualization.<br>* Model registry and partial CI/CD pipeline setup. | * Fully automated and robust data pipeline.<br>* Advanced logging, monitoring, and visualization dashboards.<br>* Complete model registry with CI/CD pipeline and deployment automation. |
|  | 0 – <2.5 marks | 2.5 – <3 marks | 3 – <3.5 marks | 3.5 – <4 marks | 4 – 5 marks |
| **AI Governance Checklist (5%)** | * No checklist or minimal checklist completed.<br>* Explanation in checklist is irrelevant or contains errors. | * Basic checklist with limited items completed.<br>* Explanation partially relevant but lacks clarity. | * Some checklist items completed.<br>* Explanation mostly relevant and correct. | * Most checklist items relevant for the project cycle completed.<br>* Explanation is clear and relevant. | * Comprehensive checklist fully aligned to project lifecycle.<br>* Clear, accurate, and well-justified explanations including risks, bias, and mitigation strategies. |

#### Overall / Group (5%)

| Criteria | Not Competent | Developing | Functional | Competent | Proficient |
|--|--|--|--|--|--|
|  | 0 – <2.5 Marks | 2.5 – <3 Marks | 3 – <3.5 Marks | 3.5 – <4 Marks| 4 – 5 Marks |
| **Teamwork (Multi-member Teams)** | * Little or no coordination between members in model development process.<br>* No coordination between model and MLOps members. | * Limited coordination between members.<br>* Minimal collaboration between model and operations roles. | * Some coordination between members in model development.<br>* Basic coordination between development and operations teams. | * Good coordination within team across model development and MLOps.<br>* Clear collaboration in defining pipeline, tracking, and CI/CD. | * Excellent coordination across all team members.<br>* Seamless integration between model development and MLOps (pipeline, tracking, CI/CD fully aligned). |
| **Integration (1-Person Team)** | * Components are disconnected with little integration.<br>* Workflow is incomplete or inconsistent. | * Some components connected but workflow lacks clarity.<br>* Integration is partial and inconsistent. | * Components are generally connected.<br>* Workflow is functional but may lack smoothness. | * Well-integrated components across A–D.<br>* Smooth and logical workflow from data to deployment. | * Fully integrated end-to-end system.<br>* Seamless flow across all components (A–D + governance) with clear design, consistency, and robustness. |

- For 1-person teams, assessment focuses on system integration quality, coherence, and smooth workflow across all components instead of team coordination.

## Final Report (30%)

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

**Note** 
- clearly mark the section contributed by each member
- use the font size of 12, times new roman, single column.
- the main content (excluding cover page, TOC and appendix) should not be more than 20 pages. Only highlight the key info, the details can be parked under appendix.
  
### Grading Rubrics

#### Model Development Focus (Individual - 20%)

| Criteria | Not Competent | Developing | Functional | Competent | Proficient |
|--|--|--|--|--|--|
|  | 0 – <4 marks | 4 – <6 marks | 6 – <7 marks | 7 – <8 marks | 8 – 10 marks |
| **Data (10%)** | * No or minimal data analysis provided. | * Basic data analysis with limited insights. | * Good data analysis provided with some insights. | * Strong data analysis with clear and meaningful insights.<br>* Some discussion of potential data bias. | * Excellent data analysis with very insightful discussion.<br>* Clear analysis of potential data bias and mitigation techniques. |
|  | 0 – <4 marks | 4 – <6 marks | 6 – <7 marks | 7 – <8 marks | 8 – 10 marks |
| **Modelling (10%)** | * Little or no explanation of choice of algorithms.<br>* Minimal or no discussion of experimental results. | * Basic explanation of algorithm choice.<br>* Limited discussion of experimental results. | * Good explanation of algorithms used.<br>* Good discussion of experimental results. | * Strong explanation of algorithm choice with some discussion of trade-offs.<br>* Clear discussion of experimental results and performance. | * Excellent discussion of algorithmic choice and trade-offs.<br>* Excellent discussion of experimental results and performance tuning. |

#### Model Operations & Deployment Focus (Individual - 20%)

| Criteria | Not Competent | Developing | Functional | Competent | Proficient |
|--|--|--|--|--|--|
|  | 0 – <2 marks | 2 – <3 marks | 3 – <3.5 marks | 3.5 – <4 marks | 4 – 5 marks |
| **MLOps Pipeline (5%)** | * No or minimal description of the ML pipeline setup. | * Basic description of pipeline with limited clarity.<br>* Weak linkage to model development or deployment. | * Clear description of the ML pipeline setup, supporting model development and deployment. | * Well-structured pipeline with clear explanation of components and workflow.<br>* Good linkage to model lifecycle. | * Very clear and comprehensive pipeline architecture.<br>* Demonstrates automation, scalability, and strong integration across development and deployment. |
|  | 0 – <2 marks | 2 – <3 marks | 3 – <3.5 marks | 3.5 – <4 marks | 4 – 5 marks |
| **Demo Application (5%)** | * Minimal or no description of how the application works. | * Basic description of the application.<br>* Limited explanation of interaction with models. | * Clear description of the application with explanation of interfacing with the models. | * Well-described application with clear architecture and integration with models.<br>* Good explanation of system flow. | * Very clear and detailed application architecture.<br>* Strong integration with models and explanation of continuous training or updates. |
|  | 0 – <2 marks | 2 – <3 marks | 3 – <3.5 marks | 3.5 – <4 marks | 4 – 5 marks |
| **AI Governance Checklist (5%)** | * No checklist or minimal checklist completed.<br>* Explanation is irrelevant or incorrect. | * Basic checklist with limited items.<br>* Explanation partially correct. | * Some checklist items completed.<br>* Explanation mostly relevant and correct. | * Most checklist items completed and relevant.<br>* Explanation is clear and appropriate. | * Comprehensive checklist aligned to full project lifecycle.<br>* Clear, accurate explanation including risks, bias, and mitigation strategies. |
|  | 0 – <2 marks | 2 – <3 marks | 3 – <3.5 marks | 3.5 – <4 marks | 4 – 5 marks |
| **Test Results (5%)** | * No test results or incomplete results. | * Limited or partially relevant test results. | * Complete and relevant test results provided. | * Good test results with clear explanation and evaluation. | * Comprehensive test results with strong analysis, validation, and interpretation. |

#### Overall / Group (10%)

| Criteria | Not Competent | Developing | Functional | Competent | Proficient |
|--|--|--|--|--|--|
|  | 0 – <2 marks | 2 – <3 marks | 3 – <3.5 marks | 3.5 – <4 marks | 4 – 5 marks |
| **Problem Formulation (5%)** | * Unclear or incorrect ML formulation. | * Basic ML formulation with limited clarity.<br>* Minimal use of heuristics. | * Clear ML formulation provided.<br>* Includes some heuristics. | * Well-defined ML formulation with appropriate heuristics.<br>* Some discussion of evaluation metrics. | * Very clear and well-justified ML formulation.<br>* Strong use of heuristics and clear discussion of evaluation metrics to measure success. |
|  | 0 – <2 marks | 2 – <3 marks | 3 – <3.5 marks | 3.5 – <4 marks | 4 – 5 marks |
| **Overall Report (5%)** | * Inconsistent or poorly structured report formatting.<br>* No clear contribution from members. | * Somewhat consistent report formatting.<br>* Limited clarity of member contributions. | * Generally consistent report formatting.<br>* Basic indication of member contributions. | * Very consistent report formatting.<br>* Clear indication of contributions of each member. | * Highly consistent and professional report formatting.<br>* Clear, detailed, and well-balanced contribution from each member. |

## Final Presentation (25%)

During final presentation, you will be jointly assessed by more than one supervisor to ensure fairness in assessment. Among other things, you are required to show and explain the work you have done. You will be assessed based on your demonstrated understanding of the methodologies used and discussion of the experimental results.

### Grading Rubrics

| Criteria | Not Competent | Developing | Functional | Competent | Proficient |
|--|--|--|--|--|--|
|  | 0 – <2 marks | 2 – <3 marks | 3 – <3.5 marks | 3.5 – <4 marks | 4 – 5 marks |
| **Presentation (Group) (5%)** | * No coordination among members.<br>* Incoherent presentation flow. | * Limited coordination among members.<br>* Presentation flow is weak or inconsistent. | * Some coordination among members.<br>* Presentation flow is evident. | * Good coordination among members.<br>* Presentation flow is clear with defined task division. | * Excellent coordination among members.<br>* Seamless presentation flow with clear and well-balanced task division. |
| **Presentation (1-Person Team) (5%)** | * Components are disconnected.<br>* Presentation lacks structure and flow. | * Some structure but flow is inconsistent.<br>* Transitions between sections are weak. | * Generally coherent presentation.<br>* Flow is functional with minor gaps. | * Well-structured presentation with smooth transitions.<br>* Clear logical flow across all components. | * Fully integrated, seamless presentation.<br>* Strong narrative flow linking all components (A–D + governance) clearly and coherently. |
|  | 0 – <10 marks | 10 – <13 marks | 13 – <16 marks | 16 – <18 marks | 18 – 20 marks |
| **Presentation (Individual) (20%)** | * Unable to present content or presentation is incoherent.<br>* Unable to answer most questions. | * Basic presentation with limited clarity.<br>* Able to answer some questions with hesitation. | * Clear and generally coherent presentation.<br>* Able to answer most questions. | * Clear and confident presentation with good structure.<br>* Able to answer questions well. | * Highly clear, confident, and engaging presentation.<br>* Demonstrates strong understanding with ability to answer all or most questions confidently.<br>* Includes effective demo of application / deployment. |


## Project mentors

The project teams will be jointly supervised by a group of project mentors. The project mentors and the contact info are listed below.

| Name                              | Contact |
|:----------|:----------|
| Mr. Mar Kheng Kok (Course Manager / Project Mentor) | refer to POLITEMALL |
| Dr. Leong Siang Huei (Module Leader / Project Mentor) | refer to POLITEMALL |
| Dr. Brandon Ooi (Project Mentor)  | refer to POLITEMALL |
| Mr. Wee Chee Hong (Project Mentor)  | refer to POLITEMALL |
| Mr. Lee Ching Yuh (Project Mentor)  | refer to POLITEMALL |
| Mr. Steven Ng (Project Mentor) | refer to POLITEMALL |

## Project Schedule


| Week | Monday | Wednesday | Thursday |
|:----------|:----------|:----------|:----------|
| 13 | | |**16-Jul-26**<br/> Project Initiation / Consultation (F2F) <br/> (MKK/LSH) |                                                               
| 14 | | |**23-Jul-26**<br/> Project Consultation (F2F) - <br/> (MKK/LSH) |                                                               
| 15 | | |**30-Jul-26**<br/> Project Dev / Consultation (Zoom) <br/> (MKK/LSH) |                                                               
| 16 | | |**6-Aug-26**<br/> Project Dev / Consultation (Zoom, by appointment only) <br/> (LSH) |                                                               
| 17 | | |**13-Aug-26**<br/> Project Dev / Consultation (Zoom, by appointment only - <br/> (MKK) | 
| 18 | **17-Aug-26**<br/> Progress Check (Zoom) <br/> (MKK/LSH) | **19-Aug-26**<br/> Project Dev / Consultation (Zoom, by appointment only) <br/> (LSH)| **20-Aug-26**<br/> Project Dev / Consultation (Zoom, by appointment only) <br/> (MKK) |
| 19   | **24-Aug-26**<br/> Project Dev / Consultation (Zoom) <br/> (MKK/LSH) | **26-Aug-26**<br/> **Project Presentation** (**Zoom**) <br/> (MKK/LCY/LSH/BRO/WCH/SNG) | **27-Aug-26** <br/> *Final Repot Submission* |


**Legends**

- ALL - All tutors
- MKK - Mr. Mar Kheng Kok
- LCY - Mr. Lee Ching Yuh
- LSH - Dr. Leong Siang Huei
- BRO - Dr. Brandon Ooi
- WCH - Mr. Wee Chee Hong
- SNG - Mr. Steven Ng


[[1\]](#_ftnref1) Refer to the Lesson 3 lecture notes on ML framing 
